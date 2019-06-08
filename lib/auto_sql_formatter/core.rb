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
      puts
      files.each do |file|
        result = Runner.do file[:path]
        display(file[:status] = result)
      end
      puts
      puts
      files.each do |file| 
        puts "#{file[:path]}  #{file[:status]}\n"
      end
      puts
      puts '===========Completed!!!============'
    end

    private

    # @files
    # [
    #   { 'path' => 'spec/sql_formatter./sql_formatter._spec.rb', 'state' => 'success' },
    #   { 'path' => 'spec/sql_formatter./sql_formatter._spec.rb', 'state' => 'none' },
    #   { 'path' => 'spec/sql_formatter./sql_formatter._spec.rb', 'state' => 'success' }
    # ]
    def files
      @files ||= Dir.glob("#{workdir}/**/*.rb").map { |file| { path: file, status: nil } }
    end

    # 実行中に SSSSS・・・E・SSSSみたいに表示される
    def display(status)
      str = case status
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
