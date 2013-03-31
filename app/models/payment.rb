class Payment < ActiveRecord::Base
  attr_accessible :line_item_id, :service_id, :counter, :lock_version

  belongs_to :service

  validates :line_item_id, uniqueness: {scope: :service_id}

  # we received a payment with line_item_id and service_id from external API
  # if such payment has already been seen, we should access the existing object
  # if no such payment exists in our db yet, create it
  # in both cases the block parameter payment should be the payment object
  # which the block code will update with data received or whatever
  def self.with_pessimistic_lock(attrs)
    transaction do
      connection.execute("LOCK TABLE #{table_name} IN ACCESS EXCLUSIVE MODE")
      payment = where(attrs).first_or_create
      yield(payment)
      payment.save!
    end
  end

  def self.with_optimistic_lock(attrs)
    begin
      payment = where(attrs).first_or_create
      yield(payment)
      payment.save!
    rescue ActiveRecord::StaleObjectError, ActiveRecord::StatementInvalid, ActiveRecord::RecordInvalid => e
      retry
    end
  end

end