def bubble_sort(arr)
  p "raw: #{arr}"
 for i in 0..arr.length-1 do 
    for j in 0 .. arr.length-i-2 do
      if arr[j]> arr[j+1]
        temp = arr[j]
        arr[j]= arr[j+1]
        arr[j+1] = temp
      end
    end
  end
  p "sorted: #{arr}"
end

  




bubble_sort([123,51,78,1,6,19,10])
bubble_sort([4,3,78,2,0,2])