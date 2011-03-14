require 'spec_helper'

describe "tutorial_media_types/index.html.erb" do
  before(:each) do
    assign(:tutorial_media_types, [
      stub_model(TutorialMediaType,
        :media_type => "Media Type"
      ),
      stub_model(TutorialMediaType,
        :media_type => "Media Type"
      )
    ])
  end

  it "renders a list of tutorial_media_types" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Media Type".to_s, :count => 2
  end
end
