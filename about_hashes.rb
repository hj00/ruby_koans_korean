require File.expand_path(File.dirname(__FILE__) + '/neo')

class AboutHashes < Neo::Koan
  def test_creating_hashes #hash를 생성해봅시다.
    empty_hash = Hash.new
    assert_equal __, empty_hash.class
    assert_equal(__, empty_hash)
    assert_equal __, empty_hash.size
  end

  def test_hash_literals
    hash = { :one => "uno", :two => "dos" }
    assert_equal __, hash.size
  end

  def test_accessing_hashes #hash에 접근해봅시다.
    hash = { :one => "uno", :two => "dos" }
    assert_equal __, hash[:one]
    assert_equal __, hash[:two]
    assert_equal __, hash[:doesnt_exist]
  end

  def test_accessing_hashes_with_fetch #fetch를 이용해서 hash에 접근해봅시다.
    hash = { :one => "uno" }
    assert_equal __, hash.fetch(:one)
    assert_raise(___) do
      hash.fetch(:doesnt_exist)
    end

    # 생각해 봅시다:
    # 왜 hash에 접근할때 fetch를 사용할까요?
  end

  def test_changing_hashes # hash를 바꿔봅시다.
    hash = { :one => "uno", :two => "dos" }
    hash[:one] = "eins"

    expected = { :one => __, :two => "dos" }
    assert_equal __, hash

    # 보너스 퀴즈: 왜 expected를 그대로 사용하지 않고 변수에 저장해서 사용할까요?
  end

  def test_hash_is_unordered # 정렬되지 않은 hash
    hash1 = { :one => "uno", :two => "dos" }
    hash2 = { :two => "dos", :one => "uno" }

    assert_equal __, hash1 == hash2
  end

  def test_hash_keys # hash의 key를 알아봅시다.
    hash = { :one => "uno", :two => "dos" }
    assert_equal __, hash.keys.size
    assert_equal __, hash.keys.include?(:one)
    assert_equal __, hash.keys.include?(:two)
    assert_equal __, hash.keys.class
  end

  def test_hash_values # hash의 value를 알아봅시다.
    hash = { :one => "uno", :two => "dos" }
    assert_equal __, hash.values.size
    assert_equal __, hash.values.include?("uno")
    assert_equal __, hash.values.include?("dos")
    assert_equal __, hash.values.class
  end

  def test_combining_hashes # hash를 결합해봅시다.
    hash = { "jim" => 53, "amy" => 20, "dan" => 23 }
    new_hash = hash.merge({ "jim" => 54, "jenny" => 26 })

    assert_equal __, hash != new_hash

    expected = { "jim" => __, "amy" => 20, "dan" => 23, "jenny" => __ }
    assert_equal __, expected == new_hash
  end

  def test_default_value # hash의 기본 값
    hash1 = Hash.new
    hash1[:one] = 1

    assert_equal __, hash1[:one]
    assert_equal __, hash1[:two]

    hash2 = Hash.new("dos")
    hash2[:one] = 1

    assert_equal __, hash2[:one]
    assert_equal __, hash2[:two]
  end

  def test_default_value_is_the_same_object
    hash = Hash.new([])

    hash[:one] << "uno"
    hash[:two] << "dos"

    assert_equal __, hash[:one]
    assert_equal __, hash[:two]
    assert_equal __, hash[:three]

    assert_equal __, hash[:one].object_id == hash[:two].object_id
  end

  def test_default_value_with_block
    hash = Hash.new {|hash, key| hash[key] = [] }

    hash[:one] << "uno"
    hash[:two] << "dos"

    assert_equal __, hash[:one]
    assert_equal __, hash[:two]
    assert_equal __, hash[:three]
  end
end
