require 'spec_helper'

describe Payment do
  it { should validate_uniqueness_of(:line_item_id).scoped_to(:service_id) }

  describe '#with' do
    it '#with_pessimistic_lock' do
      threads = []
      30.times do
        threads << Thread.new do
          Payment.with_pessimistic_lock(line_item_id: 1, service_id: 1) do |payment|
            payment.increment(:counter)
          end
        end
      end
      threads.each {|t| t.join }
      payment = Payment.where(line_item_id: 1, service_id: 1).first
      payment.counter.should == 30
    end

    it '#with_optimistic_lock' do
      threads = []
      30.times do
        threads << Thread.new do
          Payment.with_optimistic_lock(line_item_id: 2, service_id: 2) do |payment|
            payment.increment(:counter)
          end
        end
      end
      threads.each {|t| t.join }
      payment = Payment.where(line_item_id: 2, service_id: 2).first
      payment.counter.should == 30
      payment.lock_version.should == 30
    end
  end
end
