require_relative './basic_sandwich'
require_relative './sandwich_decorator'
require_relative './with_cheese'
require_relative './with_turkey'

sw = BasicSandwich.new
with_turkey = WithTurkey.new(sw)
with_cheese_and_turkey = WithCheese.new(with_turkey)
puts with_cheese_and_turkey.ingredients.inspect
puts with_cheese_and_turkey.make

with_cheese_and_turkey.melt
puts with_cheese_and_turkey.sandwich.inspect
