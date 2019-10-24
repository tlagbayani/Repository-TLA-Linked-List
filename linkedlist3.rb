# Floyds Tortoise and the Hare infinite loop cycle detection

class LinkedListNode
  attr_accessor :value, :next_node

  def initialize(value, next_node=nil)
    @value = value
    @next_node = next_node
  end
end

def print_values(list_node)
  if list_node
    print "#{list_node.value} --> "
    print_values(list_node.next_node)
  else
    print "nil\n"
    return
  end
end

def infinite_loop?(list)
  tortoise = list.next_node
  hare = list.next_node

  until hare.nil?
    hare = hare.next_node
    return false if hare.nil?

    hare = hare.next_node
    tortoise = tortoise.next_node
    return true if hare == tortoise
  end

  return false
end

node1 = LinkedListNode.new(37)
node2 = LinkedListNode.new(99, node1)
node3 = LinkedListNode.new(12, node2)
node4 = LinkedListNode.new(45, node3)
node5 = LinkedListNode.new(21, node4)
node6 = LinkedListNode.new(31, node5)
node7 = LinkedListNode.new(34, node6)

puts infinite_loop?(node5)
puts infinite_loop?(node6)
node2.next_node = node2 # creates an infinite loop
puts infinite_loop?(node7)