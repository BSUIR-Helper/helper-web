require 'spec_helper'

describe "Disciplines" do
  describe "GET /disciplines" do
    it "works! (now write some real specs)" do
      get disciplines_path
      expect(response.status).to eq(200)
    end
  end
end
