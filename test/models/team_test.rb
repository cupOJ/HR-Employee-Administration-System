require "test_helper"

class TeamTest < ActiveSupport::TestCase
  it 'can save a team' do
    team = Team.new(name: "test")
    assert team.save
  end
end
