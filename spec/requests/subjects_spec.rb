require 'spec_helper'

describe "Subjects" do
  fixtures :all
  describe "GET /subjects", :solr => true do
    it "works! (now write some real specs)" do
      get subjects_path
    end
  end
end
