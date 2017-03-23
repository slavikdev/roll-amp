# Provides fake data simulating Rails.application.
class FakeRailsApp
  def initialize(assets)
    @assets = assets
  end

  attr_reader :assets
end
