class MasterMind

  def initialize
    @numbers, @guess, @board, @turn, @guess_hist, @result, @result_hist = [1,2,3,4,5,6], [], [1,2,3,4,5,6], 0, {}, [], {}
  end

  def new_game
  end

  def draw_board(array)
    print "| "
    0.upto(5) {|i| print i == 4 ? array[i] : array[i], " | "}
  end

  def gen_numbers
  end

  def get_guess
    0.upto(5) do |i|
      puts "Guess for #{i+1}:"
      @guess[i] = gets.chomp.to_i
      until @numbers.include? @guess[i]
        puts "You must select integer 1-6:"
        @guess[i] = gets.chomp.to_i
      end
    end
    @turn += 1; @guess_hist["r" << @turn.to_s] = @guess
  end

  def check_guess
    0.upto(5) do |i|
      
    end
  end
end
