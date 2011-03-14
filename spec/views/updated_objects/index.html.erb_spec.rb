require 'spec_helper'

describe "updated_objects/index.html.erb" do
  before(:each) do
    assign(:updated_objects, [
      stub_model(UpdatedObject,
        :object_type_id => "Object Type",
        :local_id => 1
      ),
      stub_model(UpdatedObject,
        :object_type_id => "Object Type",
        :local_id => 1
      )
    ])
  end

  it "renders a list of updated_objects" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Object Type".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
