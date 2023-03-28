
# 練習問題 10.2
# 特異クラスの構文を利用して、Areaクラスにクラスメソッドtriangleを追加する
class Area
  class << self
    def triangle(base, height)
      base * height /2
    end
  end
end

puts Area.triangle(5, 10)

