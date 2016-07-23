class SpaceAge
  ONE_EARTH_YEAR_SECONDS = 31557600.0.freeze

  PLANETS_ROTATION_IN_EARTH_YEARS = {
    earth: 1.0,
    mercury: 0.2408467,
    venus: 0.61519726,
    mars: 1.8808158,
    jupiter: 11.862615,
    saturn: 29.447498,
    uranus: 84.016846,
    neptune: 164.79132
  }.freeze

  PLANETS_ROTATION_IN_EARTH_YEARS.map do |planet, rotation_in_earth_years|
    define_method "on_#{planet}" do
      seconds / ONE_EARTH_YEAR_SECONDS / rotation_in_earth_years
    end
  end

  attr_reader :seconds

  def initialize(seconds)
    @seconds = seconds
  end
end