require File.expand_path(File.dirname(__FILE__) + '/neo')

class AboutObjects < Neo::Koan
  def test_everything_is_an_object # 모든것은 객체이니라
    assert_equal __, 1.is_a?(Object)
    assert_equal __, 1.5.is_a?(Object)
    assert_equal __, "string".is_a?(Object)
    assert_equal __, nil.is_a?(Object)
    assert_equal __, Object.is_a?(Object)
  end

  def test_objects_can_be_converted_to_strings # 객체는 string으로 바꿀수 있습니다.
    assert_equal __, 123.to_s
    assert_equal __, nil.to_s
  end

  def test_objects_can_be_inspected # inspect 메소드를 사용해 봅시다.
    assert_equal __, 123.inspect
    assert_equal __, nil.inspect
  end

  def test_every_object_has_an_id # 모든 객체는 id를 가지고 있습니다.
    obj = Object.new
    assert_equal __, obj.object_id.class
  end

  def test_every_object_has_different_id # 모든 객체는 다른 id를 가지고 있습니다.
    obj = Object.new
    another_obj = Object.new
    assert_equal __, obj.object_id != another_obj.object_id
  end

  def test_small_integers_have_fixed_ids # 작은 정수들은 고정된 id를 가지고 있습니다.
    assert_equal __, 0.object_id
    assert_equal __, 1.object_id
    assert_equal __, 2.object_id
    assert_equal __, 100.object_id

    # 생각해봅시다:
    # 작은 정수들은 어떤 아이디 패턴을 가지고 있나요?
  end

  def test_clone_creates_a_different_object # 객체를 복사해 봅시다.
    obj = Object.new
    copy = obj.clone

    assert_equal __, obj           != copy
    assert_equal __, obj.object_id != copy.object_id
  end
end
