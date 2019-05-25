require "auto_sql_formatter/version"
require "auto_sql_formatter/core"

module AutoSqlFormatter
  class Error < StandardError; end
  def self.execute(path = nil)
    core = path ? Core.new(path) : Core.new
    core.execute
    true
  end
end
