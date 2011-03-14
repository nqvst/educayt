require 'spec_helper'

describe "tutorial_part_tests/edit.html.erb" do
  before(:each) do
    @tutorial_part_test = assign(:tutorial_part_test, stub_model(TutorialPartTest,
      :tutorial_part_id => 1
    ))
  end

  it "renders the edit tutorial_part_test form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => tutorial_part_test_path(@tutorial_part_test), :method => "post" do
      assert_select "input#tutorial_part_test_tutorial_part_id", :name => "tutorial_part_test[tutorial_part_id]"
    end
  end
end
