# frozen_string_literal: true

begin
  def gcd(a, b)
    return a if b == 0

    gcd(b, a % b)
  end

  def boundary_count(first_point, second_point)
    if first_point[0] == second_point[0]
      return (first_point[1] - second_point[1]).abs - 1
    end

    if first_point[1] == second_point[1]
      return (first_point[0] - second_point[0]).abs - 1
    end

    gcd((first_point[0] - second_point[0]).abs, (first_point[1] - second_point[1]).abs) - 1
  end

  def count(a, b)
    x = b / 2.0
    y = a / 2.0
    dots = [[x, y], [x, -y], [-x, y], [-x, -y]]

    after_rotate_dots = dots.each.with_object([]) do |coordinates, memo|
      x = coordinates[0]
      y = coordinates[1]

      after_rotate_x = x * Math.cos(45) + y * Math.sin(45)
      after_rotate_y = -x * Math.sin(45) + y * Math.cos(45)
      memo << [after_rotate_x, after_rotate_y]
    end

    area_number = a * b

    boundary_amount = [after_rotate_dots[0], after_rotate_dots[2]].each.with_object(0) do |dot, memo|
      index = after_rotate_dots.index(dot)
      value = boundary_count(after_rotate_dots[index - 1], after_rotate_dots[index + 1])

      memo += value.to_i if value > 0
    end

    result = (2 * area_number - boundary_amount + 2) / 2
  end
rescue StandardError => e
  puts(e)
end
