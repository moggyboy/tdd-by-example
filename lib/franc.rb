# frozen_string_literal: true

require 'money'

class Franc < Money
  def currency
    'CHF'
  end
end
