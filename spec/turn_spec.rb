require './lib/turn'
require './lib/card'

RSpec.describe Turn do

  it 'exists' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    expect(turn).to be_instance_of(Turn)
  end

  it 'has a guess' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    expect(turn.guess).to eq("Juneau")
  end

  it 'has a card' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    expect(turn.card).to eq(card)
  end

  describe '#correct? ' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    it 'checks for correct answer' do
      turn = Turn.new("Juneau", card)

      expect(turn.correct?).to eq(true)
    end

    it 'checks for incorrect answer' do
      turn = Turn.new("Anchorage", card)

      expect(turn.correct?).to eq(false)
    end
  end

  describe '#feedback' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    it 'gives feedback for correct answer' do
      turn = Turn.new("Juneau", card)

      expect(turn.feedback).to eq("Correct!")
    end

    it 'gives feedback for incorrect answer' do
      turn = Turn.new("Anchorage", card)

      expect(turn.feedback).to eq("Incorrect.")
    end
  end
end
