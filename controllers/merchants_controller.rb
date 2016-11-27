require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('../models/merchants.rb')


get '/merchants' do

  @merchants = Merchant.all()
  erb(:"merchants/index")
end