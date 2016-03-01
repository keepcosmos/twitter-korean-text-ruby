require 'test_helper'

class ProcessorTest < Minitest::Test
  def test_normalization
    input = "그랰ㅋㅋㅋㅋㅋㅋ"
    expected = "그래ㅋㅋ"
    
    proccessor = TwitterKorean::Processor.new
    assert_equal(expected, proccessor.normalize(input))
    assert_equal(nil, proccessor.normalize(nil))
  end

  def test_tokenization
    input = "한국어를 처리하는 예시입니다 ㅋㅋ"
    proccessor = TwitterKorean::Processor.new
    tokens = proccessor.tokenize(input)
    expected = ["한국어", "를", " ", "처리", "하는", " ", "예시", "입니", "다", " ", "ㅋㅋ"]
    assert_equal(expected, tokens)

    first_metadata = ::TwitterKorean::KoreanToken::Metadata.new(pos: 'Noun', offset: 0, length: 3)
    assert_equal(first_metadata, tokens[0].metadata)
    second_metadata = ::TwitterKorean::KoreanToken::Metadata.new(pos: 'Josa', offset: 3, length: 1)
    assert_equal(second_metadata, tokens[1].metadata)
  end

  def test_stemming
    input = "한국어를 처리하는 예시입니다 ㅋㅋ"
    proccessor = TwitterKorean::Processor.new
    tokens = proccessor.stem(input)
    expected = ["한국어", "를", " ", "처리", "하다", " ", "예시", "이다", " ", "ㅋㅋ"]
    assert_equal(expected, tokens)
  end

  def test_extract_phrases
    input = "한국어를 처리하는 예시입니다 ㅋㅋ"
    proccessor = TwitterKorean::Processor.new
    tokens = proccessor.extract_phrases(input)
    expected = ["한국어", "처리", "처리하는 예시", "예시"]
    assert_equal(expected, tokens)
  end
end
