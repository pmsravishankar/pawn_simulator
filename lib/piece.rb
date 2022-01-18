class Piece
  attr_accessor :color, :facing, :position #, :unicode

  def initialize(position, facing, color)
    @color = color
    @facing = facing
    @position = position
  end
end
