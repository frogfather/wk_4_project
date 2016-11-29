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
transaction = Transaction.new(params)
transaction.save
redirect to ("/transactions")
end

get '/transactions/:id/edit' do
  @merchants = Merchant.all()
  @categories = Category.all() 
  @transaction = Transaction.find(params[:id])
  erb(:"/transactions/edit")
end

post '/transactions/:id' do
  Transaction.update(params)
  redirect to ("/transactions")
end
