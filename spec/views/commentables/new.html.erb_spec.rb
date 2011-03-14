require 'spec_helper'

describe "commentables/new.html.erb" do
  before(:each) do
    assign(:commentable, stub_model(Commentable,
      :object_type_id => 1,
      :local_id => 1
    ).as_new_record)
  end

  it "renders new commentable form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => commentables_path, :method => "post" do
      assert_select "input#commentable_object_type_id", :name => "commentable[object_type_id]"
      assert_select "input#commentable_local_id", :name => "commentable[local_id]"
    end
  end
end
