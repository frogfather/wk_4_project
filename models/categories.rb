require_relative( '../db/sql_runner' )

class Category
attr_reader :id
attr_accessor :name

def initialize( options )
  @id = nil || options['id'].to_i
  @name = options['name']
end

def self.all
  sql = "SELECT * FROM categories;"
  categories = SqlRunner.run(sql)
  result = categories.map {|category| Category.new( category )}
  return result
end

def save
  sql = "INSERT INTO categories (name) VALUES ('#{@name}') returning id;"
  @id = SqlRunner.run(sql)[0]['id'].to_i
end

def update
  sql = "UPDATE categories SET name = '#{@name}' WHERE id = #{@id};"
  SqlRunner.run(sql)
end

def self.delete(id)
  sql="DELETE FROM categories where id = #{id};"
  SqlRunner.run(sql)
end

def self.delete_all
  sql = "DELETE FROM categories;"
  SqlRunner.run(sql)
end

end