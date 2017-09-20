# frozen_string_literal: true

class Expression
  def reduce(_currency)
    raise NotImplementedError
  end
end
