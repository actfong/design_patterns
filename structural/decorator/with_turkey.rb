class WithTurkey < SandwichDecorator
  def make
    fail 'Turkey already added' if ingredients.include? 'turkey'
    ingredients << 'turkey'
    self.vegetarian = false
    super + ", Adding Turkey"
  end
end
