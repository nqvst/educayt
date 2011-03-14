require 'spec_helper'

describe "notifications/index.html.erb" do
  before(:each) do
    assign(:notifications, [
      stub_model(Notification,
        :updated_object_id => 1,
        :user_id => 1,
        :action => "Action",
        :followable_id => 1,
        :viewed => false
      ),
      stub_model(Notification,
        :updated_object_id => 1,
        :user_id => 1,
        :action => "Action",
        :followable_id => 1,
        :viewed => false
      )
    ])
  end

  it "renders a list of notifications" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Action".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
