require 'spec_helper'

describe "subjects/index" do
  before(:each) do
    assign(:subjects, Kaminari::paginate_array([
      stub_model(Subject,
        :term => 'test1',
        :subject_type_id => 1,
        :subject_heading_type_id => 2
      ),
      stub_model(Subject,
        :term => 'test2',
        :subject_type_id => 1,
        :subject_heading_type_id => 2
      )
    ]).page(1))
  end

  it "renders a list of subjects" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 'test1', :count => 1
  end
end
