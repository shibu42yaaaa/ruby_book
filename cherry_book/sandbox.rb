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

product = Product.new('東京03', '人間風味', 3200)
product.to_s

product = Product.new('ナイツ', '味のない氷だった', 2900)
product.to_s

product = Product.new('サンドウィッチマン', 'サンドウィッチマン ライブツアー 2022', 4000)
product.to_s






















# require 'minitest/autorun'
# class AddTaxText < Minitest::Test

#   def [メソッド名]
#     assert_equal [期待値], [メソッド]
#   end
# end








