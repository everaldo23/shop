require 'spec_helper'

describe "Authentication" do
  subject { page }
  
  describe "signin page" do
    before { visit signin_path }
    
    it {should have_selector('div.container', text: "Shopping") }
  end
  
  describe "Signin" do
    before { visit signin_path }
    
    describe "with invalid information" do
      before { click_button "Sign in" }
      
      it {should have_selector('div.alert.alert-error') }
    end     
  end
end
    
    
   