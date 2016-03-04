require 'rjb'

module TwitterKorean
  # Ruby interface to Scala TwitterKoreanProcessor
  class Processor
    attr_reader :jvm_processor, :java_convertor

    def initialize(*jvmargs)
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
        jvm_processor.stem(jvm_processor.tokenize(text))
      end
    end

    def extract_phrases(text, options = {})
      return unless text
      filter_spam = options[:filter_spam] || false
      including_hashtags = options[:including_hashtags] || true
      converto_to_korean_tokens do
        jvm_processor.extractPhrases(jvm_processor.tokenize(text), filter_spam, including_hashtags)
      end
    end

    private

    def converto_to_korean_tokens &block
      scala_list = block.call.toString
      token_strs = scala_list_to_array(scala_list)
      token_strs.map do |formed_token_str|
        TwitterKorean::KoreanToken.build_by_formed_str(formed_token_str.first)
      end
    end

    def scala_list_to_array(result)
      result.scan(/(?<=List\(|\,\s)(.*?\(\w+\:\s[0-9]+,\s[0-9]+\))/).to_a
    end
  end
end
