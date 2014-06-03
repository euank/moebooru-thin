class AdminController < ApplicationController
  layout "default"
  before_filter :admin_only

  def index
  end

  def edit_user
    if request.post?
      @user = User.find_by_name(params[:user][:name])
      if @user.nil?
        flash[:notice] = "User not found"
        redirect_to :action => "edit_user"
        return
      end
      @user.level = params[:user][:level]

      if @user.save
        flash[:notice] = "User updated"
        redirect_to :action => "edit_user"
      else
        render_error(@user)
      end
    end
  end

  def reset_password
    if request.post?
      @user = User.find_by_name(params[:user][:name])

      if @user
        new_password = @user.reset_password
        flash[:notice] = "Password reset to #{new_password}"

        unless @user.email.blank?
          begin
            UserMailer.new_password(@user, new_password).deliver
          rescue Net::SMTPSyntaxError, Net::SMTPFatalError
            respond_to_success("Specified user's email address was invalid",
              {:action => :reset_password }, :api => {:result => "invalid-email"})
            return
          end
        end
      else
        flash[:notice] = "That account does not exist"
        redirect_to :action => "reset_password"
      end
    else
      @user = User.new
    end
  end
end
