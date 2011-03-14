require 'spec_helper'

describe "tutorial_medias/show.html.erb" do
  before(:each) do
    @tutorial_media = assign(:tutorial_media, stub_model(TutorialMedia,
      :media_type_id => 1,
      :tutorial_part_id => 1,
      :url => "Url"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Url/)
  end
end
