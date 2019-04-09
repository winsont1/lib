require_relative 'robot'
require 'pry'

# Initialize View Class
class View
  def rename
    puts 'Please provide a name for your toy robot'
    name = gets.chomp
    puts
    puts "Your robot's name is: #{name}"
    return name
  end

  def start_robot(robot)
    puts "Key #{robot.name}'s first position (e.g. PLACE 1,2,EAST):"
    gets.chomp
  end

  def move
    puts 'Please provide any of the following moves: MOVE, LEFT, RIGHT, REPORT'
    gets.chomp
  end

  def status(robot)
    print "#{robot.position[:x]},#{robot.position[:y]},#{robot.position[:direction]}"
  end
end
