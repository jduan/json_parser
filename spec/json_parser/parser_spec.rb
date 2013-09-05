require "spec_helper"

module JsonParser
  describe Parser do
    #it "#parse_string should return a quoted string" do
    #  str = %Q{{"name": [1, "hello"]}}
    #  Parser.new.parse(str).should == {"name" => [1, "hello"]}
    #end

    it "should be able to parse a single true value" do
      Parser.new.parse("true").should == true
    end

    it "should be able to parse a single false value" do
      Parser.new.parse("false").should == false
    end
  end
end
