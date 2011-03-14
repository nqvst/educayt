require 'spec_helper'

describe JavascriptsController do

  describe "GET 'dynamic_subcategories'" do
    it "should be successful" do
      get 'dynamic_subcategories'
      response.should be_success
    end
  end

end
