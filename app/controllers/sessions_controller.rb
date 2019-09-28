# frozen_string_literal: true

class SessionsController < ApplicationController
  before_action :authorize_request, only: :update
  def create
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      token = JsonWebToken.encode({ user_id: @user.id, last_seen: DateTime.now })
      render_success(token: token)
    else
      render_unauthenticated
    end
  end

  def update
    if @current_user.update(last_seen: DateTime.now)
      render_success(message: (I18n.t 'logout_success'))
    else
      render_bad_request(@current_user.errors)
    end
  end
end
