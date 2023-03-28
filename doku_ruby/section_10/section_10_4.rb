class Person
  attr_reader :name, :age

  def initialize(name, age)
    @name = name
    @age = age
  end

  def ==(other)
    if other.instance_of?(Person)
      return self.name == other.name && self.age == other.age
    end
    false
  end
end

ps1 = Person.new('tanaka', 22)
ps2 = Person.new('yamano', 35)
ps3 = Person.new('tanaka', 22)

puts ps1 == ps2
puts ps1 == ps3
puts ps1 == 'tanaka'