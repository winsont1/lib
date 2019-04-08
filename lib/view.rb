require_relative 'robot'
require 'pry'

class View
  def rename
    puts 'Please provide a name for your toy robot'
    name = gets.chomp
    puts
    puts "Your robot's name is: #{name}"
  end

  def start_robot
    puts 'Please place your robot in the first position and the direction it is facing (e.g. PLACE 1,2,EAST):'
    gets.chomp
  end

  def move(robot)
    puts 'Please provide any of the following moves: MOVE, LEFT, RIGHT, REPORT (to end)'
    gets.chomp
  end

  # def move_by_list
  #   move = ''
  #   action_list = []
  #   until move == 'REPORT'
  #     puts 'Please provide any more moves for robot'
  #     puts '- MOVE'
  #     puts '- LEFT'
  #     puts '- RIGHT'
  #     puts '- REPORT (if you wish to end moves)'
  #     puts
  #     move = gets.chomp
  #     action_list.push(move)
  #   end
  #   puts placing_first
  #   print action_list
  # end

  def status(robot)
    print "#{robot.position[:x]},#{robot.position[:y]},#{robot.position[:direction]}"
  end
end
