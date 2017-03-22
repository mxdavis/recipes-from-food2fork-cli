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

  def list_ingredients
    self.ingredients.each.with_index(1) {|i, k| puts "#{k}. #{i}"}
  end

  # def self.sort_by_ingredients_amount
  #   @@all.sort! { |a, b| b.ingredients.size <=> a.ingredients.size }
  # end

end
