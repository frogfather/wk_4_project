require_relative ('transactions')
require ('pry-byebug')

@transactions = Transaction.all
sum = Transaction.find_total(@transactions)
puts sum