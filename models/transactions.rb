require_relative( '../db/sql_runner' )

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

  def update
    sql = "UPDATE transactions SET trans_date = '#{@trans_date}', amount = #{@amount}, merchant_id = #{@merchant_id}, category_id = #{@category_id};"
      SqlRunner.run(sql)
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
