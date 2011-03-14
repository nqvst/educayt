require 'spec_helper'

describe "notifications/show.html.erb" do
  before(:each) do
    @notification = assign(:notification, stub_model(Notification,
      :updated_object_id => 1,
      :user_id => 1,
      :action => "Action",
      :followable_id => 1,
      :viewed => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Action/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/false/)
  end
end
