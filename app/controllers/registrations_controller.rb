class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :age, :gender, :email, :password, :password_confirmation, :home_address)
  end

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :age, :gender, :email, :password, :password_confirmation, :current_password, :home_address)
  end
end