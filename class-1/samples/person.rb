class Person
  def initialize
    @balance = 2
  end

  def change_balance(new_balance)
    @balance = new_balance
  end

  def output_balance
    puts "My balance is #{@balance}"
  end
end

sebastian = Person.new
sebastian.output_balance

felix = Person.new
felix.change_balance(10)
felix.output_balance
