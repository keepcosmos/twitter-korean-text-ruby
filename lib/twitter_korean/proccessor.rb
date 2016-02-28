require 'rjb'

module TwitterKorean
  class Proccessor
    CLASS_PATH = Dir.glob(File.dirname(__FILE__) + '/jars/*.jar').join(File::PATH_SEPARATOR).freeze

    attr_accessor :bridge

    def initialize(jvmargs = [])
      Rjb.load CLASS_PATH, jvmargs
      self.bridge = Rjb.import('com.twitter.penguin.korean.TwitterKoreanProcessor')
    end

    def normalize(text)
      return unless text
      bridge.normalize(text).toString
    end

    def tokenize(text)
      return unless text
      bridge.tokenize(text)
    end

    def stem(text)
      bridge.stem(tokenize(text))
    end

    def extract_phrases(text, filter_spam: false, including_hashtags: true)
      bridge.extractPhrases(tokenize(text), filter_spam, including_hashtags)
    end

    class Convertor
      
    end
  end
end
