require 'rails_helper'

RSpec.describe KeyLocation, type: :model do
  it "info string should return " do
    key_location = KeyLocation.new()
    key_location.name = 'test'
    result = key_location.getInfoString()
    expect(result).to match(/value=test/)
  end
end

