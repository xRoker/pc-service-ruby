class ServiceForm < Reform::Form
  property :status
  property :notes 
  property :expected_term
  property :cost
  # place for other properties

  def persist(params)

    # Convert string parameter to an integer value
    params[:status] = params[:status].to_i

    # A report is required in case service is closed 
    return false unless params[:status] != 4 || check_integrity(params)

    if validate(params) && save
      true
    else
      false
    end
  end

  def check_integrity(params)
    params[:notes] != "" && params[:cost] != ""
  end

end