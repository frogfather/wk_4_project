require('minitest/autorun')
require('minitest/rg')
require('pry-byebug')
require_relative('../models/categories')

class TestCategory < Minitest::Test

  def setup
  Category.delete_all
  @category1 = Category.new({"name" => "Food"})
  @category2 = Category.new({"name" => "Clothes"})
  @category1.save
  @category2.save
  end
  
  def test_category_name
    assert_equal("Food", @category1.name)
  end

end