require 'spec_helper'

describe "commentables/index.html.erb" do
  before(:each) do
    assign(:commentables, [
      stub_model(Commentable,
        :object_type_id => 1,
        :local_id => 1
      ),
      stub_model(Commentable,
        :object_type_id => 1,
        :local_id => 1
      )
    ])
  end

  it "renders a list of commentables" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
