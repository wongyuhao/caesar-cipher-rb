

def merge_sort(arr)
 
  if arr.length <=1 
    return arr
  else 
    mid = arr.length/2
    left = merge_sort(arr[0...mid])
    right = merge_sort(arr[mid...])
    return merge(left, right)
  end
  
end

def merge(left, right)
  arr=[]
  while left.length!=0 && right.length!=0 do
    if left[0] < right[0]
      arr.push(left.shift)
    else
      arr.push(right.shift)
    end
  end

  while left.length!=0 do
    arr.push(left.shift)
  end

  while right.length!=0 do
    arr.push(right.shift)
  end

  arr
end
arr =[123,51,78,1,6,19,10]

p merge_sort(arr)
p merge_sort([123,2134,7,12,674,8,1,9,-1123,123,-12121])