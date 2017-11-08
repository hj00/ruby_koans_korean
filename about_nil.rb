require File.expand_path(File.dirname(__FILE__) + '/neo')

class AboutNil < Neo::Koan
  def test_nil_is_an_object #nil조차 객체라니
    assert_equal __, nil.is_a?(Object), "Unlike NULL in other languages"
  end

  def test_you_dont_get_null_pointer_errors_when_calling_methods_on_nil
    # 존재하지 않는 메소드를 호출하면 어떻게 될까요?
    # 다음 begin rescue end로 이루어진 코드는 예외를 잡는 코드입니다.
    begin
      nil.some_method_nil_doesnt_know_about
    rescue Exception => ex
      # 어떤 예외가 나왔나요?
      assert_equal __, ex.class

      # 예외에 어떤 메세지가 출력되었나요?
      # (HINT: __ 빈칸에 출력된 메세지를 넣어주세요)
      assert_match(/__/, ex.message)
    end
  end

  def test_nil_has_a_few_methods_defined_on_it
    assert_equal __, nil.nil?
    assert_equal __, nil.to_s
    assert_equal __, nil.inspect

    # 한번더 생각해봐요:
    #
    # 이게 더 좋을까요?
    #    obj.nil?
    # 요게 더 좋을까요?
    #    obj == nil
    # 와이?
  end

end
