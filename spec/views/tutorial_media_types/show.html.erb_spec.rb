require 'spec_helper'

describe "tutorial_media_types/show.html.erb" do
  before(:each) do
    @tutorial_media_type = assign(:tutorial_media_type, stub_model(TutorialMediaType,
      :media_type => "Media Type"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Media Type/)
  end
end
