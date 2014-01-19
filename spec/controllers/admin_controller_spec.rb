require 'spec_helper'

describe AdminController do
  before(:all) do
    # Note, this must be in this order because the first user gets "autopromoted" to admin
    @admin = FactoryGirl.create(:admin)
    @user = FactoryGirl.create(:user)
  end

  describe "GET index" do
    it "requires you to be logged in" do
      get "index"
      response.should redirect_to(:controller =>  "user", :action => "login", url: "/admin")
    end

    it "fails if you're not an admin" do
      request.session[:user_id] = @user.id
      get "index"
      response.should_not be_success
    end
    it "works if you're an admin" do
      request.session[:user_id] = @admin.id
      get "index"
      response.should be_success
    end
  end
  describe "GET edit_user" do
    it "requires you to be logged in" do
      get "edit_user"
      response.should redirect_to(:controller =>  "user", :action => "login", url: "/admin/edit_user")
    end

    it "fails if you're not an admin" do
      request.session[:user_id] = @user.id
      get "edit_user"
      response.should_not be_success # TODO better error
    end
    it "works if you're an admin" do
      request.session[:user_id] = @admin.id
      get "edit_user"
      response.should be_success
    end
  end

  describe "POST edit_user" do
    it "requires you to be logged in" do
      post "edit_user"
      response.should redirect_to(:controller =>  "user", :action => "login", url: "/admin/edit_user")
    end
    it "fails if you're not an admin" do
      request.session[:user_id] = @user.id
      post "edit_user"
      response.should_not be_success # TODO better error
    end
    it "lets you change a user's level" do
      request.session[:user_id] = @admin.id
      post "edit_user", {user: {name: @user.name, level: @admin.level}}
      @user.reload.level.should eq @admin.level
    end
  end
end
