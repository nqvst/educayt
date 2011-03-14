require 'spec_helper'

describe "tutorial_medias/edit.html.erb" do
  before(:each) do
    @tutorial_media = assign(:tutorial_media, stub_model(TutorialMedia,
      :media_type_id => 1,
      :tutorial_part_id => 1,
      :url => "MyString"
    ))
  end

  it "renders the edit tutorial_media form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => tutorial_media_path(@tutorial_media), :method => "post" do
      assert_select "input#tutorial_media_media_type_id", :name => "tutorial_media[media_type_id]"
      assert_select "input#tutorial_media_tutorial_part_id", :name => "tutorial_media[tutorial_part_id]"
      assert_select "input#tutorial_media_url", :name => "tutorial_media[url]"
    end
  end
end
