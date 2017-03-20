class TopRecipes::Scraper

  def self.scrape_recipes_page(url)
    Nokogiri::HTML(open(url))
  end

  def self.scrape_and_create_recipes_food2fork
    self.scrape_recipes_page("http://food2fork.com/").css("div.img-polaroid").each do |r|
      name = r.css("span.recipe-name").text.strip
      recipe = TopRecipes::Recipe.new(name)
      recipe.rating = r.css("span.badge-important").text.strip
      recipe.url = "http://food2fork.com#{r.css("a.recipe-link").attribute("href").value.strip}"
      recipe.author = r.css("span.publisher").text.strip
    end
  end

  def self.scrape_additional_info(recipe)
    raise error if !(recipe.is_a?(TopRecipes::Recipe))
    site = self.scrape_recipes_page("recipe.url")

    recipe.ingredients = site.css("div.span5 ul").text.strip.split("\n\t\t\t\t\n\t\t\t\t ")
    recipe.directions = site.css("div.span5 a")[1].attribute("href").value
  end

end
