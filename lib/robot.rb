# Initiate Robot class
class Robot
  attr_accessor :name, :position
  VALID_XY_COORDS = [0, 1, 2, 3, 4].freeze
  VALID_DIRECTIONS = ['NORTH', 'SOUTH', 'EAST', 'WEST'].freeze

  def initialize
    @name = 'AwesomeO v1.0'
    @position = { x: 0, y: 0, direction: 'NORTH' } # TODO: for thing
  end

  def move(selected_move)
    if selected_move == 'MOVE'
      move_it
    elsif selected_move == 'LEFT'
      turn_left
    elsif selected_move == 'RIGHT'
      turn_right
    end
  end

  private

  def move_it
    max_xy_coord = VALID_XY_COORDS[-1]
    min_xy_coord = VALID_XY_COORDS[0]

    case @position[:direction]
    when 'NORTH'
      @position[:y] == max_xy_coord ? @position[:y] : @position[:y] += 1
    when 'SOUTH'
      @position[:y] == min_xy_coord ? @position[:y] : @position[:y] -= 1
    when 'EAST'
      @position[:x] == max_xy_coord ? @position[:x] : @position[:x] += 1
    when 'WEST'
      @position[:x] == min_xy_coord ? @position[:x] : @position[:x] -= 1
    end
  end

  def turn_left
    case @position[:direction]
    when 'NORTH'
      @position[:direction] = 'WEST'
    when 'SOUTH'
      @position[:direction] = 'EAST'
    when 'EAST'
      @position[:direction] = 'NORTH'
    when 'WEST'
      @position[:direction] = 'SOUTH'
    end
  end

  def turn_right
    case @position[:direction]
    when 'NORTH'
      @position[:direction] = 'EAST'
    when 'SOUTH'
      @position[:direction] = 'WEST'
    when 'EAST'
      @position[:direction] = 'SOUTH'
    when 'WEST'
      @position[:direction] = 'NORTH'
    end
  end
end
