class Museum
  attr_reader :name, :exhibits, :patrons
  def initialize(name)
    @name = name
    @exhibits = []
    @patrons = []
  end

  def add_exhibit(exhibit)
    @exhibits << exhibit
  end

  def recommend_exhibits(patron)
    array = []
     patron.interests.map do |inte|
     exhibits.map do |exhi|
       require'pry'; binding.pry
       array << inte == exhi.name
end

  end
  end

#   def admit(patron)
#     @patrons << patron
#   end
#
#   def patrons_by_exhibit_interest
# require 'pry'; binding.pry
# exhibits.map do |key|
#
#   end
end
