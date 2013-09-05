require "strscan"

module JsonParser
  class Parser
    def parse(str)
      ss = StringScanner.new(str)
      case ss.getc
      when "{"
        handle_hash(ss)
      when "["
        handle_array(ss)
      end
    end

    def handle_hash(ss)
      find_string(ss)
    end

    def find_string(ss)
      ss.scan(/\s*"(.+)"/)
    end
  end
end
