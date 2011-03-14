require 'spec_helper'

describe "updated_objects/show.html.erb" do
  before(:each) do
    @updated_object = assign(:updated_object, stub_model(UpdatedObject,
      :object_type_id => "Object Type",
      :local_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Object Type/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
