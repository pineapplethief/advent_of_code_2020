class App
  def self.run!
    target_sum = 2020

    array = []

    ARGF.each do |line|
      number = line.to_i
      array << number
    end

    combinations = array.combination(3).to_a
    combinations.each do |combination|
      sum = combination.inject(0, :+)
      if sum == target_sum
        factor = combination.inject(1, :*)
        puts "factor of numbers which sum 2020 is: #{factor}"
      end
    end
  end
end

App.run!
