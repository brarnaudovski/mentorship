class Person
  attr_accessor :name, :age
end

x = Person.new
x.name = 'Fred'
x.age = 10

puts x.name, x.age

# class Person
#   def name
#     @name
#   end

#   def name=(name)
#     @name = name
#   end

#   def age
#     @age
#   end

#   def age=(age)
#     @age = age
#   end
# end
