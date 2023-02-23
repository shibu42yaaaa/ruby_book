class Person
  @@size = 0
  MALE = :male
  FEMALE = :female

  def self.male(name, age)
    new(name, age, MALEW)
  end
  def self.female(name, age)
    new(name, age, FEMALEW)
  end

  def self.size
    @@size
  end

  def initialize(name, age, sex)
    @@size += 1
    @name, @age, @sex = name, age, sex
  end

  def hello
    puts <<-EOS
こんにちわ。
私は #{@name} です。
年齢は #{@age} です。
性別は #{@sex} です。
    EOS
  end
end
people = [
    Person.new('tanaka', 34, Person::MALE),
    Person.new('suzuki', 22, Person::FEMALE),
]

people.each {|person|person.hello}

puts "#{Person.size}人います。"
