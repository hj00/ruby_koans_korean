require File.expand_path(File.dirname(__FILE__) + '/neo')

class AboutControlStatements < Neo::Koan

  def test_if_then_else_statements # if else로 이루어진 문장입니다.
    if true
      result = :true_value
    else
      result = :false_value
    end
    assert_equal __, result
  end

  def test_if_then_statements # if 로만 이루어진 문장입니다.
    result = :default_value
    if true
      result = :true_value
    end
    assert_equal __, result
  end

  def test_if_statements_return_values # if 의 결과를 변수에 저장할 수 있습니다.
    value = if true
              :true_value
            else
              :false_value
            end
    assert_equal __, value

    value = if false
              :true_value
            else
              :false_value
            end
    assert_equal __, value

    # NOTE: 사실 if문장만 return 하는게 아닙니다.
    # 루비의 모든문장은 value를 return합니다. 
  end

  def test_if_statements_with_no_else_with_false_condition_return_value
    # else가 없을때 거짓이라면 어떤 결과를 return할까요?
    value = if false
              :true_value
            end
    assert_equal __, value
  end

  def test_condition_operators # 참과 거짓을 연산해 봅시다.
    assert_equal __, (true ? :true_value : :false_value)
    assert_equal __, (false ? :true_value : :false_value)
  end

  def test_if_statement_modifiers # 조건이 맞을때 값을 지정 할 수 있습니다.
    result = :default_value
    result = :true_value if true

    assert_equal __, result
  end

  def test_unless_statement # unless 로 이루어진 문장입니다.
    result = :default_value
    unless false    # 'if !false'는 , 'if true' 와 같습니다.
      result = :false_value
    end
    assert_equal __, result
  end

  def test_unless_statement_evaluate_true # unless에 true가 들어갔습니다. 
    result = :default_value
    unless true    # 'if !true'는, 'if false' 와 같습니다.
      result = :true_value
    end
    assert_equal __, result
  end

  def test_unless_statement_modifier # 조건이 맞을때 값을 지정 할 수 있습니다.
    result = :default_value
    result = :false_value unless false

    assert_equal __, result
  end

  def test_while_statement # while은 true일 동안 계속해서 반복합니다
    i = 1
    result = 1
    while i <= 10
      result = result * i
      i += 1
    end
    assert_equal __, result
  end

  def test_break_statement # break가 걸릴때까지 계속 반복합니다.
    i = 1
    result = 1
    while true
      break unless i <= 10
      result = result * i
      i += 1
    end
    assert_equal __, result
  end

  def test_break_statement_returns_values # break는 value를 return합니다
    i = 1
    result = while i <= 10
      break i if i % 2 == 0
      i += 1
    end

    assert_equal __, result
  end

  def test_next_statement # next를 사용해봅시다.
    i = 0
    result = []
    while i < 10
      i += 1
      next if (i % 2) == 0
      result << i
    end
    assert_equal __, result
  end

  def test_for_statement # for를 사용해서 반복해봅시다.
    array = ["fish", "and", "chips"]
    result = []
    for item in array
      result << item.upcase
    end
    assert_equal [__, __, __], result
  end

  def test_times_statement # times를 사용해서 반복해봅시다.
    sum = 0
    10.times do
      sum += 1
    end
    assert_equal __, sum
  end

end
