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





# require 'minitest/autorun'
# class CaseTest < Minitest::Test

#   def test_case
#     assert_equal '東京03','人間風味',3200 charge(3)
#   end
# end








