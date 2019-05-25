require "auto_sql_formatter/version"
require "auto_sql_formatter/core"

module AutoSqlFormatter
  def self.execute(path = nil)
    Core.new(path).execute
  end
end