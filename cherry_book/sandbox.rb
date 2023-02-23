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



# require 'minitest/autorun'
# class CaseTest < Minitest::Test

#   def test_case
#     assert_equal 0, charge(3)
#     assert_equal 300, charge(7)
#     assert_equal 600, charge(13)
#     assert_equal 1200, charge(19)
#   end
# end








