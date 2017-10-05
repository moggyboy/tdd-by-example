# frozen_string_literal: true

require 'test_case'

class WasRun < TestCase
  attr_reader :log

  def initialize(method_name)
    super(method_name)
    @log = []
  end

  def set_up
    @log << 'set_up'
  end

  def tear_down
    @log << 'tear_down'
  end

  def test_method
    @log << 'test_method'
  end
end
