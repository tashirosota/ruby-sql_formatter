require 'ripper'
module AutoSqlFormatter
  class Searcher
    class << self
      def do(file_text)
        Ripper.lex(file_text).reduce([]) do |acc, element|
          element[1] == :on_tstring_content && sql?(element[2]) ? acc.push(element[2]) : acc
        end
      end

      private

      # sqlであるという定義は一旦selectとfromを持っているということにする
      def sql?(str)
        !!(str.match(/select/i) && str.match(/from/i))
      end
    end
    class Error < StandardError; end
  end
end
