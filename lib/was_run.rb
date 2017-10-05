# frozen_string_literal: true

class WasRun
  attr_reader :was_run

  def initialize(method_name)
    @method_name = method_name
    @was_run = false
  end

  def test_method
    @was_run = true
  end
end
