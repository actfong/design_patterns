require_relative "./strategies"
require 'minitest/autorun'

describe GreetingCard do
  let(:greeting_card) { GreetingCard.new(recipient, 'Alex', strategy)}
  let(:content) { greeting_card.write }

  describe '#write with Cheesy Strategy' do
    let(:recipient) { 'Rachael' }
    let(:strategy) { Cheesy.new }
    it 'contains cheesy content' do
      content[0].must_equal 'Hi Rachael'
      content[1].must_equal 'Very cheesy stuff in the body.'
      content[2].must_equal "From your cheesy husband,\nAlex"
      content[3].must_equal 'Writing address on an envelope'
    end
  end

  describe '#write with ForParents Strategy' do
    let(:recipient) { 'Mum and Dad' }
    let(:strategy) { ForParents.new }
    it 'contains boring content' do
      content[0].must_equal 'Hi Mum and Dad'
      content[1].must_equal 'Keep it short and boring'
      content[2].must_equal "Bye,\nAlex"
      content[3].must_equal 'Writing address on an envelope'
    end
  end
end
