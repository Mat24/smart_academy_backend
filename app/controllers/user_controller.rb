class UserController < ApplicationController
  skip_before_action :authenticate_request, only: [:login,:create]
  def login
    @user = User.find_by_email(params[:email])
    if @user and @user.password == params[:password]
      render json: {auth_token: @user.generate_auth_token, usuario: @user}, status: :accepted
    else
      @user = nil
      render json: {error: "usuario y/o contraseña invalidos"}, status: :unauthorized
    end
  end

  def create
    @user = User.new user_params
    if @user.save
      render json: {sucessfull: "El nuevo usuario se ha creado satisfactoriamente"}, status:  :ok
    else
      render json: {error: @user.errors}, status: :unprocessable_entity
    end

  end
  def void
    render json: {email: @current_user.email},status: :ok
  end

  def user_params
    params.require(:user).permit(:username,:first_name, :last_name,:password,:email,:name,:phone,:user_type)
  end
end
