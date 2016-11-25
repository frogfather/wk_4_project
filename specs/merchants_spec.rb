require('minitest/autorun')
require('minitest/rg')
require('pry-byebug')
require_relative('../models/merchants')

class TestMerchant < Minitest::Test

  def setup
  Merchant.delete_all
  @merchant1 = Merchant.new({"name" => "Sainsbury"})
  @merchant2 = Merchant.new({"name" => "Tesco"})
  @merchant1.save
  @merchant2.save
  end
  
  

  def test_merchant_name
    assert_equal('Sainsbury', @merchant1.name)
  end
 
  def test_update
    @merchant1.name = "Cabbage"
    @merchant1.update
    assert_equal("Cabbage",@merchant1.name)
  end
 
 

end