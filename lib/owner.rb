require 'pry'

class Owner
  # code goes here
  attr_accessor :name, :pets
  attr_reader :species
  @@all = []
  @@count = 0

  def initialize(name)
    @name = name
    @@all << self
    @@count += 1
    @species = "human"
    @pets = {fishes: [], dogs: [], cats: []}
  end

  def say_species
    "I am a #{@species}."
  end

  def buy_fish(name)
    fish = Fish.new(name)
    fish.owner = self
    @pets[:fishes] << fish
  end

  def feed_fish
    self.pets[:fishes].each {|fish| fish.mood = "happy"}
  end

  def buy_cat(name)
    cat = Cat.new(name)
    cat.owner = self
    @pets[:cats] << cat
  end

  def play_with_cats
    self.pets[:cats].each {|cat| cat.mood = "happy"}
  end

  def buy_dog(name)
    dog = Dog.new(name)
    dog.owner = self
    @pets[:dogs] << dog
  end

  def walk_dogs
    self.pets[:dogs].each {|dog| dog.mood = "happy"}
  end

  def sell_pets
    @pets.each do |pet_type, pet_array|
      pet_array.each do |pet|
        pet.mood = "nervous"
      end
    end
    @pets.clear
  end

  def list_pets
    fishCount = @pets[:fishes].count
    dogCount = @pets[:dogs].count
    catCount = @pets[:cats].count
    binding.pry
    return "I have #{fishCount} fish, #{dogCount} dog(s), and #{catCount} cat(s)."
  end

  def self.all
    @@all
  end

  def self.count
    @@count
  end

  def self.reset_all
    @@all = []
    @@count = 0
  end

end
