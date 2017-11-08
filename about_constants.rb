require File.expand_path(File.dirname(__FILE__) + '/neo')

C = "top level"

class AboutConstants < Neo::Koan

  C = "nested"

  def test_nested_constants_may_also_be_referenced_with_relative_paths # 중첩 된 상수는 상대 경로로 참조할 수 있습니다.
    assert_equal __, C
  end

  def test_top_level_constants_are_referenced_by_double_colons # 상위 상수는 :: 기호로 참조 할 수 있습니다.
    assert_equal 'top level', ::C
    assert_equal __, ::C
  end

  def test_nested_constants_are_referenced_by_their_complete_path # 중첩된 상수는 complete_path(직접 클래스를 작성해서)로 참조 할 수 있습니다.
    assert_equal __, AboutConstants::C
    assert_equal __, ::AboutConstants::C
  end

  # ------------------------------------------------------------------

  class Animal
    LEGS = 4
    def legs_in_animal
      LEGS
    end

    class NestedAnimal
      def legs_in_nested_animal
        LEGS
      end
    end
  end

  def test_nested_classes_inherit_constants_from_enclosing_classes # 중첩된 클래스는 둘러싸고 있는 클래스의 상수를 상속 받습니다.
    assert_equal __, Animal::NestedAnimal.new.legs_in_nested_animal
  end

  # ------------------------------------------------------------------

  class Reptile < Animal
    def legs_in_reptile
      LEGS
    end
  end

  def test_subclasses_inherit_constants_from_parent_classes # 하위 클래스는 부모 클래스의 상수를 상속받습니다.
    assert_equal __, Reptile.new.legs_in_reptile
  end

  # ------------------------------------------------------------------

  class MyAnimals
    LEGS = 2

    class Bird < Animal
      def legs_in_bird
        LEGS
      end
    end
  end

  def test_who_wins_with_both_nested_and_inherited_constants # 두개의 클래스중 누가 이길까요?
    assert_equal __, MyAnimals::Bird.new.legs_in_bird
  end

  # QUESTION: 우선 순위란
  # lexical scope 와 상속중 무엇이 우선순위 일까요?

  # ------------------------------------------------------------------

  class MyAnimals::Oyster < Animal
    def legs_in_oyster
      LEGS
    end
  end

  def test_who_wins_with_explicit_scoping_on_class_definition # 두개의 클래스중 누가 이길까요?
    assert_equal __, MyAnimals::Oyster.new.legs_in_oyster
  end

  # QUESTION: 
  # lexical scope 와 상속중 무엇이 우선순위 일까요?
  # 이전과 다른점이 뭘까요?
end
