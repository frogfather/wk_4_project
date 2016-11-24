require('minitest/autorun')
require('minitest/rg')
require('pry-byebug')
require_relative('../models/merchants')

class TestMerchant < Minitest::Test

  def setup
  @merchant1 = Merchant.new({"name" => "Sainsbury"})
  end

  def test_merchant_name
    assert_equal('Sainsbury', @merchant1.name)
  end

  def test_merchant_id
    #only works on if id = 1
    #run cashbox.sql first!
    @merchant1.save
    assert_equal(1, @merchant1.id)
  end
  
  

end