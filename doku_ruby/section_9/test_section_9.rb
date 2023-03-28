class Pet
  attr_accessor :kind, :name

  def initialize(kind, name)
    @kind = kind
    @name = name
  end

  def show
    puts "私のペットは#{@kind}の#{@name}ちゃんです"
  end
end

pt = Pet.new('ハムスター', 'のどか')
pt.sho

#  練習問題9.2

class MyClass
  attr_accessor :kind, :name

  def initialize(kind, name)
    @kind = kind
    @name = name
  end

  def show
    puts "ペットは#{@kind}の名前は#{@name}です。"
  end
end

class MySubClass < MyClass
  def show
    super
  end
end


ms = MySubClass.new('ハムスター', 'すもも')
puts ms.show


## 理解度チェック 469
# 以下のコードを修正する
# class Person
#   def initialize(name, age)
#     @name =name
#     @age = age
#   end

#   def show
#     "私の名前は#{name}, #{age}歳です。"
#   end
# end

# class BusinessPerson : Person
#   attr_reader :title

#   def initialize(name, age, title)
#     super(name, age, title)
#   end

#   def show
#     "#{super.show}。職位は#{title}です"
#   end
# end

# bps = BusinessPerson.new('tanaka', 22, '主任')
# puts bps.show

## ↓修正
class Person
  attr_reader :name, :age

  def initialize(name, age)
    @name = name
    @age = age
  end

  def show
    "私の名前は#{@name}です。年齢は#{@age}歳です。"
  end
end

class BusinessPerson < Person
  attr_reader :title
  
  def initialize(name, age, title)
    super(name, age)
    @title = title
  end

  def show
    "#{super} 職位は#{@title}です。"
  end
end

bps = BusinessPerson.new('cocoichi', 25, '店長')
puts bps.show