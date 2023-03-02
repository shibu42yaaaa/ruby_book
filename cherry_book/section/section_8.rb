## モジュール

# private
# module Loggable
#   def log(text)
#     puts "[LOG] #{text}"
#   end
# end

# class Product
#   include Loggable

#   def title
#     log 'title is called.'
#     '名探偵コナン'
#   end
# end

# class User
#   include Loggable

#   def name
#     log 'name is called.'
#     '江戸川コナン'
#   end
# end

# product = Product.new
# product.title

# user = User.new
# user.name

#--

## モジュールのextend
# モジュール内のメソッドをその特異メソッド（クラスメソッド）にする
# module Loggable
#   def log(text)
#     puts "[LOG] #{text}"
#   end
# end

# class Product
#   extend Loggable
#   # newされていないのでクラスメソッドとして呼び出し(モジュール呼び出しはextendにする)
#   def self.create_products(names)
#     log 'ジョンウィック'
#   end
#   # 先に呼ばれる
#   log '名探偵コナン'
# end

# Product.create_products([])

# -----

## --練習問題　deep_freezeメソッド--
# 以下のコードをリラクタリングする
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

class Team
  COUNTRIES = deep_freeze(['Japan', 'US', 'India'])

  Team::COUNTRIES.frozen?
end