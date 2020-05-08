# frozen_string_literal: true

DEFAULT_TIP = 15

DIVIDES_BY_LENGTH = {
  dozens: 5,
  hundreds: 50,
  thousands: 500
}.freeze

class Numeric
  def percent_of(value)
    (self.to_f / 100) * value.to_f
  end
end

class Float
  def percent_of(value)
    (self / 100) * value.to_f
  end
end

def formatted_amount(amount, type)
  divisible_by = DIVIDES_BY_LENGTH[type]

  (amount / divisible_by).round * divisible_by
end

def total_amount(bill)
  tip = DEFAULT_TIP.percent_of(bill)
  amount = bill + tip

  case amount
  when 0...10
    amount.ceil
  when 10...100
    formatted_amount(amount, :dozens)
  when 100...1000
    formatted_amount(amount, :hundreds)
  else
    formatted_amount(amount, :thousands)
  end
end
