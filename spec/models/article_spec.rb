require File.dirname(__FILE__) + '/../spec_helper'

describe Article do
  it "should be valid" do
    Article.new.should be_valid
  end
end
