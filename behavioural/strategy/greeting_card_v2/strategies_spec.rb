require_relative "./strategies"
require 'minitest/autorun'

describe GreetingCard do
  let(:greeting_card) { GreetingCard.new(recipient, sender, strategy_mock)}
  let(:sender) { 'alex' }
  let(:strategy_mock) { Minitest::Mock.new }

  describe '#write with strategy as a block' do
    let(:recipient) { 'Mum and Dad' }
    it 'invokes #call on strategy' do
      strategy_mock.expect :call, ['foo', 'bar'], [sender]
      greeting_card.write
    end
  end
end
