require_relative 'base_decorator'

class TrimmerDecorator < BaseDecorato
  def correct_name
    return super.slice(0..9) unless super.length <= 10
    super
  end
end
