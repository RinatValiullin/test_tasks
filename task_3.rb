# frozen_string_literal: true

begin
  def gcd(a, b)
    return a if b.zero?

    gcd(b, a % b)
  end

  def boundary_count(first_point, second_point)
    first_x_coordinate, first_y_coordinate = *first_point
    second_x_coordinate, second_y_coordinate = *second_point
    if first_x_coordinate == second_x_coordinate
      return (first_y_coordinate - second_y_coordinate).abs - 1
    end

    if first_y_coordinate == second_y_coordinate
      return (first_x_coordinate - second_x_coordinate).abs - 1
    end

    gcd((first_x_coordinate - second_x_coordinate).abs, (first_y_coordinate - second_y_coordinate).abs) - 1
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

      memo += value.to_i if value.positive?
    end

    (2 * area_number - boundary_amount + 2) / 2
  end
rescue StandardError => e
  puts(e)
end
