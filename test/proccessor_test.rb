require 'test_helper'
require 'twitter_korean/proccessor'
require 'byebug'

class ProcessorTest < Minitest::Test
  def test_normalization
    input = "그랰ㅋㅋㅋㅋㅋㅋ"
    expected = "그래ㅋㅋ"
    
    proccessor = TwitterKorean::Proccessor.new
    assert_equal(expected, proccessor.normalize(input))
    assert_equal(nil, proccessor.normalize(nil))
  end

  def test_tokenization
    input = "한국어를 처리하는 예시입니다 ㅋㅋ"
    proccessor = TwitterKorean::Proccessor.new
    puts proccessor.tokenize(input).toString
  end

  def test_stemming
    input = "한국어를 처리하는 예시입니다 ㅋㅋ"
    proccessor = TwitterKorean::Proccessor.new
    puts proccessor.stem(input).toString
  end

  def test_extract_phrases
    input = "한국어를 처리하는 예시입니다 ㅋㅋ"
    proccessor = TwitterKorean::Proccessor.new
    puts proccessor.extract_phrases(input).toString
  end
end
