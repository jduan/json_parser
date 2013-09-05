require "spec_helper"

module JsonParser
  describe Parser do
    it "#parse_string should return a quoted string" do
      str = %Q{{"name": [1, "hello"]}}
      Parser.new.parse(str).should == {"name" => [1, "hello"]}
    end
  end
end
