class WithCheese < SandwichDecorator
  def make
    fail 'Cheese already added' if ingredients.include? 'cheese'
    ingredients << 'cheese'
    super + ", Adding Cheese"
  end

  def melt
    self.temperature = 'hot'
  end
end
