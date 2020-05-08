# frozen_string_literal: true

begin
  def difference_of_two(values)
    values.sort.combination(2).select { |a, b| (a - b).abs == 2 }
  end
rescue StandardError => e
  puts(e)
end
