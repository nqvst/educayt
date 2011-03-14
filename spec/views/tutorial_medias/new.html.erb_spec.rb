require 'spec_helper'

describe "tutorial_medias/new.html.erb" do
  before(:each) do
    assign(:tutorial_media, stub_model(TutorialMedia,
      :media_type_id => 1,
      :tutorial_part_id => 1,
      :url => "MyString"
    ).as_new_record)
  end

  it "renders new tutorial_media form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => tutorial_medias_path, :method => "post" do
      assert_select "input#tutorial_media_media_type_id", :name => "tutorial_media[media_type_id]"
      assert_select "input#tutorial_media_tutorial_part_id", :name => "tutorial_media[tutorial_part_id]"
      assert_select "input#tutorial_media_url", :name => "tutorial_media[url]"
    end
  end
end
