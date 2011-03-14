require 'spec_helper'

describe "tutorial_part_tests/show.html.erb" do
  before(:each) do
    @tutorial_part_test = assign(:tutorial_part_test, stub_model(TutorialPartTest,
      :tutorial_part_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
