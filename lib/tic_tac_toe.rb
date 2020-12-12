class TicTacToe

    WIN_COMBINATIONS = [
    #horizontal
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    #vertical
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    #diagonal
    [0, 4, 8],
    [2, 4, 6]
    ]

    def initialize
        @board = [" ", " ", " ", " ", " ", " ", " ", " ", " ",]
    end

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
        puts " "
    end

    def input_to_index(input)
        input.to_i - 1
    end

    def move(position, player)
        @board[position] = player
    end

    def position_taken?(position)
    @board[position] == "X" || @board[position] == "O"
    end

    def valid_move?(position)
        if @board[position] == "X" || @board[position] == "O"
            false
        elsif position < 0 || position > 9
            false
        else
            true
        end
    end

    def turn_count
        @count = 0
        @board.each {|position| @count += 1 if position == "X" || position == "O"}
        @count
    end

    def current_player
        turn_count % 2 == 0 ? "X" : "O"
    end

    def turn
        puts "Please enter 1-9:"
        user_input = gets.strip
        index = input_to_index(user_input)
        if valid_move?(index)
            move(index, current_player)
            display_board
        else
            turn
        end
    end

    def won?
        x_won = WIN_COMBINATIONS.find {|comb| @board[comb[0]] == "X" && @board[comb[1]] == "X" && @board[comb[2]] == "X"}
        o_won = WIN_COMBINATIONS.find {|comb| @board[comb[0]] == "O" && @board[comb[1]] == "O" && @board[comb[2]] == "O"}
        x_won || o_won
    end

    def full?
        @board.all? {|x| x == "X" || x == "O"}
    end

    def draw?
        full? && !won?
    end

    def over?
        won? || draw?
    end

    def winner
        if won?
            @board[won?[0]] == "X" ? "X" : "O"
        else
            nil
        end
    end

    def play
        while !over?
            turn
        end
        if won?
            @winner = winner
            puts "Congratulations #{@winner}!"
        elsif draw?
            puts("Cat's Game!")
        end
    end
end