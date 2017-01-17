require 'spec_helper'

RSpec.describe GameOfLifeEngine do
  let (:game) { GameOfLifeEngine.new(seed)}

  describe '.next_generation' do

    context 'single living entity' do
      let (:seed) { [
          [Cell.new(false), Cell.new(false), Cell.new(false)],
          [Cell.new(false), Cell.new(true),  Cell.new(false)],
          [Cell.new(false), Cell.new(false), Cell.new(false)]
      ] }

      let (:all_dead) { [
          [Cell.new(false), Cell.new(false), Cell.new(false)],
          [Cell.new(false), Cell.new(false), Cell.new(false)],
          [Cell.new(false), Cell.new(false), Cell.new(false)]
      ] }

      let (:game) { GameOfLifeEngine.new(seed)}

      it 'dies of loneliness when they have zero neighbors' do
        expect(game.next_generation).to eq(all_dead)
      end
    end

    context 'overpopulation' do
      let (:seed) { [
          [Cell.new(false), Cell.new(true), Cell.new(false)],
          [Cell.new(true),  Cell.new(true), Cell.new(true)],
          [Cell.new(false), Cell.new(true), Cell.new(false)]
      ] }

      let (:result) { [
          [Cell.new(true),  Cell.new(false), Cell.new(false)],
          [Cell.new(true),  Cell.new(false), Cell.new(false)],
          [Cell.new(false), Cell.new(false), Cell.new(false)]
      ] }

      it 'dies of overpopulation when they have too many neighbors' do
        expect(game.next_generation).to eq(result)
      end
    end

    context 'underpopulation' do
      let (:seed) { [
          [Cell.new(true),  Cell.new(false), Cell.new(false)],
          [Cell.new(true),  Cell.new(false), Cell.new(false)],
          [Cell.new(false), Cell.new(false), Cell.new(false)]
      ] }

      let (:result) { [
          [Cell.new(false), Cell.new(false), Cell.new(false)],
          [Cell.new(false), Cell.new(false), Cell.new(false)],
          [Cell.new(false), Cell.new(false), Cell.new(false)]
      ] }

      it 'dies of loneliness when they have one neighbor' do
        expect(game.next_generation).to eq(result)
      end
    end

    context 'abundance' do
      let (:seed) { [
          [Cell.new(true),  Cell.new(true)],
          [Cell.new(true),  Cell.new(true)],
      ] }

      it 'stays alive with three neighbors' do
        game.next_generation
        expect(game.send(:number_of_neighbors, 0, 0)).to eq(3)
        expect(game.cells[0][0]).to be_alive
      end
    end


    context 'reproduction' do
      let (:seed) { [
          [Cell.new(false), Cell.new(true)],
          [Cell.new(true),  Cell.new(true)]
      ] }

      let (:result) { [
          [Cell.new(true),  Cell.new(true)],
          [Cell.new(true),  Cell.new(true)],
      ] }

      it 'when exactly three neighbors' do
        game.next_generation
        expect(game.send(:number_of_neighbors, 0, 0)).to eq(3)
        expect(game.cells).to eq(result)
        expect(game.cells[0][0]).to be_alive
      end
    end

  end

  describe '.number_of_neighbors' do
    let (:seed) { [
        [Cell.new(true),  Cell.new(true), Cell.new(true)],
        [Cell.new(true),  Cell.new(true), Cell.new(true)],
        [Cell.new(true),  Cell.new(true), Cell.new(true)]
    ] }

    let (:result) { [
        [3, 5, 3],
        [5, 8, 5],
        [3, 5, 3]
    ] }

    it 'calculates the expected neighbor count for a given cell at x,y' do
      seed.each_with_index do |row, y|
        row.each_with_index do |_col, x|
          expect(game.send(:number_of_neighbors, x, y)).to eq(result[x][y])
        end
      end
    end
  end
end
