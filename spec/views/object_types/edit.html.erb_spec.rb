require 'spec_helper'

describe "object_types/edit.html.erb" do
  before(:each) do
    @object_type = assign(:object_type, stub_model(ObjectType,
      :type_name => "MyString"
    ))
  end

  it "renders the edit object_type form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => object_type_path(@object_type), :method => "post" do
      assert_select "input#object_type_type_name", :name => "object_type[type_name]"
    end
  end
end
