class Policy
  def self.build(policy_string)
    positions_string, letter = policy_string.split(' ')
    first, second = positions_string.split('-').map(&:to_i)

    new(positions: [first, second], letter: letter)
  end

  attr_reader :positions, :letter

  def initialize(positions:, letter:)
    @positions = positions.map { |pos| pos - 1 }
    @letter = letter
  end

  def valid?(string)
    letters = positions.map { |position| string[position] }

    count = 0

    letters.each do |current_letter|
      if current_letter == letter
        count += 1
      end
    end

    count == 1
  end
end

class App
  def self.run!
    valid_passwords_count = 0

    ARGF.each do |line|
      policy_string, password = line.split(':').map(&:strip)
      policy = Policy.build(policy_string)

      if policy.valid?(password)
        valid_passwords_count += 1
      end
    end

    puts "valid_passwords_count = #{valid_passwords_count}"
  end
end

App.run!
