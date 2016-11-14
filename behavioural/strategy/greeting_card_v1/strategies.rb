# Context
class GreetingCard
  attr_reader :recipient, :sender, :strategy
  def initialize(recipient, sender, strategy)
    @recipient = recipient
    @sender = sender
    @strategy = strategy
  end

  def write
    content = []
    content << greeting
    content << body
    content << closing
    content << add_address
  end

private

  def greeting
    "Hi #{recipient}"
  end

  def body
    @strategy.body
  end

  def closing
    @strategy.closing(sender)
  end

  def add_address
    'Writing address on an envelope'
  end
end

# Strategy
class WritingStyle
  def body
    fail NotImplementedError
  end

  def closing(sender)
    fail NotImplementedError
  end
end

# Concrete Strategy
class Cheesy < WritingStyle
  def body
    'Very cheesy stuff in the body.'
  end

  def closing(sender)
    "From your cheesy husband,\n#{sender}"
  end
end

# Concrete Strategy
class ForParents < WritingStyle
  def body
    'Keep it short and boring'
  end

  def closing(sender)
    "Bye,\n#{sender}"
  end
end
