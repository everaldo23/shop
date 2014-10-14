require 'spec_helper'

describe Product do
 
  before do 
     @product = Product.new(title: "Bread", description: "This is a piece of bread", price: "6.00", syahrilpics: "http://shopphoto.s3.amazonaws.com/products/shopphotos/000/000/003/square/corelle3.jpg?1404284586", category: "Books", brand: "GlaxoSmithKline") 
  end
  
  subject { @product }
  
  it { should respond_to(:title) }
  it { should respond_to(:description) }
  it { should respond_to(:price) }
  it { should respond_to(:brand) }
  it { should respond_to(:category) }
  it { should respond_to(:syahrilpics) }
  
  it { should be_valid }
  
  describe "when title is not present" do
    before { @product.title = " " }
    it { should_not be_valid }
  end
  
  describe "when description is not present" do
    before { @product.description = " " }
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
    before { @product.description = "a" * 201 }
    it { should_not be_valid }
  end
end
  
 
  
