# frozen_string_literal: true

class TestResult
  def initialize
    @run_count = 0
    @pass_count = 0
    @fail_count = 0
  end

  def test_passed
    @run_count += 1
    @pass_count += 1
  end

  def test_failed
    @run_count += 1
    @fail_count += 1
  end

  def summary
    "#{@run_count} run, #{@fail_count} failed"
  end
end
