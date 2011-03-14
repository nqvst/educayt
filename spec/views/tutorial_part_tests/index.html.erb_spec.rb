require 'spec_helper'

describe "tutorial_part_tests/index.html.erb" do
  before(:each) do
    assign(:tutorial_part_tests, [
      stub_model(TutorialPartTest,
        :tutorial_part_id => 1
      ),
      stub_model(TutorialPartTest,
        :tutorial_part_id => 1
      )
    ])
  end

  it "renders a list of tutorial_part_tests" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
