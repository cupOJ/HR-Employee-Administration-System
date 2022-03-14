require "test_helper"

class TargetTest < ActiveSupport::TestCase
  it 'can save a target' do
    target = Target.new(name: "test")
    assert target.save
  end
end
