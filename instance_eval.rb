# How to use #instance_eval

class Cat
  def block_method(&block)
    block.call
  end

  def block_method_with_instance_eval(&block)
    instance_eval(&block)
  end
end

cat = Cat.new

cat.block_method do
  puts self.class
end

cat.block_method_with_instance_eval do
  puts self.class
end

def context
  'Global namespace'
end

class Dog
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def context
    "#{name}'s namespace"
  end
end

puts context

Dog.new('Stella').instance_eval do
  puts context

  Dog.new('Holly').instance_eval do
    puts context

    Dog.new('Josie').instance_eval do
      puts context
    end
  end
end
