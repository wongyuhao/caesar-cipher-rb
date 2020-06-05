class Node
  attr_accessor :value, :nextNode
  def initialize(val =nil)
    @value = val
    @nextNode = nil
  end
end

class LinkedList 
  def initialize
    @head= nil
    @tail = nil
  end

  def head 
    return @head.value
  end

  def tail
    return @tail.value
  end

  def append(val)
    node = Node.new(val)
    if @head == nil
      @head =node
      @tail = node
     
    else
      @tail.nextNode = node
      @tail = node
    end
  end

  def prepend(val)
    node = Node.new(val)
    if @head == nil 
      @head =node
      @tail = node
    else
      node.nextNode= @head
      @head = node
    end
  end

  def  pop
    unless @head == nil 
      
      node = self.at(self.size-2)
      node.nextNode = nil
      @tail = node
    end
  end

  def to_s 
    if @head == nil     
      puts("Linked list is empty!")
      return  
    end
    point = @head
    
    until point == @tail do
      print "(#{point.value})->"
      point = point.nextNode
    end

    if point == @tail
      print  "(#{point.value})"
    end
    puts
  end
  
  def size
    point = @head
    if @head == nil 
      0
    else
      count = 0
      
      while point.nextNode != nil do
        count+=1
        point = point.nextNode
      end
      count+=1
      count
    end
  end


  def at(index)
    if(index>=self.size)
      return nil
    else
      point =@head
      index.times {point=point.nextNode}
      return point
    end
  end

  def find(value)
    if @head == nil 
      return nil
    end
    point = @head
    
    until point == @tail do
      if point.value == value
        return point
      else
      point = point.nextNode
      end
    end

    if point == @tail
      if point.value == value
        return point
      else 
        return nil 
      end
    end
  end

  def contains(val)
    self.find(val)? true : false
  end

  def insert_at(val , index)
    if @head == nil || index > self.size+1

    else
      if index == self.size
        self.append(val)
      else
        node = Node.new(val)
        node.nextNode = self.at(index)
        (self.at(index-1)).nextNode = node
      end
    end

  end

  
 

end #end of linked list class

llist = LinkedList.new
llist.to_s
llist.append(3)
llist.append(2)
llist.append(3)
llist.append(2)
llist.append(3)
llist.append(2)
llist.prepend(100)
llist.to_s
llist.pop
llist.pop
llist.to_s
p llist.size
llist.insert_at(200, 2)
llist.to_s



llist.to_s


