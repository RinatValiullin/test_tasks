# frozen_string_literal: true

require './task_2.rb'

describe '#difference_of_two' do
  it 'return correct value for small digits' do
    array = [1, 2, 3, 4]
    expect(difference_of_two(array)).to eql([[1, 3], [2, 4]])

    array = [4, 1, 2, 3]
    expect(difference_of_two(array)).to eql([[1, 3], [2, 4]])

    array = [1, 23, 3, 4, 7]
    expect(difference_of_two(array)).to eql([[1, 3]])

    array = [4, 3, 1, 5, 6]
    expect(difference_of_two(array)).to eql([[1, 3], [3, 5], [4, 6]])
  end
end
