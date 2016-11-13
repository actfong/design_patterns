require_relative './basic_sandwich'
require_relative './sandwich_decorator'
require_relative './with_cheese'
require_relative './with_turkey'
require 'minitest/autorun'

describe WithCheese do
  let(:sandwich) { BasicSandwich.new }
  let(:with_cheese) { WithCheese.new(sandwich) }

  describe '#make' do
    it 'contains the correct actions' do
      actions = with_cheese.make
      actions.must_include 'Starting with bread'
      actions.must_include 'Adding Cheese'
    end

    it 'adds cheese to ingredients' do
      with_cheese.make
      with_cheese.ingredients.must_include 'cheese'
    end
  end

  describe '#melt' do
    it 'sets temperature to hot' do
      with_cheese.temperature.must_equal 'cold'
      with_cheese.melt
      with_cheese.temperature.must_equal 'hot'
    end
  end
end

describe WithTurkey do
  let(:sandwich) { BasicSandwich.new }
  let(:with_turkey) { WithTurkey.new(sandwich) }

  describe 'make' do
    it 'contains the correct actions' do
      actions = with_turkey.make
      actions.must_include 'Starting with bread'
      actions.must_include 'Adding Turkey'
    end

    it 'adds turkey to ingredients' do
      with_turkey.make
      with_turkey.ingredients.must_include 'turkey'
    end
  end
end

describe 'With Cheese and Turkey' do
  let(:sandwich) { BasicSandwich.new }
  let(:with_turkey) { WithTurkey.new(sandwich) }
  let(:with_cheese_and_turkey) { WithCheese.new(with_turkey) }

  describe 'make' do
    it 'has bread, cheese and turkey as ingredients' do
      with_cheese_and_turkey.make
      with_cheese_and_turkey.ingredients.must_include 'turkey'
    end

    it 'has cold as temperature' do
      with_cheese_and_turkey.make
      with_cheese_and_turkey.temperature.must_equal 'cold'
    end
  end

  describe 'melt' do
    it 'has hot as temperature' do
      with_cheese_and_turkey.melt
      with_cheese_and_turkey.temperature.must_equal 'hot'
    end
  end
end
