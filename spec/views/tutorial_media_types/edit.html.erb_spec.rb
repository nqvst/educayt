require 'spec_helper'

describe "tutorial_media_types/edit.html.erb" do
  before(:each) do
    @tutorial_media_type = assign(:tutorial_media_type, stub_model(TutorialMediaType,
      :media_type => "MyString"
    ))
  end

  it "renders the edit tutorial_media_type form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => tutorial_media_type_path(@tutorial_media_type), :method => "post" do
      assert_select "input#tutorial_media_type_media_type", :name => "tutorial_media_type[media_type]"
    end
  end
end
