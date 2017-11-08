require File.expand_path(File.dirname(__FILE__) + '/neo')

class AboutSymbols < Neo::Koan
  def test_symbols_are_symbols # symbol은 symbol입니다.
    symbol = :ruby
    assert_equal __, symbol.is_a?(Symbol)
  end

  def test_symbols_can_be_compared # symbol을 비교해 봅시다.
    symbol1 = :a_symbol
    symbol2 = :a_symbol
    symbol3 = :something_else

    assert_equal __, symbol1 == symbol2
    assert_equal __, symbol1 == symbol3
  end

  def test_identical_symbols_are_a_single_internal_object # 동일한 symbol은 하나의 객체입니다.
    symbol1 = :a_symbol
    symbol2 = :a_symbol

    assert_equal __, symbol1           == symbol2
    assert_equal __, symbol1.object_id == symbol2.object_id
  end

  def test_method_names_become_symbols # 메소드 이름은 symbol이 됩니다.
    symbols_as_strings = Symbol.all_symbols.map { |x| x.to_s }
    assert_equal __, symbols_as_strings.include?("test_method_names_become_symbols")
  end

  # 생각해봅시다:
  #
  # 왜 symbol 목록을 문자열로 변환 한 다음 
  # symbol 대신 문자열 값과 비교할까요?

  in_ruby_version("mri") do
    RubyConstant = "What is the sound of one hand clapping?"
    def test_constants_become_symbols
      all_symbols_as_strings = Symbol.all_symbols.map { |x| x.to_s }

      assert_equal __, all_symbols_as_strings.include?(__)
    end
  end

  def test_symbols_can_be_made_from_strings # string을 symbol로 만들수 있습니다.
    string = "catsAndDogs"
    assert_equal __, string.to_sym
  end

  def test_symbols_with_spaces_can_be_built # 공백을 넣어서 symbol을 만들수 있습니다.
    symbol = :"cats and dogs"

    assert_equal __.to_sym, symbol
  end

  def test_symbols_with_interpolation_can_be_built # symbol에 #{}를이용하여 변수를 넣을 수 있습니다.
    value = "and"
    symbol = :"cats #{value} dogs"

    assert_equal __.to_sym, symbol
  end

  def test_to_s_is_called_on_interpolated_symbols
    symbol = :cats
    string = "It is raining #{symbol} and dogs."

    assert_equal __, string
  end

  def test_symbols_are_not_strings # symbol은 string이 아닙니다.
    symbol = :ruby
    assert_equal __, symbol.is_a?(String)
    assert_equal __, symbol.eql?("ruby")
  end

  def test_symbols_do_not_have_string_methods # symbol은 string 메소드를 사용할 수 없습니다.
    symbol = :not_a_string
    assert_equal __, symbol.respond_to?(:each_char)
    assert_equal __, symbol.respond_to?(:reverse)
  end

  # symbol에서 문자열 연산을 사용할 수 없습니다.

  def test_symbols_cannot_be_concatenated
    assert_raise(___) do
      :cats + :dogs
    end
  end

  def test_symbols_can_be_dynamically_created # 문자열을 더해서 symbol을 만들 수 있습니다.
    assert_equal __, ("cats" + "dogs").to_sym
  end

  # 생각해 봅시다:
  #
  # 동적으로 많은 symboldmf 만드는 것이 좋은 아이디어가 아닌 이유는 무엇일까요?
end
