# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authorize_request, except: :create
  before_action :valid_genders, only: %i[create update]

  def create
    return render_bad_request(password: (I18n.t 'empty_password')) if params[:password].blank?

    @user = User.new(user_params)
    if @user.save
      @user.token = JsonWebToken.encode({ user_id: @user.id, last_seen: DateTime.now })
      render_serialized_data(@user)
    else
      render_bad_request(@user.errors)
    end
  end

  def show
    render_serialized_data(@current_user)
  end

  def update
    if @current_user.update(profile_params)
      render_serialized_data(@current_user)
    else
      render_bad_request(@current_user.errors)
    end
  end

  def change_password
    return render_bad_request(error: (I18n.t 'old_password')) unless @current_user.authenticate(change_password_params[:old_password])

    return render_bad_request(password: (I18n.t 'empty_password')) if params[:password].blank?

    if @current_user.update(change_password_params.except(:old_password).merge(last_seen: DateTime.now))
      render_success(message: (I18n.t 'password_change_success'))
    else
      render_bad_request(@current_user.errors)
    end
  end

  private

  def user_params
    params.permit(
        :email, :password, :password_confirmation, :first_name,
        :last_name, :gender, :phone_number, :role, :experience
    )
  end

  def profile_params
    params.permit(:first_name, :gender, :last_name, :phone_number, :experience)
  end

  def change_password_params
    params.permit(:password, :old_password, :password_confirmation)
  end

  def valid_genders
    gender_options = User.get_genders
    if params[:gender] && !(gender_options.keys.include?(params[:gender]) ||
      gender_options.values.include?(params[:gender]))
      return render_bad_request(gender: (I18n.t 'gender_invalid'))
    end
  end
end
