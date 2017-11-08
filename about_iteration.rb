require File.expand_path(File.dirname(__FILE__) + '/neo')

class AboutIteration < Neo::Koan

  # --------------------------------------------------------
  # Ruby 1.8 은 이름을 string으로 저장합니다. 
  # Ruby 1.9 이상에서는 이름을 symbol로 저장합니다.
  # 그래서 우리는 버전 의존적 인 방법 "as_name" 메소드를 사용하여 올바른 형식으로 변환합니다.
  # 메소드 목록과 비교할 때마다 "as_name"을 사용합니다.

  in_ruby_version("1.8") do
    def as_name(name)
      name.to_s
    end
  end

  in_ruby_version("1.9", "2") do
    def as_name(name)
      name.to_sym
    end
  end

  # 다시 시작해 봅시다.
  # -------------------------------------------------------------------

  def test_each_is_a_method_on_arrays # each가 array의 메소드 있나요?
    assert_equal __, [].methods.include?(as_name(:each))
  end

  def test_iterating_with_each # each로 배열을 반복해봅시다.
    array = [1, 2, 3]
    sum = 0
    array.each do |item|
      sum += item
    end
    assert_equal __, sum
  end

  def test_each_can_use_curly_brace_blocks_too # each를 중괄호를 이용한 블록으로 사용가능합니다.
    array = [1, 2, 3]
    sum = 0
    array.each { |item| sum += item }
    assert_equal __, sum
  end

  def test_break_works_with_each_style_iterations # each 형태의 반복에서 break를 걸어봅시다.
    array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    sum = 0
    array.each do |item|
      break if item > 3
      sum += item
    end
    assert_equal __, sum
  end

  def test_collect_transforms_elements_of_an_array # Array의 원소들을 바꿔봅시다.
    array = [1, 2, 3]
    new_array = array.collect { |item| item + 10 }
    assert_equal __, new_array

    # NOTE: 'map' is another name for the 'collect' operation
    another_array = array.map { |item| item + 10 }
    assert_equal __, another_array
  end

  def test_select_selects_certain_items_from_an_array # select는 조건에 맞는 아이템을 찾아줍니다.
    array = [1, 2, 3, 4, 5, 6]

    even_numbers = array.select { |item| (item % 2) == 0 }
    assert_equal __, even_numbers

    # select의 다른이름은 find_all 입니다.
    more_even_numbers = array.find_all { |item| (item % 2) == 0 }
    assert_equal __, more_even_numbers
  end

  def test_find_locates_the_first_element_matching_a_criteria # find는 조건에 맞는 첫번째 항목을 찾아줍니다.
    array = ["Jim", "Bill", "Clarence", "Doug", "Eli"]

    assert_equal __, array.find { |item| item.size > 4 }
  end

  def test_inject_will_blow_your_mind # inject를 사용해봅시다.
    result = [2, 3, 4].inject(0) { |sum, item| sum + item }
    assert_equal __, result

    result2 = [2, 3, 4].inject(1) { |product, item| product * item }
    assert_equal __, result2

    # inject 메소드가 어떻게 사용되는지 자세하게 알아봅시다.
    # inject(초기값){|결과, 요소| 결과 + 요소}
  end

  def test_all_iteration_methods_work_on_any_collection_not_just_arrays
    # 모든 반복되는 메소드는 배열뿐 아니라 어떤 collection에서도 동작합니다
    # Ranges 는 collection 처럼 동작합니다.
    assert_equal __, result

    # 파일은 줄들의 collection 처럼 동작합니다.
    File.open("example_file.txt") do |file|
      upcase_lines = file.map { |line| line.strip.upcase }
      assert_equal __, upcase_lines
    end

  end

  # Bonus Question:  방금 우리는 다음과 같은 문장으로 파일을 불러왔습니다.:
  #
  #   File.open(filename) do |file|
  #     # code to read 'file'
  #   end
  #
  # 왜 아래와 같이 코드를 작성하지 않았을까요?
  #
  #   file = File.open(filename)
  #   # code to read 'file'
  #
  # 자신의 생각을 기록 해보고 about_sandwitch_code에 도착했을때 확인해봅시다.

end
