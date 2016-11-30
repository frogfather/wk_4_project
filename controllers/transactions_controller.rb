require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('../models/transactions.rb')
require ('pry-byebug')

get '/transactions' do
  @transactions = Transaction.all
  @total = Transaction.find_total(@transactions)
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

get '/transactions/:id' do
  @merchants = Merchant.all()
  @categories = Category.all()
  @transaction = Transaction.find(params[:id])
  erb(:"transactions/view")
end

get '/transactions/categories/:id' do
  #very similar to view page 
  #get only transactons for this cat
  #binding.pry
  @transactions = Transaction.find_filtered(params[:id],0)
  @total = Transaction.find_total(@transactions)
  erb(:"transactions/index")
end

get '/transactions/merchants/:id' do
  #very similar to view page 
  #get only transactons for this cat
  @transactions = Transaction.find_filtered(0,params[:id])
  @total = Transaction.find_total(@transactions)
  erb(:"transactions/index")
end


post '/transactions' do
  #binding.pry
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
