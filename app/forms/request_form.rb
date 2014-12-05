class RequestForm < Reform::Form

  property :device_type
  property :model_name
  property :description
  property :priority
  property :warranty
  property :address_id
  property :user_id

<<<<<<< HEAD
  def apply user_id, request_params, address_params

    # Check if a value of the dropdown menu is not "Nowy..."
    if request_params[:address_id] == "-1"

      address = Address.new address_params
      address.user_id = user_id
      if !address.save
        raise address.errors.inspect
        return false
      end
      
      request_params[:address_id] = address.id

    end

    request_params = request_params.merge(user_id: user_id)
    request_params[:warranty] ||= false

    if validate(request_params) && save
=======
  def apply user_id, params

    # Check if a value of the dropdown menu is not "Nowy..."
    if params[:address_id] == "-1"

      address = Address.new params[:address]
      address.user_id = user_id
      if !address.save
        return false
      end
      
      params[:address_id] = address.id

    end

    params = params.merge(user_id: user_id)
    params[:warranty] ||= false

    if validate(params) && save
>>>>>>> FETCH_HEAD
      true
    else false
    end

  end

end