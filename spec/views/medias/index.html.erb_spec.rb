require 'spec_helper'

describe "medias/index.html.erb" do
  before(:each) do
    assign(:medias, [
      stub_model(Media,
        :media_type_id => 1,
        :tutorial_part_id => 1,
        :url => "Url"
      ),
      stub_model(Media,
        :media_type_id => 1,
        :tutorial_part_id => 1,
        :url => "Url"
      )
    ])
  end

  it "renders a list of medias" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Url".to_s, :count => 2
  end
end
