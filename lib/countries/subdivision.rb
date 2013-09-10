module ISO3166; end

class ISO3166::Subdivision

  def initialize(subdivision)
    @subdivision = subdivision
  end

  def name
    @subdivision['name']
  end

  def translate(locale)
    @subdivision['translations'] && @subdivision['translations'][locale] || name
  end

end