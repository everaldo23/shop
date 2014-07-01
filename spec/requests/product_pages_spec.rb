require 'spec_helper'

describe "ProductPages" do
  
  subject { page }
  
  describe "product listing page" do
    let (:product)  { FactoryGirl.create(:product) }
    before { visit product_path(product) }
    
    it { should have_selector('h1', text: product.title) }
    it { should have_title(product.title) }
  end
  
  describe "create product page" do
    before { visit new_product_path }
    
    it { should have_title("List new products") }
    it { should have_selector('h1', text: "List new products") }
  end
  
  describe "create products" do
    
    before { visit new_product_path }
    
    let(:submit) { "List product" }
    
    describe "with invalid information" do
      it "should not create a product" do
        expect { click_button submit }.not_to change(Product, :count)
      end
    end
    
    describe "with valid information" do
      before do
        fill_in "Title",       with: "Bread"
        fill_in "Description", with: "This is a piece of bread"
        fill_in "Price",       with: "1.00"
      end
      
      it "should create a product" do
        expect { click_button submit }.to change(Product, :count).by (1)
      end
    end     
  end
end
