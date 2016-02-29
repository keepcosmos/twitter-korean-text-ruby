require 'rjb'

module TwitterKorean
  # Ruby interface to Scala TwitterKoreanProcessor
  class Processor
    attr_reader :jvm_processor, :java_convertor

    def initialize(jvmargs = [])
      bridge = TwitterKorean::JvmBridge.new(jvmargs)
      @jvm_processor = bridge.scala_twitter_korean_processor
    end

    def normalize(text)
      return unless text
      jvm_processor.normalize(text).toString
    end

    def tokenize(text)
      return unless text
      converto_to_korean_tokens do
        jvm_processor.tokenize(text)
      end
    end

    def stem(text)
      return unless text
      converto_to_korean_tokens do
        jvm_processor.stem(tokenize(text))
      end
    end

    def extract_phrases(text, filter_spam: false, including_hashtags: true)
      return unless text
      converto_to_korean_tokens do
        jvm_processor.extractPhrases(tokenize(text), filter_spam, including_hashtags)
      end
    end

    private

    def converto_to_korean_tokens &block
      scala_list = yield.toString
      token_strs = scala_list_to_array(scala_list)
      
    end

    def scala_list_to_array(result)
      result.scan(/(?<=List\(|\,\s)(.*?\([a-zA-Z]+\:\s[0-9]+,\s[0-9]\))/).to_a
    end
  end
end
