require_relative 'robot'
require_relative 'view'
require 'pry'

class Controller
  def initialize(robot)
    @robot = robot
    @view = View.new
  end

  def rename
    name = @view.rename
  end



  def start_robot
    # Receive input
    # Validate input
    # Update robot
    # Update robot
    begin
      input = @view.start_robot
      coordinates = input[6..-1].split(',') #Coordinates placements and direction, split into an array delimited by ','
    rescue
      retry
    end
    x_input = coordinates[0]
    y_input = coordinates[1]
    direction_input = coordinates[2]

    valid_xy = ['0', '1', '2', '3', '4']
    valid_direction = ['NORTH', 'SOUTH', 'EAST', 'WEST']
    #Checks if input is OK
    if input[0..5] == 'PLACE ' && (valid_xy.include? x_input) && (valid_xy.include? y_input) && (valid_direction.include? direction_input)
      #Update robot position
      @robot.position[:x] = x_input.to_i
      @robot.position[:y] = y_input.to_i
      @robot.position[:direction] = direction_input
    # Move Robot
      move_robot
    else
      start_robot
    end
  end

  def move_robot
    selected_move = @view.move(@robot)

    # Check if valid move, robot doesn't move if move is invalid
    # if @robot.move(selected_move)
    while selected_move != 'REPORT'
      ### CHECK FOR VALID PLACE MOVE
      @robot.move(selected_move)
      selected_move = @view.move(@robot)
    end
    report_status
  end

  def report_status
    @view.status(@robot)
  end

  def validate(input)
    coordinates = input[6..-1].split(',') #Coordinates placements and direction, split into an array delimited by ','
  end
end
