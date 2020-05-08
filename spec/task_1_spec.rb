# frozen_string_literal: true

require './task_1.rb'

describe '#total_amount' do
  it 'return correct value for small digits' do
    expect(total_amount(7)).to eql(9)
    expect(total_amount(1)).to eql(2)
  end

  it 'return correct value for dozens' do
    expect(total_amount(12)).to eql(15)
    expect(total_amount(86)).to eql(100)
  end

  it 'return correct value for hundreds' do
    expect(total_amount(857)).to eql(1000)
  end

  it 'return correct value for thousands' do
    expect(total_amount(2210)).to eql(2500)
  end
end
