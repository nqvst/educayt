require 'spec_helper'

describe JavascriptController do

  describe "GET 'dynamic_categories'" do
    it "should be successful" do
      get 'dynamic_categories'
      response.should be_success
    end
  end

end
