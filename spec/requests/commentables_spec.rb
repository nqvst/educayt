require 'spec_helper'

describe "Commentables" do
  describe "GET /commentables" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get commentables_path
      response.status.should be(200)
    end
  end
end
