class ServicesController < ApplicationController

  def update
    service = Service.find(params[:id])
    service.attributes = service_params.except(:status)
    service.status = service_params[:status].to_i
    service.save
    redirect_to manage_requests_path
  end

  def service_params
      params.require(:service).permit(:notes, :expected_term, :cost, :surname, :status)
  end
end
