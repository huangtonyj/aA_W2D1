require 'byebug'
class Employee
  
  attr_reader :salary 
  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss  
    boss.add_subordinates(self) unless boss.nil?
  end
  
  def bonus(multiplier)
    @salary * multiplier  
  end
  
  
end

class Manager < Employee
  def initialize(name, title, salary, boss)
    super
    @subordinates = [] 
  end
  
  def add_subordinates(employee)
    @subordinates << employee 
  end
  
  def bonus(multiplier)
    subordinates_salary * multiplier
  end
  
  def subordinates_salary
    subordinates_salary = 0
    @subordinates.each do |subordinate| 
      if subordinate.is_a?(Manager)
        subordinates_salary += subordinate.subordinates_salary + subordinate.salary
      else 
        subordinates_salary += subordinate.salary 
      end 
    end
    
    subordinates_salary
  end  
end


if __FILE__ == $PROGRAM_NAME
  ned = Manager.new("Ned", "Founder", 1000000, nil)
  darren = Manager.new("Darren", "TA Manager", 78000, ned)
  shawna = Employee.new("Shawna", "TA", 12000, darren)
  david = Employee.new("David", "TA", 10000, darren)
  
  p ned.bonus(5) # => 500_000
  p darren.bonus(4) # => 88_000
  p david.bonus(3) # => 30_000
  
end