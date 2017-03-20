class TopRecipes::CLI

  @input = nil

  def self.greeting
    puts "Hello! Please ask me to show you some of my latest recipes by typing 'list recipes'. You can also ask me to tell you a joke by typing 'joke'. You can also type 'exit' or 'bye' when you need to go."

    @input = gets.strip

    self.possible_commands
  end

  def self.list_recipes
    "this is my recipe list"

    self.list_recipes_greeting

  end

  def self.list_recipes_greeting
    puts "If you would like to see details on a recipe type the recipe's number. Don't forget to hear a 'joke' and of course you can type 'exit' or 'bye' when you need to go."

    @input = gets.strip.downcase

    if @input.to_i > 0
      self.list_details
    else
      self.possible_commands
    end

  end

  def self.list_details
    puts "We are listing recipe #{@input}"
    self.again_or_close
  end

  def self.possible_commands
    case @input.downcase
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
    puts "Sorry! I do not understand what '#{@input}' is! Try one of these commands: 'list recipes', 'joke', 'exit'"

    @input = gets.strip

    self.possible_commands
  end


  def self.joke
    "this is a joke"
    self.again_or_close
  end

  def self.exit_program
    "Bye! We hope to see you again soon!"
  end

  def self.again_or_close
    puts "Would you like to do something like 'list recipes' or hear a 'joke'? If not, say 'bye'"

    @input = gets.strip
    self.possible_commands
  end

end
