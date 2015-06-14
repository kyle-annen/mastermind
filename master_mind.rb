class MasterMind

  def initialize
    @win, @code, @numbers, @guess, @board, @turn, @guess_hist, @result, @result_hist = false, [1,2,3,4,5,6], [1,2,3,4,5,6], [], [1,2,3,4,5,6], 0, [], [1,2,3,4,5,6], []
  end

  def new_game
    puts "Let's Play MasterMind!"
    puts "You will have 12 rounds to guess the code."
    puts "| O | stands for correct guess, correct Location."
    puts "| X | is correct guess, wrong location"
    puts ""
    gen_code
    while @turn < 12 && @win == false
      get_guess
      check_guess
      draw_game
    end
    if @win == true
      puts "You have won the game in #{@turn} turns!"
    else
      puts "MasterMind has mastered you!"
    end
  end

  def draw_game
    for i in 0..(@guess_hist.length - 1)
      print "round #{i+1}: "
      print (@guess_hist.length - 1) < 10 ? " " : ""
      draw_board(@guess_hist[i])
      print " <> "
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
    6.times {@code << rand(5) + 1}
  end

  def get_guess
    save_guess = []
    internal_guess = 8
    0.upto(5) do |i|
      puts "Input 1-6 for guess #{i+1}"
      internal_guess = gets.chomp.to_i
      until @numbers.include? internal_guess
        puts "Input 1-6 for guess #{i+1}"
        internal_guess = gets.chomp.to_i
      end
      save_guess.push(internal_guess)
    end
    @turn += 1;
    @guess = save_guess
    @guess_hist.push(save_guess)
  end

  def check_guess
    code_hash = Hash.new(0)
    save_result = [1,2,3,4,5,6]
    @code.each do |i|
      code_hash[i] += 1
    end
    0.upto(5) do |i|
      if @guess[i] == @code[i]
        save_result[i] = "O"
        code_hash[@guess[i]] -= 1
      end
    end
    0.upto(5) do |i|
      if save_result[i] != "O"
        if code_hash[@guess[i]] > 0
          save_result[i] = "X"
          code_hash[@guess[i]] -= 1
        else
          save_result[i] = "-"
        end
      else
        next
      end
    end
    @result_hist.push(save_result)
    check_win = 0
    0.upto(5) do |i|
      if save_result[i] == "O"
        check_win += 1
      else
        next
      end
    end
    @win = check_win == 6 ? true : false
  end
end
