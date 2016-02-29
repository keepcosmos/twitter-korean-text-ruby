require 'rjb'

module TwitterKorean
  class JvmBridge
    CLASS_PATH = Dir.glob(File.dirname(__FILE__) + '/jars/*.jar').join(File::PATH_SEPARATOR).freeze

    def initialize(jvmargs = [])
      Rjb.load CLASS_PATH, jvmargs
    end

    def scala_twitter_korean_processor
      Rjb.import('com.twitter.penguin.korean.TwitterKoreanProcessor')
    end
  end
end
