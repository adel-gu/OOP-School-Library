require_relative 'base_decorator'

class CapitalizeDecorator < BaseDecorato
  def correct_name
    super.capitalize()
  end
end