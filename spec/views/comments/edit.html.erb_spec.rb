require 'spec_helper'

describe "comments/edit.html.erb" do
  before(:each) do
    @comment = assign(:comment, stub_model(Comment,
      :user_id => 1,
      :commentable_id => 1,
      :title => "MyString",
      :message => "MyText",
      :deleted => false
    ))
  end

  it "renders the edit comment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => comment_path(@comment), :method => "post" do
      assert_select "input#comment_user_id", :name => "comment[user_id]"
      assert_select "input#comment_commentable_id", :name => "comment[commentable_id]"
      assert_select "input#comment_title", :name => "comment[title]"
      assert_select "textarea#comment_message", :name => "comment[message]"
      assert_select "input#comment_deleted", :name => "comment[deleted]"
    end
  end
end
