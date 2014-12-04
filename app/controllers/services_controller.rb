class ServicesController < ApplicationController

  def update
    service = ServiceForm.new(Service.find(params[:id]))
    service.persist service_params

    redirect_to manage_requests_path
  end

  def service_params
      params.require(:service).permit(:notes, :expected_term, :cost, :status)
  end
end
