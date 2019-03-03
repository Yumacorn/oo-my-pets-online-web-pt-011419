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

  def buy_cat(name)
    cat = Cat.new(name)
    cat.owner = self
    @pets[:cats] << cat
  end

  def buy_dog(name)
    dog = Dog.new(name)
    dog.owner = self
    @pets[:dogs] << dog
  end

  def walk_dogs
    self.pets[:dogs].each {|dog| dog.mood = "happy"}
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
