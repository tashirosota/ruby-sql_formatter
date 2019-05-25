require "auto_sql_formatter/runner"

module AutoSqlFormatter
  class Core
    DEFAULT_DIR = 'app'.freeze
    attr_reader :workdir

    def initialize(dir = DEFAULT_DIR)
      @workdir = dir
    end

    def execute
      puts "========Start to format sql========="
      targets.each do |file|
        result = Runner.new(file.key).do
        display(file[:state] = result)
      end
      puts "========Completed！！！========="
    end

    private

    # @files
    # [
    #   { 'path' => 'spec/sql_formatter./sql_formatter._spec.rb', 'state' => 'success' },
    #   { 'path' => 'spec/sql_formatter./sql_formatter._spec.rb', 'state' => 'none' },
    #   { 'path' => 'spec/sql_formatter./sql_formatter._spec.rb', 'state' => 'success' }
    # ]
    # これで表示系はいじれる
    def targets
      @files = Dir.glob("#{workdir}/**/*.rb").map { |file| { file => nil, state: nil } }
    end

    # 実行中に SSSSS・・・E・SSSSみたいに表示される
    def display(state)
      str = case state
            when 'success'
              'S' #success
            when 'error'
              'E' #error
            when 'none'
              '.' #none
            end
      putc str
    end
    class Error < StandardError; end
  end
end
