class AlertsController < ApplicationController
  before_action :set_alert, only: [:destroy]

  def create
    @alert = Alert.new(alert_params)

    if @alert.save
      render json: @alert, status: :created
    else
      render json: @alert.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @alert.destroy
    head :no_content
  end

  def index
    @alerts = Alert.all
    render json: @alerts
  end

  private

  def set_alert
    @alert = Alert.find(params[:id])
  end

  def alert_params
    params.require(:alert).permit(:user_id, :coin_symbol, :target_price, :status)
  end
end
