require 'test_helper'

class ArrayNTest < Minitest::Test
  def setup
    @subject = ArrayN.new 2, 3, 5
  end

  def setup_filled(dimension, *dimensions)
    @subject = ArrayN.new(dimension, *dimensions) { |n| n }
  end

  def test_that_it_has_a_version_number
    refute_nil ::ArrayN::VERSION
  end

  def test_length
    assert_equal 30, @subject.length
    assert_equal 30, @subject.size
  end

  def test_rank
    assert_equal 3, @subject.rank
  end

  def test_in_bounds?
    assert @subject.in_bounds?(1, 2, 4)
    refute @subject.in_bounds?(2, 2, 4)
  end

  def test_store_fetch
    @subject.store 0, 0, 0, 0
    assert_equal 0, @subject.fetch(0, 0, 0)
  end

  def test_row_major_index
    assert_equal  1, @subject.row_major_index(0, 0, 1)
    assert_equal  5, @subject.row_major_index(0, 1, 0)
    assert_equal 15, @subject.row_major_index(1, 0, 0)
  end

  def test_to_a
    assert_equal [[[nil, nil, nil, nil, nil],
                   [nil, nil, nil, nil, nil],
                   [nil, nil, nil, nil, nil]],
                  [[nil, nil, nil, nil, nil],
                   [nil, nil, nil, nil, nil],
                   [nil, nil, nil, nil, nil]]], @subject.to_a
  end

  def test_to_a_filled
    setup_filled 2, 3, 5
    assert_equal [[[ 0,  1,  2,  3,  4],
                   [ 5,  6,  7,  8,  9],
                   [10, 11, 12, 13, 14]],
                  [[15, 16, 17, 18, 19],
                   [20, 21, 22, 23, 24],
                   [25, 26, 27, 28, 29]]], @subject.to_a
  end

  def test_to_a_filled_2
    setup_filled 5, 2, 3
    assert_equal [[[ 0,  1,  2], [ 3,  4,  5]],
                  [[ 6,  7,  8], [ 9, 10, 11]],
                  [[12, 13, 14], [15, 16, 17]],
                  [[18, 19, 20], [21, 22, 23]],
                  [[24, 25, 26], [27, 28, 29]]], @subject.to_a
  end

  def test_a_null_arrayn
    setup_filled 0
    assert_equal [], @subject.to_a
  end

  def test_a_0d_arrayn
    setup_filled 1
    assert_equal [0], @subject.to_a
  end

  def test_a_1d_arrayn
    setup_filled 6
    assert_equal [0, 1, 2, 3, 4, 5], @subject.to_a
  end

  def test_each
    setup_filled 8, 13
    assert_respond_to @subject, :each
  end
end
