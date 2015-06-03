# Blocks and Ruby methods

# All Ruby methods can implicitly take a block as an argument
# They just might not yield to the block, so it won't do anything
def hello_world
  puts 'Hello world'
end

# Hello world
hello_world

# Hello world
hello_world do
  puts 'Goodbye world'
end

# If your method's last argument has an ampersand prepended,
# Ruby will associate it as its block
# To execute a block, call yield or block.call
def hello_world_and_something_else(&block)
  # block is a Proc
  # &block is a Block
  puts 'Hello world'
  yield
end

# Hello world
# Goodbye world
hello_world_and_something_else do
  puts 'Goodbye world'
end

# You can yield to the block more than once
def hello_world_and_something_else_twice(&block)
  yield
  puts 'Hello world'
  block.call
end

# Goodbye world
# Hello world
# Goodbye world
hello_world_and_something_else_twice do
  puts 'Goodbye world'
end
