# frozen_string_literal: true

require 'money'

class Dollar < Money
  def currency
    'USD'
  end
end
