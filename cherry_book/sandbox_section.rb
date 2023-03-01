class User
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def self.rename_to_bob
    name = 'Bob'
  end
end


p user.rename_to_bob