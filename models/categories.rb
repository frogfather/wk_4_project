require_relative( '../db/sql_runner' )

class Category
attr_reader :id
attr_accessor :name

def initialize
  @id = nil || options['id'].to_i
  @name = options['name']
end

end