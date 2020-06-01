require_relative 'player'

class Game
  def initialize(gamemode, max_attempts =12)
    @gamemode = gamemode
    @max_attempts = max_attempts
    @attempts = 0
    @player = nil
   
    @answer = []
  end

  def start 
    if @gamemode =="g"
      puts "You are playing as the guesser!"
      @player =Player.new
      4.times do 
        @answer.push(rand(9))
      end
      puts "\ndebug: answer is #{@answer}\n"
      gamemode_guess
    elsif @gamemode =="m"
      
      puts "You are playing as the mastermind!"
      @p1 = Player.new
      puts "Enter code for the computer to guess"
      @answer = @p1.input
      @player= Computer.new
      puts "\ndebug: answer is #{@answer}\n"
      gamemode_mastermind
    end

    
  end

  def gamemode_guess 
   
    while @attempts<@max_attempts do
      @attempts+=1
      puts "Attempt #{@attempts}/#{@max_attempts}"
      hints =compare(@player.guess)
  
      puts "Hints #{hints.values}"
      2.times do puts end
      if hints.values.all?{|n| n == "HIT"}
        puts "YOU WIN"
        break
      end

      if @attempts == @max_attempts 
        puts "YOU LOSE. The code was: #{@answer}"
      end
    end
  end

  def gamemode_mastermind
   
    while @attempts<@max_attempts do
      @attempts+=1
      puts "Attempt #{@attempts}/#{@max_attempts}"
      
      hints =compare(@player.guess)
      @player.learn(hints)
      puts "Hints #{hints.values}"
      2.times do puts end
      if hints.values.all?{|n| n == "HIT"}
        puts "COMPUTER WON"
        break
      end

      if @attempts == @max_attempts 
        puts "COMPUTER RAN OUT OF ATTEMPTS! The code was: #{@answer}"
      end
    end
  end


  def compare(guess)
    
    hints ={}

    guess.each_with_index do|val,index|
      
     if @answer[index]== val
      hints[index]="HIT"
     elsif @answer.include?(val)
      hints[index]="INCL"
     else
      hints[index]="NONE"
     end
    end

    
    
    return hints
  end

  
end


puts "Welcome to Mastermind-rb!\n\n"
puts "Do you want to play as the guesser or the mastermind?"
puts "Guesser(G)  //  Mastermind (M)"
myGame= nil;
while true do 
  mode = gets
  if mode.chomp.downcase == "g" || mode.chomp.downcase == "m"
    myGame = Game.new(mode.chomp.downcase,)
    break
  else
    puts "Invalid selection, please choose either [G] or [M]"
  end
end

myGame.start
  