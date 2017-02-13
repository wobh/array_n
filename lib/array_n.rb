require 'array_n/version'

# Multi-dimensional array
class ArrayN
  include Enumerable

  def initialize (dimension, *dimensions, &blk)
    @dimensions = dimension, *dimensions
    @dimensions.freeze
    @elements = Array.new(length, &blk)
  end
  attr_reader :dimensions

  def each
    yield @elements
  end

  def length
    @length ||= @dimensions.reduce(:*)
  end
  alias_method :size, :length

  def rank
    @rank ||= dimensions.size
  end

  def in_bounds? (subscript, *subscripts)
    all = subscript, *subscripts
    return false unless all.size == rank
    rank.times do |idx|
      one = all.fetch(idx)
      return false if one < 0
      return false unless one < dimensions.fetch(idx)
    end
    true
  end

  def fetch (subscript, *subscripts)
    @elements.fetch row_major_index(subscript, *subscripts)
  end

  def store (item, subscript, *subscripts)
    @array = nil
    @elements[row_major_index(subscript, *subscripts)] = item
    self
  end

  def row_major_index (subscript, *subscripts)
    raise IndexError unless in_bounds?(subscript, *subscripts)
    ndets = subscript, *subscripts
    index, scale = 0, 1
    (rank - 1).downto(0) do |idx|
      index += scale * ndets[idx]
      scale *= dimensions[idx]
    end
    index
  end

  def to_a
    @array ||= begin
                 ary = @elements.dup
                 dims = dimensions.reverse
                 dims.pop
                 dims.each do |dim|
                   ary = ary.reduce([[]]) do |acc, elt|
                     acc << [] if acc.last.size == dim
                     acc.last << elt
                     acc
                   end
                 end
                 ary.freeze
               end
  end
end
