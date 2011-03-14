require 'spec_helper'

describe "object_types/index.html.erb" do
  before(:each) do
    assign(:object_types, [
      stub_model(ObjectType,
        :type_name => "Type Name"
      ),
      stub_model(ObjectType,
        :type_name => "Type Name"
      )
    ])
  end

  it "renders a list of object_types" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Type Name".to_s, :count => 2
  end
end
