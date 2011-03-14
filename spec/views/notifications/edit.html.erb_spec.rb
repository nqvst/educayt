require 'spec_helper'

describe "notifications/edit.html.erb" do
  before(:each) do
    @notification = assign(:notification, stub_model(Notification,
      :updated_object_id => 1,
      :user_id => 1,
      :action => "MyString",
      :followable_id => 1,
      :viewed => false
    ))
  end

  it "renders the edit notification form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => notification_path(@notification), :method => "post" do
      assert_select "input#notification_updated_object_id", :name => "notification[updated_object_id]"
      assert_select "input#notification_user_id", :name => "notification[user_id]"
      assert_select "input#notification_action", :name => "notification[action]"
      assert_select "input#notification_followable_id", :name => "notification[followable_id]"
      assert_select "input#notification_viewed", :name => "notification[viewed]"
    end
  end
end
