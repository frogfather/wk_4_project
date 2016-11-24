require_relative( '../db/sql_runner' )
class Merchant
  attr_reader :id, :name

  def initialize( options )
    @id = nil || options['id'].to_i
    @name = options['name']
  end  

  def self.all
    sql = "SELECT * FROM merchants;"
    merchants = Sql_Runner.run(sql)
    result = merchants.map {|merchant| Merchant.new( merchant )}
  end

end