require './helper'
require './lib/board'
require './lib/square'
require './lib/piece'
require './lib/pawn'


class Chess
  attr_accessor :pawn

  def initialize(input: $stdin, output: $stdout)
    @input = input
    @output = output
  end

  def pawn_simulator
    loop do
      answer =  @input.gets
      answer = answer.chomp.strip() if answer
      command, options = command_formatting(answer)

      if !@pawn && (command && command != PLACE)
        @output.puts "The first valid command to the pawn is a `#{PLACE}` command."
        return
      end

      case command
      when PLACE
        error_message = validate_place_cmd(options)

        if error_message
          @output.puts error_message
          return
        end

        x,y,f,c = options
        @pawn = Pawn.new(x.to_i, y.to_i, f.upcase, c.upcase)
      when MOVE
        steps = options[0] || 1
        @pawn.move(steps.to_i)
      when LEFT
        @pawn.left
      when RIGHT
        @pawn.right
      when REPORT
        @output.puts "Output: #{@pawn.report}"
        return
      end
    end
  end
end

chess = Chess.new()
chess.pawn_simulator
