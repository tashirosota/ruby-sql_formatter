require "auto_sql_formatter/formatter"
require "auto_sql_formatter/searcher"

module AutoSqlFormatter
  class Runner
    def self.do(path)
      file_text = File.read(path)
      sqls = Searcher.do file_text
      if sqls
        # results
        # [
        #   {
        #     from: old sql,
        #     to: new sql,
        #   }
        # ]
        results = Formatter.do sqls
        results.each { |result| file_text.gsub! Regexp.new(result[:from]), result[:to] }
        return 'success' if File.open(path, 'w') { |f| f.write file_text }
      end
      'none'
    end
    class Error < StandardError; end
  end
end
