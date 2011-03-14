require 'spec_helper'

describe "object_types/show.html.erb" do
  before(:each) do
    @object_type = assign(:object_type, stub_model(ObjectType,
      :type_name => "Type Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Type Name/)
  end
end
