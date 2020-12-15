class Policy
  def self.build(policy_string)
    range_string, letter = policy_string.split(' ')
    min, max = range_string.split('-').map(&:to_i)

    new(range: min..max, letter: letter)
  end

  attr_reader :range, :letter

  def initialize(range:, letter:)
    @range = range
    @letter = letter
  end

  def valid?(string)
    count = string.count(letter)
    range.cover?(count)
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
