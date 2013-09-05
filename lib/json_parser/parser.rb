require "strscan"

module JsonParser
  class Parser
    def parse(str)
      ss = StringScanner.new(str)
      parse_internal(ss)
    end

    private

    def parse_internal(ss)
      remove_leading_spaces(ss)
      case ss.peek(1)
      when "{"
        parse_hash(ss)
      when "["
        parse_array(ss)
      else
        parse_value(ss)
      end
    end

    def parse_value(ss)
      char = ss.peek(1)
      case char
      when '"'
        parse_string(ss)
      when 't'
        parse_true(ss)
      when 'f'
        parse_false(ss)
      when 'n'
        parse_null(ss)
      else
        parse_number(ss)
      end
    end

    def parse_true(ss)
      if ss.scan(/true/)
        true
      else
        raise "unexpected token #{ss.peek(4)}"
      end
    end

    def parse_false(ss)
      if ss.scan(/false/)
        false
      else
        raise "unexpected token #{ss.peek(4)}"
      end
    end

    def parse_hash(ss)
      find_string(ss)
    end

    def find_string(ss)
      ss.scan(/\s*"(.+)"/)
    end

    def remove_leading_spaces(ss)
      ss.scan(/\s*/)
    end
  end
end
