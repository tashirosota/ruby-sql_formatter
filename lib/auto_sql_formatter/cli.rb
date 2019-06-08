require 'thor'

module AutoSqlFormatter
  class CLI < Thor
    def auto_sql_formatter
      # TODO 
      Core.new(path).execute
    end
  end
end