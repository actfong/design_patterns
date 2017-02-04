# Context
class GreetingCard
  def initialize(recipient, sender, strategy)
    @recipient = recipient
    @sender = sender
    @strategy = strategy
  end

  def write
    content = []
    content << greeting
    content.concat body_and_closing
    content << add_address
  end

private
  attr_reader :recipient, :sender, :strategy

  def greeting
    "Hi #{recipient}"
  end

  def body_and_closing
    strategy.call(sender)
  end

  def add_address
    'Writing address on an envelope'
  end
end

# Strategies as a block
cheesy_style = lambda{ |sender| ["Very cheesy stuff in the body.", "From your cheesy husband,\n#{sender}"] }
for_parents_style = lambda{ |sender| ["Keep it short and boring.", "Bye,\n#{sender}"] }

# Demo
puts GreetingCard.new('Rachael', 'Alex', cheesy_style).write.inspect
# puts GreetingCard.new('Mum and Dadd', 'Alex', for_parents_style).write.inspect