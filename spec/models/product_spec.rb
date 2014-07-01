require 'spec_helper'

describe Product do
 
  before do 
     @product = Product.new(title: "Bread", description: "This is a piece of bread", image_url: "bread.png", price: "6.00") 
  end
  
  subject { @product }
  
  it { should respond_to(:title) }
  it { should respond_to(:description) }
  it { should respond_to(:image_url) }
  it { should respond_to(:price) }
  
  it { should be_valid }
  
  describe "when title is not present" do
    before { @product.title = " " }
    it { should_not be_valid }
  end
  
  describe "when description is not present" do
    before { @product.description = " " }
    it { should_not be_valid }
  end
  
  describe "when image_url is not present" do
    before { @product.image_url = " " }
    it { should_not be_valid }
  end
  
  describe "when price is too low" do
    before { @product.price = "0.00" }
    it { should_not be_valid }
  end
  
  describe "when title is not unique" do
    before do
      same_title = @product.dup
      same_title.save
    end
    
    it { should_not be_valid }
  end
  
  describe "when description is too long" do
    before { @product.description = "a" * 101 }
    it { should_not be_valid }
  end
  
  describe "when image_url is the wrong format" do
    it "should be invalid" do
      fileformat = %w[bread.woff, bread.mkv, bread.mp4]
      fileformat.each do |invalid_format|
        @product.image_url = invalid_format
        expect(@product).not_to be_valid
      end
    end
  end
  
  describe "when image_url is the correct format" do
    it "should be valid" do
      fileformat = %w[bread.png, bread.gif, bread.jpg]
      fileformat.each do |valid_format|
        @product.image_url = valid_format
        expect(@product).to be_valid
      end
    end
  end  
end
