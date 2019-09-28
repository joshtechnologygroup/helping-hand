class ApplicationController < ActionController::API
  include Pundit
  include Render

  rescue_from Pundit::NotAuthorizedError do
    render_unauthorized
  end

  def authorize_request
    header = request.headers['Authorization']
    @decoded_token = JsonWebToken.decode(header)
    return render_invalid_token unless @decoded_token

    @current_user = User.find_by_id(@decoded_token[:user_id])
    render_unauthenticated unless @current_user && @current_user.last_seen.to_i <= @decoded_token[:last_seen].to_datetime.to_i
  end

  def serialize_model(model, options = {})
    options[:is_collection] = false
    JSONAPI::Serializer.serialize(model, options)
  end

  def serialize_models(models, options = {})
    options[:is_collection] = true
    begin
      JSONAPI::Serializer.serialize(models, options)
    rescue ActiveRecord::StatementInvalid => e
      JSONAPI::Serializer.serialize([], options)
    end
  end

  def page_params
    if params[:page] && params[:page].to_i <=0
      params[:page]= 1
    end
    if params[:page_size] && !(MIN_PAGE_SIZE..MAX_PAGE_SIZE).include?(params[:page_size].to_i)
      params[:page_size]= MIN_PAGE_SIZE
    end
    params[:page_size] = MIN_PAGE_SIZE unless params[:page_size]
    params.permit(:page, :page_size)
  end

  def pundit_user
    @current_user
  end
end
