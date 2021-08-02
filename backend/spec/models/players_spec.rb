# frozen_string_literal: true

require 'rails_helper'

# Test suite for the Item model
RSpec.describe Player, type: :model do
  before { @player = FactoryBot.build(:player, wins: 1, losses: 1, draws: 2) }

  subject { @player }
  it { should respond_to(:name) }
  it { should respond_to(:wins) }
  it { should respond_to(:losses) }
  it { should respond_to(:draws) }
  it { should respond_to(:win_ratio) }
  it { should be_valid }

  describe 'test no name' do
    it 'has no name' do
      FactoryBot.build(:player, name: nil).should_not be_valid
    end
  end

  describe 'test win ratio' do
    it 'has no name' do
      expect(subject.win_ratio).to eq 0.25
    end

    context 'for initial players' do
      let(:initial_player) { FactoryBot.build(:player, wins: 0, losses: 0, draws: 0) }

      it 'has zero ratio' do
        expect(initial_player.win_ratio).to eq 0
      end
    end
  end
end
