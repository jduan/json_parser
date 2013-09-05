require "spec_helper"

module JsonParser
  describe Parser do
    #it "#parse_string should return a quoted string" do
    #  str = %Q{{"name": [1, "hello"]}}
    #  Parser.new.parse(str).should == {"name" => [1, "hello"]}
    #end

    it "#parse_true should parse a 'true' value" do
      Parser.new.parse("true").should == true
    end
  end
end
