class TopRecipes::Recipe

  attr_accessor :rating, :url, :ingredients, :author, :directions
  attr_reader :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.top_recipes
    @@all
  end

  def open_directions_url
    system("open #{self.directions}")
  end

end
