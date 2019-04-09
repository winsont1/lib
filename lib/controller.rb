require_relative 'robot'
require_relative 'view'
require 'pry'

# Initiate Controller class
class Controller
  def initialize(robot)
    @robot = robot
    @view = View.new
  end

  def rename
    @robot.name = @view.rename
  end

  def start_robot
    input = @view.start_robot(@robot)
    if validate_placement(input)
      move_robot
    else
      start_robot
    end
  end

  def move_robot
    selected_move = @view.move
    while selected_move != 'REPORT'
      if validate_placement(selected_move) != true
        @robot.move(selected_move)
        selected_move = @view.move
      end
    end
    report_status
  end

  def report_status
    @view.status(@robot)
  end

  private

  def validate_placement(input)
    begin
      coordinates = input[6..-1].split(',')
      x_input = coordinates[0].to_i
      y_input = coordinates[1].to_i
      direction_input = coordinates[2]
    rescue
      return false
    end
    if input[0..5] == 'PLACE ' && (Robot::VALID_XY_COORDS.include? x_input) && (Robot::VALID_XY_COORDS.include? y_input) && (Robot::VALID_DIRECTIONS.include? direction_input)
      update_position(x_input, y_input, direction_input)
    else
      false
    end
  end

  def update_position(x_input, y_input, direction_input)
    @robot.position[:x] = x_input
    @robot.position[:y] = y_input
    @robot.position[:direction] = direction_input
  end
end
