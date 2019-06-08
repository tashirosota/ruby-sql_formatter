require "auto_sql_formatter/version"
require "auto_sql_formatter/core"
# require "auto_sql_formatter/cli"

module AutoSqlFormatter
  def self.execute(path = nil)
    Core.new(path).execute
  end
end