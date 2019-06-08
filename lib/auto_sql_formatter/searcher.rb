require 'export_strings'

module AutoSqlFormatter
  class Searcher
    class << self
      def do(file_text)
        ExportStrings::Core.execute(file_text).each_with_object([]) { |str, memo| memo << str if sql?(str) }
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
