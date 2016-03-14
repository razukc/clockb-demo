class UsersRegistrationsController < Devise::RegistrationsController
	
	# GET /resource/sign_up
	  def new
	    build_resource({})
	    set_minimum_password_length
	    yield resource if block_given?
	    # respond_with self.resource
	    render "users/registrations/new"
	  end

	  # POST /resource
	  def create
	    build_resource(sign_up_params)

	    resource.save
	    
	    yield resource if block_given?
	    if resource.persisted?
	      if resource.active_for_authentication?
	        set_flash_message :notice, :signed_up if is_flashing_format?
	        sign_up(resource_name, resource)
	        ClockbMailer.signup_email(resource.email).deliver_now
	        ClockbMailer.admin_signup_email(resource).deliver_now
	        respond_with resource, location: after_sign_up_path_for(resource)
	      else
	        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_flashing_format?
	        expire_data_after_sign_in!
	        respond_with resource, location: after_inactive_sign_up_path_for(resource)
	      end
	    else
	      clean_up_passwords resource
	      set_minimum_password_length
	      # respond_with resource
	      
		  flash[:alert] = resource.errors.full_messages.map { |msg| msg }.join
	      render "users/registrations/new"
	    end
	  end
	  protected
	    def sign_up_params
	    	inputs_keys = params[:user][:inputs].keys
    		params.require(:user).permit(:email, :password, :password_confirmation, inputs: inputs_keys)
  		end
  		def after_sign_up_path_for(resource)
  		  complete_profile_path
  		end

end