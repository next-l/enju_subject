require 'spec_helper'

describe "Subjects" do
  fixtures :all
  use_vcr_cassette "enju_subject/create_subject"

  describe "GET /subjects" do
    it "works! (now write some real specs)" do
      get subjects_path
    end
  end
end
