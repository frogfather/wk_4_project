require_relative( '../db/sql_runner' )
require_relative('merchants')

class Transaction
attr_reader :id
attr_accessor :trans_date, :amount, :merchant_id, :category_id

  def initialize( options )
    @id = nil || options['id'].to_i
    @trans_date = options['trans_date']
    @amount = options['amount'].to_f
    @merchant_id = options['merchant_id'].to_i
    @category_id = options['category_id'].to_i
  end 

  def save
    #only save if there's a merchant_id and cat_id
    sql = "INSERT INTO transactions (trans_date, amount, merchant_id, category_id) VALUES ('#{@trans_date}', #{@amount}, #{@merchant_id}, #{@category_id}) returning id;"
    @id = SqlRunner.run(sql)[0]['id'].to_i
  end

  def self.find(id)
    sql = "SELECT * FROM transactions WHERE id = #{id};"
    transaction = SqlRunner.run(sql)
    result = Transaction.new(transaction.first)
    return result
  end
  
  def self.all
    sql = "SELECT * FROM transactions;"
    transactions = SqlRunner.run(sql)
    result = transactions.map{|transaction| Transaction.new(transaction)}
    return result
  end


  def self.update(options)
    sql = "UPDATE transactions SET trans_date = '#{options['trans_date']}', amount = #{options['amount']}, merchant_id = #{options['merchant_id']}, category_id = #{options['category_id']} where id = #{options['id']};"
      SqlRunner.run(sql)
  end

  def merchant
    sql = "SELECT * FROM merchants WHERE merchants.id = #{@merchant_id};"
    result = SqlRunner.run(sql)
    return Merchant.new(result.first)
  end

  def category
    sql = "SELECT * FROM categories WHERE categories.id = #{@category_id};"
    result = SqlRunner.run(sql)
    return Category.new(result.first)    
  end

  def self.delete_all
    sql = "DELETE from transactions;"
    SqlRunner.run(sql)
  end

  def self.delete(id)
    sql = "DELETE from transactions where id = #{id}"
    SqlRunner.run(sql)
  end

end
