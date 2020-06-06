require_relative "binary-search-tree"

bst = Tree.new((Array.new(15) { rand(1..100) })) 
p bst.balanced?
p bst.level_order
p bst.preorder
p bst.inorder
p bst.postorder

10.times do 
  bst.insert(rand(100...200))
end

p bst.balanced?

bst.rebalance

p bst.balanced?

p bst.level_order
p bst.preorder
p bst.inorder
p bst.postorder