require('minitest/autorun')
require('minitest/rg')
require('pry-byebug')
require_relative('../models/merchants')

class TestMerchant < Minitest::Test

  def setup
  Merchant.delete_all
  @merchant1 = Merchant.new({"name" => "Sainsbury"})
  @merchant2 = Merchant.new({"name" => "Tesco"})
  end

  

  def test_merchant_name
    assert_equal('Sainsbury', @merchant1.name)
  end

  #def test_merchant_id
    #only works on if id = 1
    #run cashbox.sql first!
  #  @merchant1.save
   # assert_equal(1, @merchant1.id)
  #end

  def test_select_all
  @merchant1.save 
  @merchant2.save
  merchants = Merchant.all
  end


end