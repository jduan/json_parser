require "spec_helper"

module JsonParser
  describe Calculator do
    it "#add should sum up 2 numbers" do
      Calculator.new.add(1, 2).should == 3
    end
  end
end
