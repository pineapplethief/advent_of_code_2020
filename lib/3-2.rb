require 'matrix'

class Map
  attr_reader :map, :depth, :length

  DIRECTIONS = %i[right left up down].freeze

  def initialize(array_of_arrays)
    @map = array_of_arrays
    @depth = array_of_arrays.length - 1
    @length = array_of_arrays.first.length - 1
  end

  def trees_count(dx:, dy:)
    position = { x: 0, y: 0 }

    count = 0

    loop do
      break if position[:y] > depth

      position[:x] += dx
      position[:y] += dy

      line = map[position[:y]]
      next unless line
      cell = line[position[:x] % length]
      if cell && cell == '#'
        count += 1
      end
    end

    puts "count = #{count}"

    count
  end
end

class App
  def self.run!
    array = []

    ARGF.each do |line|
      array << line.chars
    end

    map = Map.new(array)

    slopes = [
      { dx: 1, dy: 1 },
      { dx: 3, dy: 1 },
      { dx: 5, dy: 1 },
      { dx: 7, dy: 1 },
      { dx: 1, dy: 2 }
    ]

    trees_counts = slopes.map do |slope|
      map.trees_count(slope)
    end

    factor = trees_counts.inject(1, :*)

    puts "factor = #{factor}"
  end
end

App.run!
