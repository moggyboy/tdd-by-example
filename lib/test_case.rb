# frozen_string_literal: true

require 'test_result'

class TestCase
  def initialize(method_name)
    @method_name = method_name
  end

  def run(test_result)
    set_up
    begin
      send(method_name.to_sym)
      test_result.test_passed
    rescue
      test_result.test_failed
    end
    tear_down
  end

  protected

  attr_reader :method_name

  def set_up
    raise NotImplementedError
  end

  def tear_down
    raise NotImplementedError
  end

  def assert_equal(first_value, second_value)
    message = "Asserted that #{first_value} was equal to #{second_value}"
    raise message unless first_value == second_value
  end
end
