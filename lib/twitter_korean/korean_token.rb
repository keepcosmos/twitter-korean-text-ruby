module TwitterKorean
  class KoreanToken < String
    attr_accessor :metadata

    class << self
      # by form like `한국어(Noun: 0, 3)`
      def build_by_formed_str(str)
        token = new(str[0...str.rindex('(')])

        infos = str[(str.rindex('(') + 1)...str.rindex(')')]
        attrs = {
          pos: infos.match(/\w+/).to_s,
          offset: infos.match(/\d+/).to_s.to_i,
          length: infos.match(/\d+$/).to_s.to_i
        }

        token.metadata = TwitterKorean::KoreanToken::Metadata.new(attrs)
        token
      end
    end

    class Metadata
      attr_accessor :pos, :offset, :length, :unkown

      def initialize(attrs = {})
        attrs.each { |k, v| send("#{k}=", v) if respond_to?("#{k}=") }
        symbolize_pos!
      end

      def inspect
        "#{pos}, #{offset}, #{length}"
      end

      def ==(other)
        [:pos, :offset, :length, :unkown].inject(true) { |res, attr| res && (send(attr) == other.send(attr)) }
      end

      private

      def symbolize_pos!
        return if pos.nil?
        @pos = to_underscore(pos).to_sym
      end

      def to_underscore(txt)
        txt.gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
          gsub(/([a-z\d])([A-Z])/,'\1_\2').
          tr("-", "_").
          downcase
      end
    end
  end
end
