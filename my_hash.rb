# frozen_string_literal: true

require_relative 'linked_list'

# Custom implementation of hash
class MyHash
  attr_reader :buckets, :capacity, :load_factor
  # raise IndexError if index.negative? || index >= @buckets.length
  def initialize
    @buckets = Array.new(16)
    @capacity = 0
    @load_factor = 0.75
  end

  def hash(string)
    hash_value = 0
    prime_number = 17

    string.each_char { |char| hash_value = hash_value * prime_number + char.ord }
    hash_value
  end

  def set(key, value)
    buckets[hash(key) % buckets.length] = LinkedList.new.append(value)
  end

  def get; end

  def key?; end

  def remove; end

  def length; end

  def clear; end

  def keys; end

  def values; end

  def entries; end
end
