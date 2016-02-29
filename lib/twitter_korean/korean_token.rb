module TwitterKorean
  class KoreanToken
    attr_accessor :text, :pos, :offset, :length, :unkown

    class << self
      # by form like `한국어(Noun: 0, 3)`
      def build_by_formed_str(str)
        infos = str[(str.rindex('(') + 1)...str.rindex(')')]
        attrs = {
          text: str[0...str.rindex('(')],
          pos: infos.match(/\w+/).to_s,
          offset: infos.match(/\d+/).to_s.to_i,
          length: infos.match(/\d+$/).to_s.to_i
        }
        new(attrs)
      end
    end

    def initailize(attrs = {})
      [:text, :offset, :length, :unkown].each do |attr|
        self.send("#{attr}=", attrs[attr])
      end
      self.pos = pos_to_symbol(attrs[:pos]) if attrs[:pos]
    end

    private

    def pos_to_symbol(str)
      return ''.to_sym if str.nil?
      to_underscore(str).to_sym
    end

    def to_underscore(str)
      str.gsub(/::/, '/').
        gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
        gsub(/([a-z\d])([A-Z])/,'\1_\2').
        tr("-", "_").
        downcase
    end
  end
end
