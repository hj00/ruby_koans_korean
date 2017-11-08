require File.expand_path(File.dirname(__FILE__) + '/neo')

class AboutTrueAndFalse < Neo::Koan
  def truth_value(condition)
    if condition
      :true_stuff
    else
      :false_stuff
    end
  end

  def test_true_is_treated_as_true # true는 true로 처리됩니다.
    assert_equal __, truth_value(true)
  end

  def test_false_is_treated_as_false # false는 false로 처리됩니다.
    assert_equal __, truth_value(false)
  end

  def test_nil_is_treated_as_false_too # nil또한 false로 처리됩니다.
    assert_equal __, truth_value(nil)
  end

  def test_everything_else_is_treated_as_true # 나머지 모든것은 true로 처리됩니다.
    assert_equal __, truth_value(1)
    assert_equal __, truth_value(0)
    assert_equal __, truth_value([])
    assert_equal __, truth_value({})
    assert_equal __, truth_value("Strings")
    assert_equal __, truth_value("")
  end

end
