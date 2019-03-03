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
