# How to use #instance_eval

# #instance_eval will execute the block in the context of its caller
# In other words, self inside the block is the caller of #instance_eval
# This behavior is different than a when a normal method accepts a block
# Normally self is the same as in the context where the block was created

class Cat
  def block_method(&block)
    block.call
  end

  def block_method_with_instance_eval(&block)
    instance_eval(&block)
  end
end

cat = Cat.new

# Object
cat.block_method do
  puts self.class
end

# Cat
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

# Global namespace
puts context

Dog.new('Stella').instance_eval do
  # Stella's namespace
  puts context

  Dog.new('Holly').instance_eval do
    # Holly's namespace
    puts context

    Dog.new('Josie').instance_eval do
      # Josie's namespace
      puts context
    end
  end
end
