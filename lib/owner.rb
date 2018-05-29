class Owner
  attr_reader :species
  attr_accessor :pets, :name
  @@all = []

  def initialize(owner, species = "human")
    @owner = owner
    @@all << self
    @pets = {fishes: [], cats: [], dogs: []}
    @species = species
  end

  def self.all
    @@all
  end

  def self.count
    @@all.count
  end

  def self.reset_all
    @@all.clear
  end


  def say_species
    "I am a #{@species}."
  end

  def name
    @name
  end

  def buy_fish(name)
    new_fish = Fish.new(name)
    @pets[:fishes].push(new_fish)
  end

  def buy_cat(name)
    new_cat = Cat.new(name)
    @pets[:cats].push(new_cat)
  end

  def buy_dog(name)
    new_dog = Dog.new(name)
    @pets[:dogs].push(new_dog)
  end

  def walk_dogs
    @pets[:dogs].map {|dog| dog.mood = "happy"}
  end

  def play_with_cats
    @pets[:cats].map {|cat| cat.mood = "happy"}
  end

  def feed_fish
    @pets[:fishes].map {|fish| fish.mood = "happy"}
  end

  def sell_pets
    @pets[:dogs].map {|dog| dog.mood = "nervous"}
    @pets[:cats].map {|cat| cat.mood = "nervous"}
    @pets[:fishes].map {|fish| fish.mood = "nervous"}
    @pets[:dogs].clear
    @pets[:cats].clear
    @pets[:fishes].clear
  end

  def list_pets
    "I have #{@pets[:fishes].count} fish, #{@pets[:dogs].count} dog(s), and #{@pets[:cats].count} cat(s)."
  end

end
