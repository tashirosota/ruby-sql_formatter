module AutoSqlFormatter
  class Searcher
    class << self
      def self.do(file_text)
        Ripper.lex(file_text).filter { |element| element[1] == :on_tstring_content && sql?(element[2]) }
      end

      private

      # sqlであるという定義は一旦selectとfromを持っているということにする
      # 正規表現綺麗に書きたい
      def sql?(str)
        !!(str.match(/select/i) && str.match(/from/i))
      end
    end
    class Error < StandardError; end
  end
end
