# -*- coding: utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/neo')

class AboutRegularExpressions < Neo::Koan
  def test_a_pattern_is_a_regular_expression # 정규표현식은 패턴입니다.
    assert_equal __, /pattern/.class
  end

  def test_a_regexp_can_search_a_string_for_matching_content # 정규표현식은 똑같은 부분을 찾습니다.
    assert_equal __, "some matching content"[/match/]
  end

  def test_a_failed_match_returns_nil # 정규표현식은 맞는 부분이 없으면 nil을 반환합니다.
    assert_equal __, "some matching content"[/missing/]
  end

  # ------------------------------------------------------------------

  def test_question_mark_means_optional # ? 기호는 옵션을 나타냅니다.
    assert_equal __, "abbcccddddeeeee"[/ab?/]
    assert_equal __, "abbcccddddeeeee"[/az?/]
  end

  def test_plus_means_one_or_more # + 기호는 하나 또는 그이상을 나타냅니다.
    assert_equal __, "abbcccddddeeeee"[/bc+/]
  end

  def test_asterisk_means_zero_or_more # * 기호는 0 또는 그 이상을 나타냅니다.
    assert_equal __, "abbcccddddeeeee"[/ab*/]
    assert_equal __, "abbcccddddeeeee"[/az*/]
    assert_equal __, "abbcccddddeeeee"[/z*/]

    # 생각해 봅시다:
    #
    # * 기호는 언제 matching에 실패 할까요?
  end

  # 생각해 봅시다:
  #
  # 위의 반복 연산자(*)는 욕심이라고 합니다. 왜그럴까요?

  # ------------------------------------------------------------------

  def test_the_left_most_match_wins # 가장 왼쪽이 우선입니다.
    assert_equal __, "abbccc az"[/az*/]
  end

  # ------------------------------------------------------------------

  def test_character_classes_give_options_for_a_character # []기호는 선택을 나타냅니다. 
    animals = ["cat", "bat", "rat", "zat"]
    assert_equal __, animals.select { |a| a[/[cbr]at/] }
  end

  def test_slash_d_is_a_shortcut_for_a_digit_character_class # \d 는 숫자를 나타냅니다.
    assert_equal __, "the number is 42"[/[0123456789]+/]
    assert_equal __, "the number is 42"[/\d+/]
  end

  def test_character_classes_can_include_ranges # []기호 안에 범위를 포함 할 수 있습니다.
    assert_equal __, "the number is 42"[/[0-9]+/]
  end

  def test_slash_s_is_a_shortcut_for_a_whitespace_character_class # \s 는 공백을 나타냅니다.([\t\n\r\f] 다음과 같습니다.)
    assert_equal __, "space: \t\n"[/\s+/]
  end

  def test_slash_w_is_a_shortcut_for_a_word_character_class # \w 는 숫자 혹은 알파벳 [0-9A-Za-z]와 같습니다.
    assert_equal __, "variable_1 = 42"[/[a-zA-Z0-9_]+/]
    assert_equal __, "variable_1 = 42"[/\w+/]
  end

  def test_period_is_a_shortcut_for_any_non_newline_character # . 은 줄바꿈이 일어나지 않는 범위에서 문자를 나타냅니다.
    assert_equal __, "abc\n123"[/a.+/]
  end

  def test_a_character_class_can_be_negated # []기호 안에서 ^ 기호를 이용하여 부정(NOT)을 할 수 있습니다.
    assert_equal __, "the number is 42"[/[^0-9]+/]
  end

  def test_shortcut_character_classes_are_negated_with_capitals # 대문자를 사용하여 부정(NOT)을 할 수 있습니다.
    assert_equal __, "the number is 42"[/\D+/]
    assert_equal __, "space: \t\n"[/\S+/]

    assert_equal __, "variable_1 = 42"[/[^a-zA-Z0-9_]+/]
    assert_equal __, "variable_1 = 42"[/\W+/]
  end

  # ------------------------------------------------------------------

  def test_slash_a_anchors_to_the_start_of_the_string # \A는 문자열의 시작점을 나타낸다
    assert_equal __, "start end"[/\Astart/]
    assert_equal __, "start end"[/\Aend/]
  end

  def test_slash_z_anchors_to_the_end_of_the_string # \z는 문자열의 끝지점을 나타낸다.
    assert_equal __, "start end"[/end\z/]
    assert_equal __, "start end"[/start\z/]
  end

  def test_caret_anchors_to_the_start_of_lines # ^ 기호는 줄의 시작점을 나타낸다.
    assert_equal __, "num 42\n2 lines"[/^\d+/]
  end

  def test_dollar_sign_anchors_to_the_end_of_lines # $ 기호는 줄의 끝지점을 나타낸다.
    assert_equal __, "2 lines\nnum 42"[/\d+$/]
  end

  def test_slash_b_anchors_to_a_word_boundary # \b는 단어의 경계를 나타낸다.
    assert_equal __, "bovine vines"[/\bvine./]
  end

  # ------------------------------------------------------------------

  def test_parentheses_group_contents # () 기호로 그룹을 묶을 수 있습니다.
    assert_equal __, "ahahaha"[/(ha)+/]
  end

  # ------------------------------------------------------------------

  def test_parentheses_also_capture_matched_content_by_number # 괄호에 일치하는 내용을 숫자로 지정합니다. 
    assert_equal __, "Gray, James"[/(\w+), (\w+)/, 1]
    assert_equal __, "Gray, James"[/(\w+), (\w+)/, 2]
  end

  def test_variables_can_also_be_used_to_access_captures
    assert_equal __, "Name:  Gray, James"[/(\w+), (\w+)/]
    assert_equal __, $1
    assert_equal __, $2
  end

  # ------------------------------------------------------------------

  def test_a_vertical_pipe_means_or # | 기호 는 또는(or)를 나타냅니다.
    grays = /(James|Dana|Summer) Gray/
    assert_equal __, "James Gray"[grays]
    assert_equal __, "Summer Gray"[grays, 1]
    assert_equal __, "Jim Gray"[grays, 1]
  end

  # 생각해봅시다:
  #
  # 문자 클래스 [...]와 | 기호의 차이점은 무엇일까요?

  # ------------------------------------------------------------------

  def test_scan_is_like_find_all # scan은 find_all과 같습니다.
    assert_equal __, "one two-three".scan(/\w+/)
  end

  def test_sub_is_like_find_and_replace # sub는 find_and_replace와 같습니다.
    assert_equal __, "one two-three".sub(/(t\w*)/) { $1[0, 1] }
  end

  def test_gsub_is_like_find_and_replace_all # gsub는 find_and_replace_all과 같습니다.
    assert_equal __, "one two-three".gsub(/(t\w*)/) { $1[0, 1] }
  end
end
