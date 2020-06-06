require_relative "Node"

class Tree
  def initialize(arr)
    @root=self.build_tree(arr.sort.uniq)
  end

  def build_tree(arr)
    #[1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]
    #[1, 3, 4, 5, 7, 8, 9, 23, 67, 324, 6345]
    return nil if arr.length == 0 
    return Node.new(arr[0]) if arr.length<2

    
    mid = arr.length/2
    root = Node.new(arr[mid])
    root.left = build_tree(arr.take(mid))
    root.right = build_tree(arr.drop(mid+1))

    return root
  end

  def insert(val, current = @root)
    
    return false if val == current.value 

    if val <current.value
      current.left.nil? ? current.left =Node.new(val) : insert(val, current.left)
    else
      current.right.nil? ? current.right = Node.new(val) : insert(val, current.right)
    end

    return true

  end
    
  def find(val)
   level_order {|node| return node if val == node.value}
  end

  def find_min(current=@root)
    #find minimum assuming already gone right once
   if current.left.nil?
    return current
   else
    find_min(current.left)
   end
  end

  def delete(val)
    return false if @root.nil?

    node = self.find(val)
    parent =nil
    self.level_order {|n| parent = n if (n.left == node|| n.right == node)}

    if node.is_leaf? #node is leaf
      parent.left == node ? parent.left = nil : parent.right = nil
    elsif node.one_child?
      if parent.left == node
        parent.left = node.left ? node.left : node.right
      else 
        parent.right = node.left ? node.left : node.right
      end
    else
      min_node = find_min(node.right)
      replace_node(min_node, node)
      remove_min(min_node)
    end
  end



  def replace(replaced, current)
    replaced.value = current.value
  end

  def remove_min(min)
    min=nil
  end

  def remove(val, current =@root)
    #1. node does not exist, nothing happens
    if !find(val)
      return nil
    else 

    end
  end


  def depth(node=@root)
    return 0 if node.nil?

    left = depth(node.left)
    right =depth(node.right)

    left>right ? left+1 : right+1
  end

  def level_order
    queue =[@root]
    output=[]
    
    until queue.empty?
      current = queue.shift

      block_given? ? yield(current) : output.push(current.value)
      queue.push(current.left) unless current.left.nil?
      queue.push(current.right) unless current.right.nil?
    end

    return output unless block_given?
  end

  def inorder(current = @root, output =[])
    
    return if current.nil?
    yield(node) if block_given?
    inorder(current.left, output)
    output.push(current.value)
    inorder(current.right,output)

    return output
  end

  def preorder(current = @root, output = [])
    return if current.nil?
    block_given? ? yield(current) : output.push(current.value)
    preorder(current.left, output)
    preorder(current.right, output)
    output
  end

  def postorder(current=@root, output =[])
    return if current.nil?
    yield(current) if block_given?
    postorder(current.left, output)
    postorder(current.right, output)
    output.push(current.value)
    output
  end


  def rebalance
    @root = build_tree(level_order)
  end

  def balanced?
    (depth(@root.left)-depth(@root.right)).abs <=1
  end

  
end

