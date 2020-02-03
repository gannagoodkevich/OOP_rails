class ConfirmationsController < ApplicationController
  skip_before_action :authenticate!
  before_action :redirect_if_token_empty!

  def show
    @confirmation_result = ConfirmationUserService.new(params[:token]).call

    if @confirmation_result
      flash.notice = t('confirmations.user.confirmed')
      warden.set_user(@confirmation_result)
      redirect_to :root
    else
      flash.alert = t('confirmations.user.errors')
      redirect_to :root && return
    end
  end

  protected

  def redirect_if_token_empty!
    flash.alert = t('confirmations.token.empty') unless params.key?(:token)
  end
end
