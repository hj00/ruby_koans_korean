require File.expand_path(File.dirname(__FILE__) + '/neo')

class AboutStrings < Neo::Koan
  def test_double_quoted_strings_are_strings # 큰따옴표 string
    string = "Hello, World"
    assert_equal __, string.is_a?(String)
  end

  def test_single_quoted_strings_are_also_strings # 작은따옴표 string
    string = 'Goodbye, World'
    assert_equal __, string.is_a?(String)
  end

  def test_use_single_quotes_to_create_string_with_double_quotes # 작은따옴표 안의 큰따옴표
    string = 'He said, "Go Away."'
    assert_equal __, string
  end

  def test_use_double_quotes_to_create_strings_with_single_quotes # 큰따옴표 안의 작은따옴표
    string = "Don't"
    assert_equal __, string
  end

  def test_use_backslash_for_those_hard_cases # 두문장을 비교해봅시다.
    a = "He said, \"Don't\""
    b = 'He said, "Don\'t"'
    assert_equal __, a == b
  end

  def test_use_flexible_quoting_to_handle_really_hard_cases
    a = %(flexible quotes can handle both ' and " characters)
    b = %!flexible quotes can handle both ' and " characters!
    c = %{flexible quotes can handle both ' and " characters}
    assert_equal __, a == b
    assert_equal __, a == c
  end

  def test_flexible_quotes_can_handle_multiple_lines
    long_string = %{
It was the best of times,
It was the worst of times.
}
    assert_equal __, long_string.length
    assert_equal __, long_string.lines.count
    assert_equal __, long_string[0,1]
  end

  def test_here_documents_can_also_handle_multiple_lines
    long_string = <<EOS
It was the best of times,
It was the worst of times.
EOS
    assert_equal __, long_string.length
    assert_equal __, long_string.lines.count
    assert_equal __, long_string[0,1]
  end

  def test_plus_will_concatenate_two_strings # 두개의 string을 결합해봅시다.
    string = "Hello, " + "World"
    assert_equal __, string
  end

  def test_plus_concatenation_will_leave_the_original_strings_unmodified # 원래의 string은 그대로 남습니다.
    hi = "Hello, "
    there = "World"
    string = hi + there
    assert_equal __, hi
    assert_equal __, there
  end

  def test_plus_equals_will_concatenate_to_the_end_of_a_string # +=을 사용해봅시다.
    hi = "Hello, "
    there = "World"
    hi += there
    assert_equal __, hi
  end

  def test_plus_equals_also_will_leave_the_original_string_unmodified # +=는 original_string을 수정하지 않습니다.
    original_string = "Hello, "
    hi = original_string
    there = "World"
    hi += there
    assert_equal __, original_string
  end

  def test_the_shovel_operator_will_also_append_content_to_a_string # <<를 이용해서 string을 넣어봅시다.
    hi = "Hello, "
    there = "World"
    hi << there
    assert_equal __, hi
    assert_equal __, there
  end

  def test_the_shovel_operator_modifies_the_original_string # <<는 original_string을 수정합니다.
    original_string = "Hello, "
    hi = original_string
    there = "World"
    hi << there
    assert_equal __, original_string

    # 생각해봅시다.:
    #
    # 루비 프로그래머는 문자열을 작성할 때 += 연산자보다 << 연산자를 선호하는 경향이 있습니다. 왜?
  end

  def test_double_quoted_string_interpret_escape_characters # 큰따옴표는 interpret됩니다.
    string = "\n"
    assert_equal __, string.size
  end

  def test_single_quoted_string_do_not_interpret_escape_characters # 작은따옴표는 interpret되지 않습니다.
    string = '\n'
    assert_equal __, string.size
  end

  def test_single_quotes_sometimes_interpret_escape_characters # 작은따옴표가 interpret되는 경우
    string = '\\\''
    assert_equal __, string.size
    assert_equal __, string
  end

  def test_double_quoted_strings_interpolate_variables # 큰따옴표는 중간에 변수를 넣을수 있습니다.
    value = 123
    string = "The value is #{value}"
    assert_equal __, string
  end

  def test_single_quoted_strings_do_not_interpolate # 작은따옴표는 중간에 변수를 넣을수 없습니다.
    value = 123
    string = 'The value is #{value}'
    assert_equal __, string
  end

  def test_any_ruby_expression_may_be_interpolated # 루비문법도 넣을수 있습니다.
    string = "The square root of 5 is #{Math.sqrt(5)}"
    assert_equal __, string
  end

  def test_you_can_get_a_substring_from_a_string # string의 일부분을 가져올수 있습니다.
    string = "Bacon, lettuce and tomato"
    assert_equal __, string[7,3]
    assert_equal __, string[7..9]
  end

  def test_you_can_get_a_single_character_from_a_string # string을 배열처럼 접근할 수 있습니다.
    string = "Bacon, lettuce and tomato"
    assert_equal __, string[1]

    # Surprised?
  end

  in_ruby_version("1.8") do
    def test_in_older_ruby_single_characters_are_represented_by_integers # 옛날버전의 루비
      assert_equal __, ?a
      assert_equal __, ?a == 97

      assert_equal __, ?b == (?a + 1)
    end
  end

  in_ruby_version("1.9", "2") do
    def test_in_modern_ruby_single_characters_are_represented_by_strings # 최신버전의 루비
      assert_equal __, ?a
      assert_equal __, ?a == 97

      # "a".ord를 사용하면 "a"의 아스키코드를 알 수 있습니다.
      # ?a.ord == 97 이문장은 참입니다.
    end
  end

  def test_strings_can_be_split # string을 분리해 봅시다.
    string = "Sausage Egg Cheese"
    words = string.split
    assert_equal [__, __, __], words
  end

  def test_strings_can_be_split_with_different_patterns # string을 다른 패턴으로 분리해 봅시다.
    string = "the:rain:in:spain"
    words = string.split(/:/)
    assert_equal [__, __, __, __], words

    # NOTE: 여기서 패턴은 정규표현식으로 나타냅니다.
    # 정규표현식은 앞으로 더 자세하게 배워볼 예정입니다.
  end

  def test_strings_can_be_joined # join 메소드를 사용해 봅시다.
    words = ["Now", "is", "the", "time"]
    assert_equal __, words.join(" ")
  end

  def test_strings_are_unique_objects # 각각의 string은 unique한 객체입니다.
    a = "a string"
    b = "a string"

    assert_equal __, a           == b
    assert_equal __, a.object_id == b.object_id
  end
end
