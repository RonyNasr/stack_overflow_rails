class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def index
    @questions = Question.all
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_url, notice: "Thank you for signing up!"
    else
      render :new
    end
  end

  def edit
    @user = current_user
  end

  def update
    if current_user.update(user_params)
      redirect_to root_url, notice: "User update successful!"
    else
      render :edit
    end

  end

private
  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

end
