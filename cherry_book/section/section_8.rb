## モジュール

private
module Loggable
  def log(text)
    puts "[LOG] #{text}"
  end
end

class Product
  include Loggable

  def title
    log 'title is called.'
    '名探偵コナン'
  end
end

class User
  include Loggable

  def name
    log 'name is called.'
    '江戸川コナン'
  end
end

product = Product.new
product.title

user = User.new
user.name

#--

# モジュールのextend
モジュール内のメソッドをその特異メソッド（クラスメソッド）にする
module Loggable
  def log(text)
    puts "[LOG] #{text}"
  end
end

class Product
  extend Loggable
  # newされていないのでクラスメソッドとして呼び出し(モジュール呼び出しはextendにする)
  def self.create_products(names)
    log 'ジョンウィック'
  end
  # 先に呼ばれる
  log '名探偵コナン'
end

Product.create_products([])

# -----

## --練習問題　deep_freezeメソッド--
# 以下のコードをリファクタリングする
# class Team
#   COUNTRIES = deep_freeze(['Japan', 'US', 'India'])
# end
# # 配列自身と配列の全要素がfreezeされている
# Team::COUNTRIES.frozen?
# Team::COUNTRIES.all? {|country| country.frozen?}

# class Bank
#   CURRENCIES = deep_foeeze({Japan: 'yen', US: 'dollar', india: 'rupee'})
# end

# Band::CURRENCIES.frozen?
# Bank.CURRENCIES.all? {|key, value| key.froezn? && value.froezn?}

# --
# インクルード先のメソッドを使う
module Taggable
  def price_tag
    "#{price}円" #Productのpriceメソッドを参照する
  end
end

class Product
  include Taggable

  def price
    1000
  end
end

product = Product.new
product.price_tag

#--

module NameChanger
  def change_name
    self.name = 'アリス'
  end
end

class User
  include NameChanger

  attr_accessor :name

  def initialize(name)
    @name = name
  end
end

user = User.new('alice')
user.change_name
p user.name

#--

# 名前空間
module Baseball
  class Second
    def initialize(player, uniform_number)
      @player = player
      @uniform_number = uniform_number
    end
  end
end

module Clock
  class Second
    def initialize(digits)
      @digits = digits
    end
  end
end

# # モジュール::クラス
p Baseball::Second.new('牧秀悟', 2)
p Clock::Second.new(30)

# -- 既にどこかでmoduleが定義されている場合
# module Baseball

# end

class Baseball::Position
  def initialize(player, position, uniform_number)
    @player, @position, @uniform_number = player, position, uniform_number
  end
end

p Baseball::Position.new('牧秀悟', 'セカンド', 2)

# --
# newする必要のない関数を使用する時に便利
module Loggable
  class << self
    def log(text)
      puts "[LOG] #{text}"
    end
  end
end

Loggable.log('hello.')

# --
# -- module_functionメソッド
# ミックスインと特異メソッドの二刀流
module Loggable
  def log(text)
    puts "[LOG] #{text}"
  end

  module_function :log
end

Loggable.log('Hello')

class Product
  include Loggable

  def title
    log 'title is called.'
    log '遊戯王'
  end
end

product = Product.new
product.title

# # module_functionでモジュール関数となったメソッドは、他のクラスにミックスインすると自動的にprivateメソッドになる。
# # product.log('hello')

module Loggable
  # ここから下のメソッドは全てモジュール関数（privateとして機能）
  module_function

  def log(text)
    puts "[LOG] #{text}"
  end
end

# --











