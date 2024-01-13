# frozen_string_literal: true

require_relative 'node'

# class which will store linked list
class LinkedList
  attr_reader :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  def append(value)
    if @head.nil?
      @head = Node.new(value)
    else
      current = @head
      current = current.next_node until current.next_node.nil?
      current.next_node = Node.new(value)
      @tail = current.next_node
    end
  end

  def prepend(value)
    prepended = Node.new(value)
    prepended.next_node = @head
    @head = prepended
  end

  def size(count = 1, current = @head)
    until current.next_node.nil?
      count += 1
      current = current.next_node
    end
    count
  end

  def at(index, current = @head)
    if index > size
      'index is out of range'
    else
      index.times do
        current = current.next_node
      end
    end
    current
  end

  def pop
    current = @head
    current = current.next_node until current.next_node == @tail
    current.next_node = nil
    @tail = current
  end

  def contains?(value, current = @head, bool: false)
    until current.nil?
      bool = true if current.value == value
      current = current.next_node
    end
    bool
  end

  def find(value, current = @head, index = 0)
    if contains?(value)
      until current.value == value
        index += 1
        current = current.next_node
      end
    else
      index = nil
    end
    index
  end

  def to_s(current = @head)
    until current.nil?
      print "(#{current.value}) -> "
      current = current.next_node
    end
  end
end
