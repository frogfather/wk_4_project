require('minitest/autorun')
require('minitest/rg')
require('pry-byebug')
require_relative('../models/merchants')
require_relative('../models/categories')
require_relative('../models/transactions')


class TestTransaction  < Minitest::Test

  def setup
    #create a merchant and category
    @merchant1 = Merchant.new({"name" =>"Sainsburys"})
    @category1 = Category.new({"name" =>"Food"})
    @merchant1.save
    @category1.save
    binding.pry
    @transaction1 = Transaction.new({"trans_date" => "25/11/2016", "amount" => "15.20", "merchant_id" => @merchant1.id, "category_id" => @category1.id})
    @transaction1.save
  end

  def test_trans_merchant_id
    binding.pry
    assert_equal(@merchant1.id, @transaction1.merchant_id)
  end 

  def test_trans_cat_id
    binding.pry
    assert_equal(@category1.id, @transation1.category_id)
  end 
end
