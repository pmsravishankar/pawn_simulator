require 'stringio'
require './chess'
require 'rspec'


RSpec.describe Chess do
  context '#pawn simulator' do
    it 'returns place command error' do
      # allow($stdin).to receive(:gets).and_return("The first valid command to the pawn is a `PLACE` command.")
      # first_cmd = $stdin.gets

      output = pawn_simulator_with_input("unknow")

      expect(output).to eq("The first valid command to the pawn is a `#{PLACE}` command.\n")
    end

    it 'returns place command argument error' do
      output = pawn_simulator_with_input("place")

      expect(output).to eq("`Place` argument should be `X,Y,F,C` format.\n")
    end

    it 'returns place command facing validation error' do
      output = pawn_simulator_with_input("place 0,0,facing,white")

      expect(output).to eq("Facing should be #{FACING.join(" or ")}.\n")
    end

    it 'returns place command color validation error' do
      output = pawn_simulator_with_input("place 0,0,north,color")

      expect(output).to eq("Color should be #{COLOR.join(" or ")}.\n")
    end

    it 'returns report with multiple move' do
      output = pawn_simulator_with_input("PLACE 1,2,EAST,BLACK", "MOVE 2", "MOVE 1", "LEFT", "MOVE", "REPORT")

      expect(output).to eq <<~OUTPUT
        Output: 4,3,NORTH,BLACK
      OUTPUT
    end

    it 'returns report with single move' do
      output = pawn_simulator_with_input("PLACE 0,0,NORTH,WHITE", "MOVE 1", "REPORT")

      expect(output).to eq <<~OUTPUT
        Output: 0,1,NORTH,WHITE
      OUTPUT
    end

    it 'returns report with LEFT direction move' do
      output = pawn_simulator_with_input("PLACE 0,0,NORTH,BLACK", "LEFT", "REPORT")

      expect(output).to eq <<~OUTPUT
        Output: 0,0,WEST,BLACK
      OUTPUT
    end
  end

  def pawn_simulator_with_input(*input_numbers)
    input = StringIO.new(input_numbers.join("\n") + "\n")
    output = StringIO.new

    example = Chess.new(input: input, output: output)
    expect(example.pawn_simulator).to be nil

    output.string
  end
end
