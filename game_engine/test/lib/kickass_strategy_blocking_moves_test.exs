defmodule GameEngine.KickAssStrategyBlockingMovesTest do
	use ExUnit.Case
	alias GameEngine.PlayStrategies.KickAssStrategy, as: KickAssStrategy

	@player :o
	@opponent :x

	test "o blocks opponent by taking horizontal win for x" do
		horizontal_blocking = {@opponent, nil, @opponent,
							   nil, @player, nil,
						       nil, nil, nil}

		move = KickAssStrategy.calculate_move(%GameEngine.Board{positions: horizontal_blocking}, @player)
			
		assert move == %{row: 0, column: 1}
	end

	test "o blocks opponent by taking vertical win for x" do
		vertical_blocking = {@player, @opponent, @player,
							 nil, nil, nil,
						     nil, @opponent, nil}

		move = KickAssStrategy.calculate_move(%GameEngine.Board{positions: vertical_blocking}, @player)
			
		assert move == %{row: 1, column: 1}
	end

	test "o blocks opponent by taking diagonal win for x" do
		diagonal_blocking = {@player, @opponent, @opponent,
							 nil, nil, nil,
						     @opponent, nil, nil}

		move = KickAssStrategy.calculate_move(%GameEngine.Board{positions: diagonal_blocking}, @player)
			
		assert move == %{row: 1, column: 1}
	end
end