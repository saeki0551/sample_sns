# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  def create
    build_resource(sign_up_params)
    Rails.logger.debug("User params: #{sign_up_params.inspect}")
    
    if resource.save
      yield resource if block_given?
      
      if resource.persisted?
        set_flash_message! :notice, :signed_up
        respond_with resource, location: after_sign_up_path_for(resource)
      else
        clean_up_passwords resource
        set_minimum_password_length
        respond_with resource
      end
    else
      # エラーメッセージを表示
      Rails.logger.debug("Errors: #{resource.errors.full_messages}")
      flash[:alert] = resource.errors.full_messages.to_sentence
      respond_with resource
    end
  end  

  protected
  def after_sign_up_path_for(resource)
    flash[:notice] = "アカウントが作成されました。ログインしてください。"
    new_user_session_path # ログインページへリダイレクト
  end
  
