# frozen_string_literal: true

require_relative 'linked_list'

# Custom implementation of hash data structure
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

    string.each_char.with_index { |char, i| hash_value += char.ord * prime_number**i }

    hash_value
  rescue NoMethodError
    puts 'please enter a string argument'
  end

  def set(key, value)
    expand_buckets if at_load_factor? # grows hash to avoid collision
    @capacity += 1

    index = hash(key) % buckets.length
    buckets[index] = LinkedList.new if buckets[index].nil?

    buckets[index].append(value)
  end

  def get; end

  def key?; end

  def remove; end

  def length; end

  def clear; end

  def keys; end

  def values; end

  def entries; end

  private

  def at_load_factor?
    return true if capacity / buckets.length.to_f >= load_factor

    false
  end

  def expand_buckets
    buckets.length.times { buckets << nil }
  end
end
