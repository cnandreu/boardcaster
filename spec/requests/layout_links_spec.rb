require 'spec_helper'

describe "Users" do
  
  describe "signup" do

    describe "failure" do
      it "should not make a new user" do
        lambda do
          visit signup_path
          fill_in "Username",             :with => ""
          fill_in "Email",                :with => ""
          fill_in "Password",             :with => ""
          fill_in "Password confirmation",:with => ""
          click_button "Submit"
          page.should have_selector('div.alert-message')
        end.should_not change(User, :count)
      end
    end

    describe "success" do
      it "should make a new user" do
        lambda do
          visit signup_path
          fill_in "Username",             :with => "Example User"
          fill_in "Email",                :with => "user@example.com"
          fill_in "Password",             :with => "foobar"
          fill_in "Password confirmation",:with => "foobar"
          click_button "Submit"
          page.should have_selector('div.alert-message',
                                        :content => "Signed up!")
        end.should change(User, :count).by(1)
      end
    end
  end

  describe "signin" do
    
    describe "failure" do
      it "should not sign a user in" do
        visit login_path
        fill_in "Username", :with => ""
        fill_in "Password", :with => ""
        click_button "Log in"
        page.should have_selector('div.alert-message',
                                      :content => "Email or password was invalid")
      end
    end
  end
end
