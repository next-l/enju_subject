require 'spec_helper'

describe "subjects/edit" do
  fixtures :subject_types

  before(:each) do
    @subject = assign(:subject, stub_model(Subject,
      :subject_type_id => 1,
      :subject_heading_type_id => 1
    ))
    @subject_types = SubjectType.all
    @subject_heading_types = SubjectHeadingType.all
  end

  it "renders the edit subject form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => subjects_path(@subject), :method => "post" do
      assert_select "select#subject_subject_type_id", :name => "subject[subject_type_id]"
      assert_select "select#subject_subject_heading_type_id", :name => "subject[subject_heading_type_id]"
    end
  end
end
