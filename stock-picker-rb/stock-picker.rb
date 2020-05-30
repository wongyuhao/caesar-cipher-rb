def stock_picker(arr)
  results={}

  arr.each_with_index do |val, buyday|
    (buyday+1..arr.length-1).each do |sellday|
      profit = arr[sellday] - val
      results[[buyday,sellday]]= profit if profit>0
    end
  end


  puts "BUY/SELL:#{results.key(results.values.max).join("/")} \nPROFIT: #{results.values.max}"
end




stock_picker([17,3,6,9,15,8,6,1,10])