module ISO3166; end

class ISO3166::Subdivisions

  attr_reader :data

  def initialize(country_alpha2)
    filename = File.dirname(__FILE__), '..', 'data', 'subdivisions', "#{country_alpha2}.yaml"
    if File.exist?(File.join(filename))
      @subdivisions ||= YAML.load_file(File.join(filename))
    else
      @subdivisions = {}
    end
  end

  def find(iso3)
    Subdivision.new(@subdivisions[iso3])
  end

  alias :[] :find

end