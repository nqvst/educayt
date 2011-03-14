require 'spec_helper'

describe "medias/new.html.erb" do
  before(:each) do
    assign(:media, stub_model(Media,
      :media_type_id => 1,
      :tutorial_part_id => 1,
      :url => "MyString"
    ).as_new_record)
  end

  it "renders new media form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => medias_path, :method => "post" do
      assert_select "input#media_media_type_id", :name => "media[media_type_id]"
      assert_select "input#media_tutorial_part_id", :name => "media[tutorial_part_id]"
      assert_select "input#media_url", :name => "media[url]"
    end
  end
end
