

class Board 
  attr_accessor:winChar
  attr_accessor:win
  def initialize(p1,p2)
    @win = false
    @winChar=""
    @grid =[]
    @p1 = p1
    @p2 = p2
    3.times do
      @grid.push(["_","_","_"])
    end
  end


  def render
    
    puts "\n0 1 2"
     @grid.each_with_index do |row, index|
      row.each_with_index do |val|
        print "#{val} "
      end
      print index
      puts"\n"
    end
    puts"\n"
  end

  def place(chr,y,x)


    if @grid[y][x] == "_"
      @grid[y][x] = chr
      
      checkBoard
      true
    else 
      false
    end
  
  end

  

  def evaluate(arr)
    if (arr.all?{|chr| chr!="_"})&&
      ((arr.all?{|chr| chr==@p1.ch})||(arr.all?{|chr| chr==@p2.ch}))
      return true;
    else
      return false;
    end
  end
  
  def checkBoard
    winningCol
    winningDiag
    winningRow
  end
  
  def winningRow  
    @grid.each do |row|
      if evaluate(row)
        @win = true
        @winChar = row[0] 
        true
      else
        false
      end
    end
  end

  def winningCol
    (@grid[0].length).times do |col|
      arr = []
      @grid.length.times do |row|
        arr.push(@grid[row][col])
      end

      if evaluate(arr)
        @win = true
        @winChar = arr[0] 
        true
      else
        false
      end
    end
  end

  def winningDiag
    arr1 = []
    arr2= []
    @grid.length.times do |i|
      arr1.push(@grid[i][i])

      arr2.push(@grid[i][2-i])
    end

    if evaluate(arr1)||evaluate(arr2)
      @win = true
      @winChar =@grid[1][1]
      true
    else
      false
    end

  end


  

end

class Player
  attr_accessor :ch
  def initialize(ch)
    @ch = ch
  end

 
end

class Game 
  attr_accessor:board
  def initialize(ch1, ch2)
    @players = []
    @players.push(Player.new(ch1))
    @players.push(Player.new(ch2))
    @board = Board.new(@players[0],@players[1])
    @round =0;
  end
  def input
    while true do 
      ipt = gets.chomp
      
      

      begin
        ipt = Integer(ipt)
        if(ipt<0||ipt>2)
          puts "Input out of range. Try Again:"
        else
          return ipt
        end
        
      rescue ArgumentError, TypeError
        puts "Invalid input. Try Again:"    
        
      end
    end
  end
  def start
    
      puts "TIC TAC TOE!\n"
      while(@board.win == false) do

        @board.render


        ch = @players[@round%2].ch

        puts"Player #{(@round%2)+1} turn (#{ch})"
        while true 
          puts "Enter row:"
          y =input
          puts "Enter column:"
          x = input
          if @board.place(ch,y.to_i,x.to_i)
            puts "placed #{ch} at y= #{y},x = #{x}"
            @round+=1
            break
          else
          puts "Space is occupied! Try again: \n"
          end

        end



      end
      puts "Player #{(@round%2)} wins!"

    

    


  end




end



myGame = Game.new("X","O")
myGame.start

