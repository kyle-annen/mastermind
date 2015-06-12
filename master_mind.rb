class MasterMind

  def initialize
    @code, @numbers, @guess, @board, @turn, @guess_hist, @result, @result_hist = [1,2,3,4,5,6], [1,2,3,4,5,6], [], [1,2,3,4,5,6], 0, [], [1,2,3,4,5,6], []
  end

  def new_game
    gen_code
    while @turn < 12
      get_guess
      check_guess
      draw_game
    end
  end

  def draw_game
    for i in 0..(@guess_hist.length - 1)
      print "round #{i+1}: "
      draw_board(@guess_hist[i])
      print " <----> "
      draw_board(@result_hist[i])
      puts ""
    end
  end

  def draw_board(array)
    print "| "
    0.upto(5) {|i| print i == 4 ? array[i] : array[i], " | "}
  end

  def gen_code
    @code = []
    6.times {@code << rand(6)}
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
    @turn += 1;
    save_guess = @guess
    @guess_hist.push(save_guess)
    puts @guess_hist
  end

  def check_guess
    temp_code = @code
    temp_guess = @guess
    0.upto(5) do |i|
      if temp_code[i] == temp_guess[i]
        @result[i] = "O"; temp_code[i] = "-"; temp_guess[i] = "-"
      end
    end
    0.upto(5) do |i|
      if temp_code[i] != "-"
        if temp_code.include? temp_guess[i]
          @result[i] = "X"
          temp_guess[i] = "-"
          temp_code.delete_at(temp_code.index(i) || temp_code.length)
        end
      end
    end
    0.upto(5) do |i|
      if @result[i].is_a? Integer
        @result[i] = "-"
      end
    end
    save_result = @result
    @result_hist.push(save_result)
    puts @result_hist
  end
end
