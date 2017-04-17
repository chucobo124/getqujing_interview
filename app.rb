require './quiz/game_of_life.rb'
board = [
  [0, 0, 1, 0],
  [1, 0, 0, 1],
  [1, 0, 0, 1],
  [0, 1, 0, 0]
]
game_of_life = GameOfLife.new(board)
loop do
  puts '------'
  game_of_life.execute.each do |cells|
    puts
    cells.each do |cell|
      if cell != 0
        print '■'
      else
        print '□'
      end
    end
  end
  sleep(0.5)
end
