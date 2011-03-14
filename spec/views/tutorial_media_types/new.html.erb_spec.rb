require 'spec_helper'

describe "tutorial_media_types/new.html.erb" do
  before(:each) do
    assign(:tutorial_media_type, stub_model(TutorialMediaType,
      :media_type => "MyString"
    ).as_new_record)
  end

  it "renders new tutorial_media_type form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => tutorial_media_types_path, :method => "post" do
      assert_select "input#tutorial_media_type_media_type", :name => "tutorial_media_type[media_type]"
    end
  end
end
