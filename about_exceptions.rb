require File.expand_path(File.dirname(__FILE__) + '/neo')

class AboutExceptions < Neo::Koan

  class MySpecialError < RuntimeError
  end

  def test_exceptions_inherit_from_Exception # exception은 Exception을 상속받습니다.
    assert_equal __, MySpecialError.ancestors[1] # .ancestor 메서드는 클래스 및 모듈의 정렬 된 목록을 반환합니다.
    assert_equal __, MySpecialError.ancestors[2]
    assert_equal __, MySpecialError.ancestors[3]
    assert_equal __, MySpecialError.ancestors[4]
  end

  def test_rescue_clause #rescue 문법을 알아봅시다.
    result = nil
    begin
      fail "Oops"
    rescue StandardError => ex
      result = :exception_handled
    end

    assert_equal __, result

    assert_equal __, ex.is_a?(StandardError), "Should be a Standard Error"
    assert_equal __, ex.is_a?(RuntimeError),  "Should be a Runtime Error"

    assert RuntimeError.ancestors.include?(StandardError),
      "RuntimeError is a subclass of StandardError"

    assert_equal __, ex.message
  end

  def test_raising_a_particular_error # 특정한 오류가 발생했습니다.
    result = nil
    begin
      # raise는 fail과 동의어라고 생각하세요.
      raise MySpecialError, "My Message"
    rescue MySpecialError => ex
      result = :exception_handled
    end

    assert_equal __, result
    assert_equal __, ex.message
  end

  def test_ensure_clause # ensure를 사용해봅시다. / exception이 있던 없던 무조건 실행될 코드입니다.
    result = nil
    begin
      fail "Oops"
    rescue StandardError
      # 여기에는 코드를 작성하지 마세요
    ensure
      result = :always_run
    end

    assert_equal __, result
  end

  def test_asserting_an_error_is_raised
    # do end 는 블록입니다, 나중에 더 탐구해볼 예정입니다.
    assert_raise(___) do
      raise MySpecialError.new("New instances can be raised directly.")
    end
  end

end
