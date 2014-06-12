require 'spec_helper'

describe "subjects/new" do
  fixtures :subject_types

  before(:each) do
    assign(:subject, stub_model(Subject,
      :subject_type_id => 1,
      :subject_heading_type_id => 1
    ).as_new_record)
    assign(:subject_types, SubjectType.all)
    assign(:subject_heading_types, SubjectHeadingType.all)
  end

  it "renders new subject form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => subjects_path, :method => "post" do
      assert_select "select#subject_subject_type_id", :name => "subject[subject_type_id]"
      assert_select "select#subject_subject_heading_type_id", :name => "subject[subject_heading_type_id]"
    end
  end
end
