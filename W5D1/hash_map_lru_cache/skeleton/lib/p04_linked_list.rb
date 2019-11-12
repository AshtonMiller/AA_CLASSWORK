class Node
  attr_reader :key
  attr_accessor :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
  end
end

class LinkedList

  include Enumerable

  def initialize
    @head = Node.new
    @tail = Node.new
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    @head.next == @tail && @tail.prev == @head
  end

  def get(key)
    curr_node = @head
    while curr_node != @tail
      curr_node = curr_node.next
      return curr_node.val if curr_node.key == key
    end 

  end

  def include?(key)
    curr_node = @head
    while curr_node != @tail
      curr_node = curr_node.next
      return true if curr_node.key == key
    end 
    false 
  end

  def append(key, val)
    new_node = Node.new(key, val)
    prev_node = @tail.prev
    @tail.prev = new_node
    new_node.next = @tail
    new_node.prev = prev_node
    prev_node.next = new_node
  end

  def update(key, val)
    curr_node = @head
    while curr_node != @tail
      curr_node = curr_node.next
      curr_node.val = val if curr_node.key == key
    end 

  end

  def remove(key)
      # check whether included
      curr_node = @head
      while curr_node != @tail
          curr_node = curr_node.next
          break if curr_node.key == key
      end
      prev_node = curr_node.prev
      next_node = curr_node.next
      prev_node.next = next_node
      next_node.prev = prev_node
      curr_node.next = nil
      curr_node.prev = nil
  end

  def each(&prc)
    curr_node = @head
    while curr_node != @tail
      curr_node = curr_node.next
      prc.call(curr_node) if curr_node != @tail
    end 

  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
