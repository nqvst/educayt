require 'spec_helper'

describe "object_types/new.html.erb" do
  before(:each) do
    assign(:object_type, stub_model(ObjectType,
      :type_name => "MyString"
    ).as_new_record)
  end

  it "renders new object_type form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => object_types_path, :method => "post" do
      assert_select "input#object_type_type_name", :name => "object_type[type_name]"
    end
  end
end
