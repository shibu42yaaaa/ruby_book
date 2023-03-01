class User
  attr_reader :first_name, :last_name, :age

  def initialize(first_name, last_name, age)
    @first_name = first_name
    @last_name = last_name
    @age = age
  end
end

users = []
users << User.new('Alice', 'Ruby', 20)
users << User.new('Bob', 'Python', 30)

def full_name(user)
  "#{user.first_name} #{user.last_name}"
end

users.each do |user|
  puts "氏名: #{full_name(user)}, 年齢:#{user.age}"
end


# リファクタリング

class User
  attr_reader :first_name, :last_name, :age

  def initialize(first_name, last_name, age)
    @first_name = first_name
    @last_name = last_name
    @age = age
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end

users = []
users << User.new('Alice', 'Ruby', 20)
users << User.new('Bob', 'Python', 30)


users.each do |user|
  puts "氏名: #{user.full_name}, 年齢:#{user.age}"
end

# --
class User
  def initialize(name)
    @name = name
  end

  def hello
    "Hello, I am #{@name}"
  end
end

alice = User.new('Alice')
p alice.hello

bob = User.new('Bob')
p bob.hello

# --

class User
  def initialize(name)
    @name = name
  end
  # newをしていない段階（インスタンスができていない状態）のため、クラスメソッドとして定義（self.）　
  def self.create_users(names)
    names.map do |name|
      User.new(name)
    end
  end

  def hello
    "Hello, I am #{@name}"
  end
end

names = ['Alice', 'Bob', 'Carol']
users = User.create_users(names)
users.each do |user|
  puts user.hello
end

# --

# 定数

class Product
  DEFAULT_PRICE = 0

  def self.default_price
    DEFAULT_PRICE
  end

  def default_price
    DEFAULT_PRICE
  end
end

# 直接クラスから呼び出し(self)
p Product.default_price

product = Product.new
p product.default_price

# --

class User
  attr_accessor :name
  def initialize(name)
    @name = name
  end
  # selfなしでname=メソッドは呼べない
  def rename_to_bob
    name = 'Bob'
  end

  def rename_to_carol
    self.name = 'Carol'
  end

  def rename_to_dave
    #直接インスタンス変数を書き換える
    @name = 'Dave'
  end
end

user = User.new('Alice')
# Bobにリネーム
user.rename_to_bob
puts user.name # Aliceのまま

user.rename_to_carol
puts user.name

user.rename_to_dave
puts user.name

# --

class Product
  attr_accessor :name, :price

  def initialize(name, price)
    @name = name
    @price = price
  end

  def self.format_price(price)
    "#{price}円"
  end

  def to_s
    formatted_price = Product.format_price(price) # インスタンスメソッドからクラスメソッドを呼び出す
    puts "#{name}, price: #{formatted_price}"
  end
end

product = Product.new('A great movie', 1000)
product.to_s

#--  発展

class Product
  # name price
  attr_accessor :name, :price

  def initialize(name, price)
    @name = name
    @price = price
  end

  #金額メソッド format_price(price)
  def format_price(price)
    addprice = (price * 1.1).round
    "#{addprice}"
  end
  #出力　name,format_price(price
  def name_and_price
    formatted_price = format_price(price)
    puts "タイトル:#{name}, 値段:#{formatted_price}"
  end
end

procudt = Product.new('Railsガイド', 100)
procudt.name_and_price

# -- 発展2 条件分岐で課税をする
# 問題　以下のコードを正しく修正する
# このままだと消費税も分岐も機能しない。
class Product
  # name title price
  attr_reader :name, :title, :price
  def initialize(name, title, price)
    @name, @title, @price = name,title,price
  end

  # 消費税メソッド
  def tax_price(price)
    if name == '東京03'
      price * 1.1
      "#{price}円"
    else
      "#{price}円"
    end
  end


  # 出力メソッド
  def to_s
    taxed_price = tax_price(price)
    puts "名前:#{name},タイトル:#{title},値段:#{price}"
  end
end

product = Product.new('東京03', '人間風味', 3200)
product.to_s

product = Product.new('ナイツ', 'あの日は晴れだった', 2900)
product.to_s

# 回答
class Product
  # name title price
  attr_reader :name, :title, :price
  def initialize(name, title, price)
    @name, @title, @price = name,title,price
  end

  # 消費税メソッド
  def tax_price(price)
    if name == '東京03'
      add_tax_price = (price * 1.1).round
      "#{add_tax_price}円"
    else
      "#{price}円"
    end
  end


  # 出力メソッド
  def to_s
    taxed_price = tax_price(price)
    puts "名前:#{name},タイトル:#{title},値段:#{taxed_price}"
  end
end

product = Product.new('東京03', '人間風味', 3200)
product.to_s

product = Product.new('ナイツ', 'あの日は晴れだった', 2900)
product.to_s

#-- 消費税と割引
# 芸人名、タイトル、値段
# 消費税
# 税込価格3500円未満の場合は2割引

class Product

  attr_reader :name, :title, :price
  def initialize(name, title, price)
    @name, @title, @price = name,title,price
  end

  # 消費税メソッド
  def tax_price(price)
    tax_rate = 1.1
    add_tax_price = (price * tax_rate).round
    if add_tax_price >= 3500
      "#{add_tax_price}円"
    else
      discount_price(add_tax_price)
    end
  end

  # 3000円以下の場合は２割引
  def discount_price(add_tax_price)
    discount_rate = 0.2
    dis_price = (price * (1 - discount_rate)).round
      "#{dis_price}円"
  end

  # 出力メソッド
  def to_s
    # 消費税計算
    taxed_price = tax_price(price)
    puts "名前:#{name},タイトル:#{title},値段:#{taxed_price}"
  end
end

product = Product.new('東京03', '人間風味', 3200) # 3520円
product.to_s

product = Product.new('ナイツ', '味のない氷だった', 2900) # 2320円
product.to_s

product = Product.new('サンドウィッチマン', 'サンドウィッチマン ライブツアー 2022', 4000) # 4400円
product.to_s


## 継承

class Product
  attr_reader :name, :price

  def initialize(name, price)
    @name = name
    @price = price
  end
end

product = Product.new('A great movie', 1000)
puts product.name
puts product.price

# Productクラスを継承する
p "--継承--"

class DVD < Product
  attr_reader :running_time

  def initialize(name, price, running_time)
    super(name, price)
    @running_time = running_time
  end
end

dvd = DVD.new('A great mucie', 1000, 120)
puts dvd.name
puts dvd.price
puts dvd.running_time
class Product
  attr_reader :name, :price

  def initialize(name, price)
    @name = name
    @price = price
  end

  def to_s
    "name: #{name}, price: #{price}"
  end
end

class DVD < Product
  attr_reader :running_time

  def initialize(name, price, running_time)
    super(name, price)
    @running_time = running_time
  end

  def to_s
    "#{super},running_time: #{running_time}"
  end
end

product = Product.new('A greet movie', 1000)
p product.to_s

dvd = DVD.new('A great movie', 1000, 120)
p dvd.to_s

# --

class User
  def hello
    p "Hello, I am #{name}" # selfでは呼び出せない(#{self.name})
  end

  private  

  def name
    'Alice'
  end
end

user = User.new
user.hello

# --

class User
  def foo
    'foo'
  end

  def bar
    'bar'
  end

  private :foo, :bar

  def baz
    'baz'
  end
end

user = User.new
# p user.foo # プライベートメソッドなのでエラー
# p user.bar # プライベートメソッドなのでエラー
p user.baz


# --
protected

class User
  attr_reader :name

  def initialize(name, weight)
    @name = name
    @weight = weight
  end

  def heavier_than?(other_user)
    other_user.weight < @weight
  end

  protected
  
  def weight
    @weight
  end
end

alice = User.new('Alice', 50)
bob = User.new('Bob', 60)

p alice.heavier_than?(bob)
p bob.heavier_than?(alice)

# --

# freeze

class Product
  SOME_NAMES = ['Foo', 'Bar', 'Baz', 'Hoge']
end

Product::SOME_NAMES[0].upcase!
p Product::SOME_NAMES

↓ freezeを使って変更不可にする

class Product2
  SOME_NAMES2 = ['FOO', 'Bar', 'Baz', 'Hoge'].map(&:freeze).freeze
end
Product2::SOME_NAMES2[0].upcase!
p Product2::SOME_NAMES2


# --

class Product
  attr_reader :code, :name

  def initialize(code, name)
    @code = code
    @name = name
  end

  def ==(other)
    if other.is_a?(Product)
      code ==other.code
    else
      false
    end
  end
end

a = Product.new('A-001', 'A great movie')
b = Product.new('B-001', 'A awesome film')
c = Product.new('A-001', 'A great movie')

p a == b
p a == c













