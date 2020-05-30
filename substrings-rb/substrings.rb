
dict = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

def substrings(word, dict)
  dict.reduce(Hash.new(0)) do |result, string |
    if word.downcase.include?(string)
      result[string]+=1
      result
    else
      result
    end
  end

end

p substrings("Howdy partner, sit down! How's it going?", dict)

