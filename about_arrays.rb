require File.expand_path(File.dirname(__FILE__) + '/neo')

class AboutArrays < Neo::Koan
  def test_creating_arrays #Array를 생성해봅시다
    empty_array = Array.new
    assert_equal Array, empty_array.class
    assert_equal 0, empty_array.size
  end

  def test_array_literals #Array에 데이터를 넣어봅시다.
    array = Array.new
    assert_equal [], array

    array[0] = 1
    assert_equal [1], array

    array[1] = 2
    assert_equal [1, 2], array

    array << 333
    assert_equal [1, 2 , 333], array
  end

  def test_accessing_array_elements #Array 항목들에 접근해봅시다.
    array = [:peanut, :butter, :and, :jelly]

    assert_equal :peanut, array[0]
    assert_equal :peanut, array.first
    assert_equal :jelly, array[3]
    assert_equal :jelly, array.last
    assert_equal :jelly, array[-1]
    assert_equal :butter, array[-3]
  end

  def test_slicing_arrays #Array를 쪼개봅시다.
    array = [:peanut, :butter, :and, :jelly]

    assert_equal [:peanut], array[0,1]
    assert_equal [:peanut, :butter], array[0,2]
    assert_equal [:and, :jelly], array[2,2]
    assert_equal [:and, :jelly], array[2,20]
    assert_equal [], array[4,0]
    assert_equal [], array[4,100]
    assert_equal nil, array[5,0]
  end

  def test_arrays_and_ranges #Array와 Range를 비교해봅시다.
    assert_equal __, (1..5).class
    assert_not_equal [1,2,3,4,5], (1..5)
    assert_equal __, (1..5).to_a
    assert_equal __, (1...5).to_a
  end

  def test_slicing_with_ranges #Range로 잘라봅시다.
    array = [:peanut, :butter, :and, :jelly]

    assert_equal __, array[0..2]
    assert_equal __, array[0...2]
    assert_equal __, array[2..-1]
  end

  def test_pushing_and_popping_arrays # Array의 메소드 push와 pop을 사용해봅시다.
    array = [1,2]
    array.push(:last)

    assert_equal __, array

    popped_value = array.pop
    assert_equal __, popped_value
    assert_equal __, array
  end

  def test_shifting_arrays # Array에서 shift를 사용해봅시다.
    array = [1,2]
    array.unshift(:first)

    assert_equal __, array

    shifted_value = array.shift
    assert_equal __, shifted_value
    assert_equal __, array
  end

end
