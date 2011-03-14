require 'spec_helper'

describe "medias/edit.html.erb" do
  before(:each) do
    @media = assign(:media, stub_model(Media,
      :media_type_id => 1,
      :tutorial_part_id => 1,
      :url => "MyString"
    ))
  end

  it "renders the edit media form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => media_path(@media), :method => "post" do
      assert_select "input#media_media_type_id", :name => "media[media_type_id]"
      assert_select "input#media_tutorial_part_id", :name => "media[tutorial_part_id]"
      assert_select "input#media_url", :name => "media[url]"
    end
  end
end
