# Using #instance_eval on a block passed into a method can be very powerful

class Dog
  attr_reader :friends, :name

  def initialize(name, friends = [])
    @name = name
    @friends = friends
  end

  def friend_chain
    puts name
    friends.each_with_index do |friend|
      puts "is friends with #{friend.name}"
    end
  end

  def make_friend(friend_name, &block)
    dog = Dog.new(friend_name, friends)
    dog.friends.unshift(self)
    dog.instance_eval(&block)
  end
end

Dog.new('Stella').make_friend 'Holly' do
  make_friend 'Josie' do
    make_friend 'Buddy' do
      make_friend 'T-Bone' do
        friend_chain
      end
    end
  end
end
