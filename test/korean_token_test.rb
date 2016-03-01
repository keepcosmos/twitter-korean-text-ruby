require 'test_helper'

class ProcessorTest < Minitest::Test
  def test_noun_token
    input = "한국어(Noun: 0, 3)"
    
    token = TwitterKorean::KoreanToken.build_by_formed_str(input)
    metadata = TwitterKorean::KoreanToken::Metadata.new(pos: 'Noun', offset: 0, length: 3)
    assert_equal("한국어", token)
    assert_equal(metadata, token.metadata)
  end

  def test_space_token
    input = " (Space: 4, 1)"
    token = TwitterKorean::KoreanToken.build_by_formed_str(input)
    metadata = TwitterKorean::KoreanToken::Metadata.new(pos: 'Space', offset: 4, length: 1)
    assert_equal(" ", token)
    assert_equal(metadata, token.metadata)
  end

  def test_korean_particle_token
    input = "ㅋㅋ(KoreanParticle: 16, 2)"
    
    token = TwitterKorean::KoreanToken.build_by_formed_str(input)
    metadata = TwitterKorean::KoreanToken::Metadata.new(pos: 'KoreanParticle', offset: 16, length: 2)
    assert_equal("ㅋㅋ", token)
    assert_equal(metadata, token.metadata)
  end
end

