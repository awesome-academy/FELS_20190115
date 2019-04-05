class RegistrationsController < Devise::RegistrationsController
  def update_resource(resource, params)
    if current_user.provider
      params.delete("current_password")
      resource.update_without_password(params)
    else
      resource.update_with_password(params)
    end
  end

  private
  def sign_up_params
    params.require(:user).permit :name, :email, :password,
      :password_confirmation
  end

  def account_update_params
    params.require(:user).permit :name, :email, :password,
      :password_confirmation, :current_password
  end
end
