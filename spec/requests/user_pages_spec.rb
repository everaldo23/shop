require 'spec_helper'

describe "User pages" do
  
  subject { page }
  
  describe "Index" do
    let!(:user)  { FactoryGirl.create(:user) }
    let!(:admin) { FactoryGirl.create(:admin) }
    
    before do
      sign_in admin
      visit users_path
    end
    
    it { should have_title("All users") }
    it { should have_selector('h1', text: "All users") }
    it { should have_link("Delete") }
    
    describe "pagination" do
      
      before(:all) { 30.times { FactoryGirl.create(:user) } }
      after(:all)  { User.delete_all }
      
      
      it "should list all users" do
        User.paginate(page: 1).each do |user|
          expect(page).to have_selector('li', text: user.name)
        end
      end   
    end
    
    describe "delete links" do
      
      it "should be able to delete another user" do
        expect do
          click_link('Delete', match: :first)
        end.to change(User, :count).by(-1)
      end      
      it { should_not have_link('Delete', href: user_path(admin)) }
    end
  end


  
  describe" Profile page" do
    let (:user) { FactoryGirl.create(:user) }
    before { visit user_path(user) }
    
    it { should have_title(user.name) }
    it { should have_selector('h1', text: user.name) }
  end
  
  describe "Signup page" do
    before { visit signup_path }
    
    it { should have_title(full_title("Sign up")) }
    it { should have_selector('h1', text: "Sign up") }
    
  end
  
  describe "Signup" do
    
    before { visit signup_path }
    
    let (:submit) { "Create my account" }
    
    describe "with valid information" do
      before do
        fill_in "Name",         with: "Example User"
        fill_in "Email",        with: "user@example.com"
        fill_in "Password",     with: "foobar"
        fill_in "Confirmation", with: "foobar"
      end
      
      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end
      
      describe "after saving the user" do
        before { click_button submit }
        let (:user) { User.find_by(email: 'user@example.com') }
        
        it { should have_link("Sign out") }
        it { should have_title(user.name) }
        it { should have_selector('div.alert.alert-success', text: 'Welcome') }
      end
    end
    
    describe" with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end 
      
      describe "after submission" do
        before { click_button submit }
        
        it { should have_title("Sign up") }
        it { should have_content('error') }
        it { should have_content('blank') }
        it { should have_content('invalid') }
        it { should have_content('short') } 
      end
    end
  end    
  
  describe "Edit" do
    let(:user) { FactoryGirl.create(:user) }
    before do
      sign_in user
      visit edit_user_path(user)
    end
       
    
    describe "page" do
      it { should have_title("Edit page") }
      it { should have_selector('h1', text: 'Update your profile page') }
      it { should have_link("Change", href: 'http://gravatar.com/emails') }
    end
    
    describe "with invalid information" do
      before { click_button "Save changes" }
      
      it { should have_content("error") }
    end
    
    describe "with valid information" do
      let(:new_name)      { "New Name" }
      let(:new_email)     { "new@example.com" }
      before do
        fill_in "Name",                 with: new_name
        fill_in "Email",                with: new_email
        fill_in "Password",             with: user.password
        fill_in "Confirm Password",     with: user.password
        click_button "Save changes"
      end
      
      it { should have_title(new_name) }
      it { should have_selector('div.alert.alert-success') }
      it { should have_link('Sign out', href: signout_path) }
      specify { expect(user.reload.name).to eq new_name }
      specify { expect(user.reload.email).to eq new_email }
    end      
  end
  
end
