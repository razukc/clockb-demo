class UsersRegistrationsController < Devise::RegistrationsController
	respond_to :html, :json, :js

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
	  # PUT /resource
	  # We need to use a copy of the resource because we don't want to change
	  # the current user in place.
	  def update
	    self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)
	    prev_unconfirmed_email = resource.unconfirmed_email if resource.respond_to?(:unconfirmed_email)

	    resource_updated = update_resource(resource, account_update_params)
	    yield resource if block_given?
	    if resource_updated
	      if is_flashing_format?
	        flash_key = update_needs_confirmation?(resource, prev_unconfirmed_email) ?
	          :update_needs_confirmation : :updated
	        set_flash_message :notice, flash_key
	      end
		  respond_to do |format|
		   	format.html {
		      sign_in resource_name, resource, bypass: true
		      respond_with resource, location: after_update_path_for(resource)
		   	}
		   	format.json { respond_with_bip(resource)}
		   	format.js { render template: 'users/registrations/update.js.erb'} 	
		  end
	    else
	    	respond_to do |format|
	    		format.html {
			      clean_up_passwords resource
			      respond_with resource
	    		}
			   	format.json { respond_with_bip(resource)}
		    	format.js {respond_with_bip(resource)}
	    	end
	    end
	  end
	  	# before_filter :configure_permitted_parameters, if: :devise_controller?
	  protected


	  	    # def configure_permitted_parameters
	  	    #     devise_parameter_sanitizer.for(:account_update) do |u|
	  	    #         u.permit(:email, :password, :password_confirmation, :users_websites => [:address])
	  	    #     end
	  	    # end
	  	def account_update_params
	  	  params.require(:user).permit(:website, :headline_message, :animated_video, 
	  	  	:remove_animated_video_file, business_requirements_attributes: [:id, :content, :_destroy],
	  	  	adverts_attributes: [:id, :content, :image, :_destroy],
	  	  	social_media_links_attributes: [:id, :media, :link, :_destroy],
	  	  	networking_requirements_attributes: [:id, :content, :_destroy],
	  	  	products_and_services_attributes: [:id, :content, :_destroy]
	  	  	)
	  	end
	 
	  	def update_resource(resource, params)
	  	  # resource.update_with_password(params)
	  	  resource.update_without_password(params)
	  	end
	  	def sign_up_params
	    	inputs_keys = params[:user][:inputs].keys
			params.require(:user).permit(:email, :password, :password_confirmation, inputs: inputs_keys)
  		end
  		def after_sign_up_path_for(resource)
  		  complete_profile_path
  		end

end