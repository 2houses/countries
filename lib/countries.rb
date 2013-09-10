require "countries/version"

require 'iso3166'
require 'countries/mongoid' if defined?(Mongoid)
require 'countries/subdivisions'
require 'countries/subdivision'

class Country < ISO3166::Country
end

class Subdivision < ISO3166::Subdivision
end
