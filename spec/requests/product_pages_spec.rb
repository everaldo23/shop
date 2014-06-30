require 'spec_helper'

describe "ProductPages" do
  describe "GET /product_pages" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get product_pages_index_path
      response.status.should be(200)
    end
  end
end
