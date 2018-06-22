require 'spec_helper'
require 'database_cleaner'

describe AdminController, :type => :controller do
  before(:all) do
    DatabaseCleaner.start
    # first user is auto-promoted to admin
    @admin = FactoryBot.create(:admin)
    @user = FactoryBot.create(:user)
  end

  after(:all) do
    DatabaseCleaner.clean
  end

  describe "GET index" do
    it "requires you to be logged in" do
      get "index"
      expect(response).to redirect_to(:controller =>  "user", :action => "login", url: "/admin")
    end

    it "fails if you're not an admin" do
      request.session[:user_id] = @user.id
      get "index"
      expect(response).not_to be_success
    end
    it "works if you're an admin" do
      request.session[:user_id] = @admin.id
      get "index"
      expect(response).to be_success
    end
  end
  describe "GET edit_user" do
    it "requires you to be logged in" do
      get "edit_user"
      expect(response).to redirect_to(:controller =>  "user", :action => "login", url: "/admin/edit_user")
    end

    it "fails if you're not an admin" do
      request.session[:user_id] = @user.id
      get "edit_user"
      expect(response).not_to be_success
    end
    it "works if you're an admin" do
      request.session[:user_id] = @admin.id
      get "edit_user"
      expect(response).to be_success
    end
  end

  describe "POST edit_user" do
    it "requires you to be logged in" do
      post "edit_user"
      expect(response).to redirect_to(:controller =>  "user", :action => "login")
    end
    it "fails if you're not an admin" do
      request.session[:user_id] = @user.id
      post "edit_user"
      expect(response).not_to be_success
    end
    it "lets you change a user's level" do
      request.session[:user_id] = @admin.id
      post "edit_user", {user: {name: @user.name, level: @admin.level}}
      expect(@user.reload.level).to eq @admin.level
    end
  end

  describe "GET reset_password" do
    it "requires you to be logged in" do
      get "reset_password"
      expect(response).to redirect_to(:controller =>  "user", :action => "login", url: "/admin/reset_password")
    end

    it "fails if you're not an admin" do
      request.session[:user_id] = @user.id
      get "reset_password"
      expect(response).not_to be_success
    end
    it "works if you're an admin" do
      request.session[:user_id] = @admin.id
      get "reset_password"
      expect(response).to be_success
    end
  end

  describe "POST reset_password" do
    it "requires you to be logged in" do
      post "reset_password"
      expect(response).to redirect_to(:controller =>  "user", :action => "login", url: "/admin/reset_password")
    end

    it "fails if you're not an admin" do
      request.session[:user_id] = @user.id
      post "reset_password"
      expect(response).not_to be_success
    end
    it "resets a user's password" do
      request.session[:user_id] = @admin.id
      oldpass = @user.password_hash
      post "reset_password", {user: {name: @user.name}}
      expect(response).to be_success
      expect(flash[:notice]).to match(/Password reset to/)
      expect(@user.reload.password_hash).not_to eq(oldpass)
    end
  end


end
