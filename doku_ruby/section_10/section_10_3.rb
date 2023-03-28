## モジュール

# 基本
module Loggable
  def show_attr
    instance_variables.each do |name|
      puts "#{name}: #{instance_variable_get(name)}"
    end
  end
end

class Person
  include Loggable

  attr_reader :name, :age

  def initialize(name, age)
    @name = name
    @age = age
  end
end

ps = Person.new('tanaka', 33)
ps.show_attr

