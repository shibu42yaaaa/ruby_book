## アプリ独自の例外クラス

# class MyAppError < StandardError

# end

# class MyInputEror < MyAppError
#   attr_reader :code

#   def initialize(code)
#     super("Invalid Input: #{code}")
#     @code = code
#   end

#   begin
#     raise MyInputEror.new(501)
#   rescue MyAppError => e
#     puts e.message
#   end
# end

# --------------------------------------------

# class Area
#   class  << self
#     def trapezoid(upper, lower, height)
#       (upper + lower) * height / 2
#     end
#   end
# end

# class << Area
#   def triangle(base, height)
#     base * height / 2
#   end
# end

# def Area.diamond(width, height)
#   width * height / 2
# end

# puts Area.trapezoid(7, 5, 3)
# puts Area.triangle(5, 2)
# puts Area.diamond(3, 6)

# --------------------------------------------

# Person = Struct.new(:name, :age)

# ps1 = Person.new('アリス', 22)

# puts ps1.name
# puts ps1.age

# puts ps1[:name]
# puts ps1[:age]

# --------------------------------------------
# 独自メソッドの追加
# class Person < Struct.new(:name, :age)
#   def show
#     puts "#{name}です。#{age}歳です"
#   end
# end

# ps = Person.new('トラウト', 31)
# ps.show
# --------------------------------------------







