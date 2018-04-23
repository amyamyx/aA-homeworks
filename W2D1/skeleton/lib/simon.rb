class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
    @input_seq = []
  end

  def play
    take_turn until game_over
    game_over_message
    reset_game

  end

  def take_turn
    show_sequence
    require_sequence
    unless game_over
      round_success_message
      @sequence_length += 1
      show_sequence
    end

  end

  def show_sequence
    add_random_color
    @sequence_length.times do |i|
      puts "Here's the sequence:"
      puts @seq[i]
      sleep(1)
      system('clear')
      sleep(0.5)
    end
  end

  def require_sequence
    puts "Enter a color sequence: "
    puts @seq
    input = gets.chomp
    process_input(input)
    @game_over = true unless @input_seq == @seq
  end

  def process_input(input)
    @input_seq = []
    color = { "r" => "red", "b" => "blue", "g" => "green", "y" => "yellow"}
    input.chars.each do |ch|
      @input_seq << color[ch]
    end
  end


  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message
    p "Good job!"
  end

  def game_over_message
    p "You lose. Try again."
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
    @input_seq = []
  end
end

if __FILE__ == $PROGRAM_NAME
  game = Simon.new
  game.play
end
