# frozen_string_literal: true

class TestSuite
  def initialize
    @tests = []
  end

  def add(test)
    @tests << test
  end

  def run(test_result)
    @tests.each { |test| test.run(test_result) }
  end
end
