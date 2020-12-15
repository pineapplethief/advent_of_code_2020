require 'set'

class App
  def self.run!
    sum = 2020

    numbers = Set.new

    ARGF.each do |line|
      number = line.to_i

      other_number = 2020 - number

      if numbers.include?(number)
        puts "result is: "
        puts "number 1: #{other_number}"
        puts "number 2: #{number}"
        puts "their factor is: #{other_number * number}"

        exit
      end

      numbers.add(other_number)
    end
  end
end

App.run!
