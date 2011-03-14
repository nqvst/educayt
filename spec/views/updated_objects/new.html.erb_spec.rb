require 'spec_helper'

describe "updated_objects/new.html.erb" do
  before(:each) do
    assign(:updated_object, stub_model(UpdatedObject,
      :object_type_id => "MyString",
      :local_id => 1
    ).as_new_record)
  end

  it "renders new updated_object form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => updated_objects_path, :method => "post" do
      assert_select "input#updated_object_object_type_id", :name => "updated_object[object_type_id]"
      assert_select "input#updated_object_local_id", :name => "updated_object[local_id]"
    end
  end
end
