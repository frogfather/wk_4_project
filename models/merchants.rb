require_relative( '../db/sql_runner' )
class Merchant
  attr_reader :id
  attr_accessor :name

  def initialize( options )
    @id = nil || options['id'].to_i
    @name = options['name']
  end  

  def self.all
    sql = "SELECT * FROM merchants;"
    merchants = SqlRunner.run(sql)
    result = merchants.map {|merchant| Merchant.new( merchant )}
    return result
  end


  def save
    sql = "INSERT INTO merchants (name) VALUES ('#{@name}') returning id;"
    @id = SqlRunner.run(sql)[0]['id'].to_i
  end

  def update
    sql = "UPDATE merchants SET name = '#{@name}' WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

  def self.delete(id)
    sql="DELETE FROM merchants where id = #{id};"
    SqlRunner.run(sql)
  end

  def self.delete_all
    sql = "DELETE FROM merchants;"
    SqlRunner.run(sql)
  end

end