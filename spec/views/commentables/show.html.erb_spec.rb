require 'spec_helper'

describe "commentables/show.html.erb" do
  before(:each) do
    @commentable = assign(:commentable, stub_model(Commentable,
      :object_type_id => 1,
      :local_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
