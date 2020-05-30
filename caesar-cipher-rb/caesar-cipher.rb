require "pry"

puts "Enter word:"
str = gets.chomp

puts "Enter shift value:"
val = gets.chomp


def addVal (initial, val)

  initial = initial.to_i
  val = val.to_i

  if(initial>=65&&initial<=90)
    
    if(initial+val >90)
      return (65+(initial+val-90-1))
      
    end

    if(initial+val<65)
      return (90-(65-(initial+val)-1))
    end


    
  elsif(initial>=97&&initial<=122)
    
    if(initial+val >122) 
      return (97+(initial+val-122-1))
    end

    if(initial+val<97)
      return (122-(97-(initial+val)-1))
    end
  end

  return (initial+val)
end

def caesar_cipher (str, val)

  str = str.to_s
  val = val.to_i

  if (val <=-26 || val >=26)
    val%= 26 
  end


  opt =""
  arr = str.split("")
  

  arr.map! do |ch|
    
    code= 
    
    if (code>=65&& code <=90) || (code>=97&&  code <=122)
      ch = addVal(code, val).chr
    else
      ch = code.chr
    end

  end
  arr.each do |ch|
    opt+= ch
  end

  opt
  

end

puts "Ciphered String: #{caesar_cipher(str,val)}"






