module LuhnHelper
  def check_credit_card(credit_card_number)
    (sum_luhn(credit_card_number) % 10) == 0
  end

  def number_with_sum_luhn(credit_card_number)
    (credit_card_number.to_s + sum_luhn(credit_card_number).to_s).to_i
  end

  def sum_luhn(credit_card_number)
    digits = credit_card_number.to_s.scan(/./).map(&:to_i) # integer to array of digits
    odd_digits = digits.values_at(*digits.each_index.select {|i| i.odd?})
    even_digits = digits.values_at(*digits.each_index.select {|i| i.even?})

    sum = odd_digits.sum
    even_digits.each do |digit|
      product = 2 * digit
      product -= 9 if product > 9
      sum += product
    end

    return sum
  end

end