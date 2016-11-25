require_relative('../models/merchants')
require_relative('../models/categories')
require_relative('../models/transactions')
require('pry-byebug')

Transaction.delete_all
Merchant.delete_all
Category.delete_all

merchant1 = Merchant.new({"name" => "Sainsburys"})
merchant1.save
merchant2 = Merchant.new({"name" => "Tesco"})
merchant2.save
merchant3 = Merchant.new({"name" => "Lidl"})
merchant3.save

category1 = Category.new({"name" => "Food"})
category1.save
category2 = Category.new({"name" => "Wine"})
category2.save
category3 = Category.new({"name" => "Clothes"})
category3.save

transaction1 = Transaction.new({"trans_date" => "11/25/2016", "amount" => "23.43", "merchant_id" => merchant1.id, "category_id" => category1.id})
transaction1.save

