require "sql_formatter/formatter"
require "sql_formatter/searcher"

module AutoSqlFormatter
  module Runner
    def self.do(path)
      file_text = File.read(path)
      sqls = Searcher.do file_text
      if sqls
        # results
        # [
        #   {
        #     from: 元のsql,
        #     to: 変更後,
        #   }
        # ]
        results = Formatter.do(sqls)
        results.each { |result| file_text.gsub! result[from], result[to] }
        return 'success' if File.open(path, 'w') { |f| f.write file_text }
      end
      'none'
    end
    class Error < StandardError; end
  end
end