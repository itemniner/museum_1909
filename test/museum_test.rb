require 'minitest/autorun'
require 'minitest/pride'
require './lib/patron'
require './lib/museum'
require './lib/exhibit'

class MuseumTest < Minitest::Test
  def setup
    @dmns = Museum.new("Denver Museum of Nature and Science")
    @gems_and_minerals = Exhibit.new("Gems and Minerals", 0)
    @dead_sea_scrolls = Exhibit.new("Dead Sea Scrolls", 10)
    @imax = Exhibit.new("IMAX", 15)
  end

  def test_it_exist
    assert_instance_of Museum, @dmns
  end

  def test_it_has_attributes
    assert_equal "Denver Museum of Nature and Science", @dmns.name
  end

  def test_it_has_no_exhibits
    assert_equal [], @dmns.exhibits
  end

  def test_it_can_add_exhibits
    @dmns.add_exhibit(@gems_and_minerals)
    @dmns.add_exhibit(@dead_sea_scrolls)
    @dmns.add_exhibit(@imax)
    assert_equal [@gems_and_minerals, @dead_sea_scrolls, @imax], @dmns.exhibits
  end

  def test_it_can_recommend_exhibits
    @dmns.add_exhibit(@gems_and_minerals)
    @dmns.add_exhibit(@dead_sea_scrolls)
    @dmns.add_exhibit(@imax)
    bob = Patron.new("Bob", 20)
    bob.add_interest("Dead Sea Scrolls")
    bob.add_interest("Gems and Minerals")
    sally = Patron.new("Sally", 20)
    sally.add_interest("IMAX")
    assert_equal [@dead_sea_scrolls, @gems_and_minerals], @dmns.recommend_exhibits(bob)
    assert_equal [@imax], @dmns.recommend_exhibits(sally)
  end

  # def test_it_can_admit_patrons
  #   assert_equal [], @dmns.patrons
  #   bob = Patron.new("Bob", 20)
  #   sally = Patron.new("Sally", 20)
  #   @dmns.admit(bob)
  #   @dmns.admit(sally)
  #   assert_equal [bob, sally], @dmns.patrons
  # end
  #
  #
  # def test_it_can_list_patrons_by_interests
  #   @dmns.add_exhibit(@gems_and_minerals)
  #   @dmns.add_exhibit(@dead_sea_scrolls)
  #   @dmns.add_exhibit(@imax)
  #   assert_equal [], @dmns.patrons
  #   bob = Patron.new("Bob", 20)
  #   bob.add_interest("Dead Sea Scrolls")
  #   bob.add_interest("Gems and Minerals")
  #   sally = Patron.new("Sally", 20)
  #   sally.add_interest("Dead Sea Scrolls")
  #   @dmns.admit(bob)
  #   @dmns.admit(sally)
  #   @dmns.patrons
  #   expected = {@gems_and_minerals => [bob], @dead_sea_scrolls => [bob, sally], @imax => []}
  #   assert_equal expected, @dmns.patrons_by_exhibit_interest
  # end
end
