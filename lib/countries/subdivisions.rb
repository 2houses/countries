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

  def all
    @subdivisions
  end

  def find(iso3)
    Subdivision.new(@subdivisions[iso3], iso3)
  end

  alias :[] :find

  def find_by_name(name)
    subdivision = all.detect{|sub| sub[1]["name"] == name }
    find(subdivision[0])
  end

  def find_by_parameterized_name(parameterized_name)
    subdivision = all.detect{|sub| sub[1]["name"].parameterize == parameterized_name }
    find(subdivision[0])
  end

  def find_by_translation(translated_name)
    subdivision = all.detect{|sub| sub[1]['translations'].has_value?(translated_name) }
    find(subdivision[0])
  end

  def find_by_parameterized_translation(parameterized_translated_name)
    subdivision = all.detect{|sub| sub[1]['translations'].detect{ |sub2| sub2[1].parameterize == parameterized_translated_name } }
    find(subdivision[0])
  end

end