require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('../models/transactions.rb')
require ('pry-byebug')

get '/transactions' do
  #binding.pry
  @transactions = Transaction.all
  if @transactions[0] != nil
  erb(:"transactions/index")
else erb(:"transactions/none")
  end
end

get '/transactions/new' do
  @merchants = Merchant.all()
  @categories = Category.all()
  erb(:"transactions/new")
end

post '/transactions' do
transaction = Transaction.new()
transaction.post
redirect to ("/transactions")
end
