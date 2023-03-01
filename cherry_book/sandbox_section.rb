class User
  def initialize(name)
    @name = name
  end

  def self.create_user(names)
    names.map do |name|
      User.new(name)
    end
  end

  def hello
    "Hello, I am #{@name}"
  end
end

names = ['Alice', 'Bob', 'Tom']
users = User.create_user(names)
users.each do |user|
  puts user.hello
end