module ISO3166; end

class ISO3166::Subdivision

  def initialize(subdivision, iso3)
    @subdivision = subdivision
    @iso3 = iso3
  end

  def iso3
    @iso3
  end

  alias :code :iso3

  def name
    @subdivision['name']
  end

  def translate(locale)
    @subdivision['translations'] && @subdivision['translations'][locale] || name
  end

end