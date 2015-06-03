require 'set'

def make_pizza &block
  pizza = Pizza.new
  pizza.instance_eval &block
  pizza
end

class Pizza
  def initialize
    @toppings = Set.new
  end

  def read_toppings
    toppings.each do |topping|
      puts topping
    end
  end

  private

  attr_reader :toppings

  def method_missing method_name
    toppings << method_name
  end
end

pizza = make_pizza do
  cheese
  bacon
  pineapple
end

pizza.read_toppings
