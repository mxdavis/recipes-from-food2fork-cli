class TopRecipes::CLI

  @input = nil

  def self.start
    puts "Greetings! Give me a minute while I load up some of the best recipes for you!"

    TopRecipes::Scraper.scrape_and_create_recipes_food2fork

    self.greeting
  end

  def self.greeting
    self.line_break
    puts "Hello! Please ask me to show you some of my latest recipes by typing 'list recipes'. You can also ask me to tell you a joke by typing 'joke'. Type 'exit' or 'bye' when you need to go."

    @input = gets.strip

    self.possible_commands
  end

  def self.list_recipes
    self.line_break
    if TopRecipes::Recipe.top_recipes.size > 0
      puts "Here are the top trending recipes of today:"
      TopRecipes::Recipe.top_recipes.each.with_index(1) do |r, i|
        puts "#{i}. #{r.name} by #{r.author} with a rating of #{r.rating}"
      end

      self.list_recipes_greeting

    else
      puts "Our app is having technical difficulties and we have no recipes :( Maybe you would like to hear a 'joke' instead?"
      @input = gets.strip

      self.possible_commands
    end
  end

  def self.list_recipes_greeting
    self.line_break
    puts "If you would like to see details on a recipe type the recipe's number. Don't forget to hear a 'joke' and of course you can type 'exit' or 'bye' when you need to go."

    @input = gets.strip.downcase

    if @input.to_i > 0
      self.list_details
    else
      self.possible_commands
    end

  end

  def self.list_details
    self.line_break
    recipe = TopRecipes::Recipe.top_recipes[@input.to_i - 1]
    puts "---------- #{recipe.name} ----------"
    self.line_break
    puts "Recipe by #{recipe.author}, rating is #{recipe.rating}"
    self.line_break
    puts "---------- Ingredients: ----------"
    self.list_ingredients(recipe)
    self.line_break
    puts "Directions are at the #{recipe.author}'s site:"
    puts "#{recipe.directions}. Type 'open' to open the link, or any of our other helpful commands: #{self.commands_available}"

    @input = gets.strip

    if @input.downcase.strip == "open"
      system("open #{recipe.directions}")
      self.again_or_close
    else
      self.possible_commands
    end
  end

  def self.line_break
    puts ""
    40.times{print "-"}
    puts ""
    puts ""
  end

  def self.commands_available
    "'list recipes', 'joke', or 'exit'"
  end

  def self.list_ingredients(recipe)
    recipe.ingredients.each.with_index(1) {|i, k| puts "#{k}. #{i}"}
  end


  def self.possible_commands
    case @input.downcase.strip
    when "list recipes"
      self.list_recipes
    when "joke"
      self.joke
    when "exit"
      self.exit_program
    when "bye"
      self.exit_program
    else
      self.no_match
    end
  end

  def self.no_match
    self.line_break
    puts "Sorry! I do not understand what '#{@input}' is! Try one of these commands: #{self.commands_available}"

    @input = gets.strip

    self.possible_commands
  end

  def self.joke
    self.line_break
    puts "#{TopRecipes::Jokes.all.shuffle.first}"
    self.again_or_close
  end

  def self.exit_program
    puts "Bye! We hope to see you again soon!"
  end

  def self.again_or_close
    self.line_break
    puts "Would you like to do something like 'list recipes' or hear a 'joke'? If not, say 'bye'"


    @input = gets.strip
    self.possible_commands
  end

end
