class Api::V1::NotificationAlertRecipientsController < ApplicationController
  before_action :set_notification_alert_recipient, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @notification_alert_recipients = NotificationAlertRecipient.all
    respond_with(@notification_alert_recipients)
  end

  def show
    respond_with(@notification_alert_recipient)
  end

  def create
    @notification_alert_recipient = NotificationAlertRecipient.new(notification_alert_recipient_params)
    @notification_alert_recipient.save
    respond_with(@notification_alert_recipient)
  end

  def update
    @notification_alert_recipient.update(notification_alert_recipient_params)
    respond_with(@notification_alert_recipient)
  end

  def destroy
    @notification_alert_recipient.destroy
    respond_with(@notification_alert_recipient)
  end

  private
    def set_notification_alert_recipient
      @notification_alert_recipient = NotificationAlertRecipient.find(params[:id])
    end

    def notification_alert_recipient_params
      params.require(:notification_alert_recipient).permit(:alert_id, :user_id, :alert_read, :date_changed, :uuid)
    end
end
