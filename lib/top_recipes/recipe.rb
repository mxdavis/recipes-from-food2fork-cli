class TopRecipes::Recipe

  attr_accessor :rating, :time, :url, :ingredients, :author, :directions
  attr_reader :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.top_recipes

  end

end
