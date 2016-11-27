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