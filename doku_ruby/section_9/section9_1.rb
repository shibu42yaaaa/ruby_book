# selfを用いた例

class Person
  attr_accessor :name, :age

  def initialize(name, age)
    @name = name
    @age = age
  end

  def greet(name)
    puts "こんにちは#{name}さん。私の名前は#{self.name}です"
  end
end

ps = Person.new('ショーへー', 28)

ps.greet('トラウト')

# --------------------
# クラスメソッド

class Area
  def self.circle(radius)　# インスタンス生成しない場合はselfをつける
    radius * radius * 3.14
  end
end
# インスタンス生成しない
puts Area.circle(5)

#-------オリジナル-------------


require 'bigdecimal'
class TaXCaluclate
  def self.tax_calc(price)
    (BigDecimal(price) * BigDecimal("1.1")).ceil
  end
end

puts TaXCaluclate.tax_calc(100)

# --------------------
# クラスメソッドの使い所

require 'net/http'
require 'json'

# 書籍情報を管理
class Book
  attr_accessor :isbn, :title, :price

  def initialize(isbn, title, price)
    @isbn = isbn
    @title = title
    @price = price
  end
  # ISBNコードをキーに書籍情報を取得
  def self.get_by_isbn(isbn)
    result = Net::HTTP.get(URI.parse("https://wings.msn.to/tmp/#{isbn}.json"))
    bs = JSON.parse(result)
    # 取得した書籍情報をもとにインスタンス生成
    new(bs['isbn'], bs['title'], bs['price'])
  end
end

b = Book.get_by_isbn('978-4-7981-5112-0')
puts b.title

# --------------------
# クラス変数(＝定数でも結果は同じ) あまり使うべきではない。
class Area
  @@pi = 3.14159265359
#   PI = 3.14159265359

  #クラス変数を参照するメソッド
  def self.circle(radius)
      radius * radius * @@pi
  end
  
  # クラス変数を参照するためのアクセッサー
  def self.pi
    @@pi
  end
end
  
puts Area.pi
puts Area.circle(5)

# --------------------
# クラス定数を利用する
class Area
  PI = 3.14
 
  def self.circle(radius)
    radius * radius * PI
  end
 
end

p Area::PI
p Area.circle(5)

# --------------------
# 継承
class Person
  attr_accessor :name, :age

  def initialize(name, age)
    @name = name
    @age = age
  end

  def show
    puts "私の名前は#{@name}です。年齢は#{@age}歳です。"
  end
end

class BusinessPerson < Person
  def work
    puts "#{@name}(#{@age}歳)は働いています"
  end
end

bps = BusinessPerson.new("tanaka", 33)
bps.show
bps.work

# オーバーライド
class EliteBusinessPerson < BusinessPerson
  def work
    puts "#{@name}(#{@age}歳)はバリバリ働いています"
  end
end

ebps = EliteBusinessPerson.new('坂田銀時', 22)
ebps.show
ebps.work

# ---superによる基底クラス参照-------------
class HetareBusinessPerson < BusinessPerson
  def work
    super
    puts "ただし、ボチボチと。。。"
  end
end

hbps = HetareBusinessPerson.new('サムス', 19)
hbps.work


# --------------------
#初期メソッドのオーバーライド
class Student < Person
  attr_accessor :grade
  def initialize(name, age, grade)
    super(name, age)
    @grade = grade
  end

  def show
    puts "私の名前は#{@name}です。年齢は#{@age}歳で現在#{@grade}年です。"
  end
end

st = Student.new('トム', 18, 3)
st.show














