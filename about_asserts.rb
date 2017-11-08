#제일 처음 실행되는 파일
#!/usr/bin/env ruby
# -*- ruby -*-

require File.expand_path(File.dirname(__FILE__) + '/neo')

class AboutAsserts < Neo::Koan

  # 우리는 앞으로 assert를 통해서 테스트를 해보고 직접 확인 해볼 예정입니다. .
  def test_assert_truth #참을 보장합니다.
    assert false                # 이부분은 참이 되어야합니다.
  end

  # 뒷부분에 적절한 메세지를 출력할수 있습니다.
  def test_assert_with_message #메세지도 같이 출력해봅시다.
    assert false, "This should be true -- Please fix this"
  end

  # 빈칸에 예상되는 값을 넣어줍니다.
  def test_assert_equality
    expected_value = __
    actual_value = 1 + 1

    assert expected_value == actual_value
  end

  # assert_equal은 양옆의 값이 같다는걸 나타냅니다.
  def test_a_better_way_of_asserting_equality
    expected_value = __
    actual_value = 1 + 1

    assert_equal expected_value, actual_value
  end

  # value를 직접 넣어도 위의 결과와 같습니다.
  def test_fill_in_values
    assert_equal __, 1 + 1
  end
end
