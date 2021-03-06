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

    it "should be able to parse a single string" do
      json_string = '"hehe"'
      Parser.new.parse(json_string).should == "hehe"
    end

    it "should be able to parse a single number" do
      json_string = '.23'
      Parser.new.parse(json_string).should == 0.23
    end

    it "should be able to parse an array" do
      json_string = %Q{["hehe", true, false]}
      Parser.new.parse(json_string).should == ["hehe", true, false]
    end

    it "should be able to parse a hash" do
      json_string = %Q{{"name": "jingjing", "age": "99"}}
      Parser.new.parse(json_string).should == {"name" => "jingjing", "age" => "99"}
    end

    it "should be able to parse a hash of hashes" do
      json_string = %Q{{"address": {"state": "wa", "city": "seattle"}, "age": "99"}}
      Parser.new.parse(json_string).should == {"address" => {"state" => "wa", "city" => "seattle"}, "age" => "99"}
    end

    it "should be able to parse a hash with numbers" do
      json_string = %Q{
      {
        "mercury_enabled": true,
        "mercury_endpoint": "mercury.staging.hulu.com:80",
        "mercury_initial_retry_interval": 1000,
        "mercury_max_failure_count": 30,
        "mercury_max_messages_per_second": 8,
        "mercury_max_retry_interval": 300000
      }
      }

      expected_hash = {
        "mercury_enabled" => true,
        "mercury_endpoint" => "mercury.staging.hulu.com:80",
        "mercury_initial_retry_interval" => 1000,
        "mercury_max_failure_count" => 30,
        "mercury_max_messages_per_second" => 8,
        "mercury_max_retry_interval" => 300000
      }
      Parser.new.parse(json_string).should == expected_hash
    end
  end
end
