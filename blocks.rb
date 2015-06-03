# Blocks and Ruby methods

# All Ruby methods can implicitly take a block as an argument
# They just might not yield to the block, so it won't do anything

def hello_world
  puts 'Hello world'
end

hello_world

hello_world do
  puts 'Goodbye world'
end

# If your method's last argument has an ampersand prepended,
# Ruby will associate it as its block
# To execute a block, call yield or block.call

def hello_world_and_something_else(&block)
  puts 'Hello world'
  yield
end

hello_world_and_something_else do
  puts 'Goodbye world'
end

# You can yield to the block more than once

def hello_world_and_something_else_twice(&block)
  # What is &block?
  # What is block?
  # What does the & do?
  yield
  puts 'Hello world'
  block.call
end

hello_world_and_something_else_twice do
  puts 'Goodbye world'
end

# What is a proc?

proc = Proc.new { puts 'From a proc!' }

hello_world_and_something_else_twice &proc

def hello_world_taking_an_argument(p)
  p.call
end

hello_world_taking_an_argument(proc)

# Passing a block around

def first(&block)
  second(block)
end

def second(block)
  third(&block)
end

def third(&block)
  block.call
end

first do
  puts "hello"
end
