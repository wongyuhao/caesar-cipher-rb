class Player
  def initialize
    
  end

  def int_to_arr(num)
    arr =num.to_s.split("")
    arr.map! do |n|
      n= Integer(n)
    end
    return arr
  end

  def guess
    print "Enter your guess:"
    return input
    
  end

  def input
    input =nil
    while true
      input = gets.chomp
      begin
        input = Integer(input)
        if int_to_arr(input).length == 4 && int_to_arr(input).all?{|n| n>=0 && n<=9}
          input = int_to_arr(input)
          return input

        else
          print "Invalid input. Try agan:"
        end
        
      rescue ArgumentError, TypeError
        puts "Invalid input. Try Again:"    
        
      end
    end
  end
end

class Computer < Player
  def initialize
    @hit ={}
    @incl={}
    @last = nil
  end

  def guess
    sleep(0.5)
    guess=[]
    4.times do 
      guess.push(rand(9))
    end
    
    @hit.keys.each do |n|
      guess[n] = @hit[n]
    end

   

    @incl.values.each do |val|
      index = nil
      while true do
        index = rand(3)
        unless @hit.values.include?(index)
          break
        end
      end
      guess[index] = val 
    end
    

    @last = guess
    puts "Computer guessed #{@last}"
    p @hit
    p @incl
   
      
    return guess
  end

  def learn(hash)
    hash.keys.each do |key|
      case hash[key]
      when "HIT"
        @hit[key]=@last[key]
      when "INCL"
        @incl[key]=@last[key]
      end
    end
  end
end