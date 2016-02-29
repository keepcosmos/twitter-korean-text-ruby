require 'test_helper'

class ProcessorTest < Minitest::Test
  def test_normalization
    input1 = "한국어(Noun: 0, 3)"
    input2 = "를(Josa: 3, 1)"
    input3 = " (Space: 4, 1)"
    input4 = "하는(Verb: 7, 2)"
    input5 = "ㅋㅋ(KoreanParticle: 16, 2)"
    
    proccessor = TwitterKorean::Processor.new
    assert_equal(expected, proccessor.normalize(input))
    assert_equal(nil, proccessor.normalize(nil))
  end
end

