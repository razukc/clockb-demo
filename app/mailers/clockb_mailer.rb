class ClockbMailer < ApplicationMailer
  def meeting_email(email)
    mail(from: 'meetings@clockb.com', to: email, subject: 'Request For Meeting')
  end
  def meetup_email(email)
    mail(from: 'meetings@clockb.com', to: email, subject: 'Meet-up')
  end
  def signup_email(email)
    mail(from: 'services@clockb.com', to: email, subject: 'Sign-up')
  end
  def webinar_email(email)
    mail(from: 'meetings@clockb.com', to: email, subject: 'Webinar')
  end
  def job_application_email(email)
    mail(from: 'careers@clockb.com', to: email, subject: 'Job Application')
  end
  def event_weekly_email(email)
    mail(from: 'events@clockb.com', to: email, subject: 'Event Registration Weekly Event')
  end
  def event_main_email(email)
    mail(from: 'events@clockb.com', to: email, subject: 'Event Registration Main Event')
  end
  def event_email(email, type)
    @type = type
    mail(from: 'events@clockb.com', to: email, subject: 'Event Registration ' << @type.humanize << ' Event')
  end

  def premium_email(email)
    mail(from: 'services@clockb.com', to: email, subject: 'Request for Premium Account')
  end

  # Admin Emails
  def message_freelancer(resource)
    @resource = resource
    @message = @resource.form_params['comment']
    @user = User.find(@resource.link_params['_z'])
    @freelancer = User.find(@resource.link_params['_a'])
    @user_link = admin_user_url(@user)
    @freelancer_link = admin_user_url(@freelancer)
    mail(from: 'no-reply@clockb.com', to: 'admin@clockb.com', subject: 'Message to Freelancer')    
  end
  def book_webinar_appointment(resource)
        @resource = resource
        @user = User.find(@resource.link_params['_z'])
        @freelancer = User.find(@resource.link_params['_a'])
        @user_link = admin_user_url(@user)
        @freelancer_link = admin_user_url(@freelancer)
        mail(from: 'no-reply@clockb.com', to: 'admin@clockb.com', subject: 'Book Webinar Appointment with Freelancer')    
  end
  def book_your_appointment(resource)
        @resource = resource
        @user = User.find(@resource.link_params['_z'])
        @freelancer = User.find(@resource.link_params['_a'])
        @user_link = admin_user_url(@user)
        @freelancer_link = admin_user_url(@freelancer)
        mail(from: 'no-reply@clockb.com', to: 'admin@clockb.com', subject: 'Book Appointment with Freelancer')    
  end
  def join_as_clock_b_freelancer(resource)
    @resource = resource
    @user = User.find(@resource.link_params['_z'])
    @admin_link = admin_user_url(@user)
    mail(from: 'no-reply@clockb.com', to: 'admin@clockb.com', subject: 'Request for Join as a Clock b Freelancer')
  end
  def admin_event_email_non_user(resource, type)
    @type = type
    @resource = resource
    @name = @resource.form_params['name']
    unless @resource.form_params['company'].blank?
      
    @company = @resource.form_params['company']
    end
    
    @phone = @resource.form_params['phone']
    @email = @resource.form_params['email']
    if @type == 'main'
      @field_of_expertise = @resource.form_params['field_of_expertise']
      @payment_option = @resource.form_params['payment_options']
      @attendee_category = @resource.form_params['attendee_category']
      @address = @resource.form_params['address']
    end
    mail(from: 'admin@clockb.com', to: 'events@clockb.com', subject: "Event Registration " << @type.humanize << ' Event')
  end
  def admin_animated_video_email(resource)
    @resource = resource
    @email = @resource.email
    @name = @resource.inputs['name']
    @admin_link = admin_user_url(@resource)
    mail(from: 'admin@clockb.com', to: 'info@clockb.com', subject: 'Request for Animated Video')
  end
  def admin_signup_email(resource)
    @resource = resource
    @email = @resource.email
    @name = @resource.inputs['name']
    @admin_link = admin_user_url(@resource)
    mail(from: 'admin@clockb.com', to: 'services@clockb.com', subject: "New user signed up")
  end

  def admin_job_application_email(request)
    @request = request
    @job = Vacancy.find_by_id(@request.link_params['_z'])
    @job_title = @job.content['job_title']
    @applicant_name = @request.form_params['name']
    @applicant_email = @request.form_params['email']
    @admin_link = admin_vacancy_url(@job)
    
    mail(from: 'admin@clockb.com', to: 'careers@clockb.com', subject: "New job application")
  end

  def admin_internship_email(request)
    @request = request
    @applicant_name = @request.form_params['name']
    @applicant_email = @request.form_params['email']
    @admin_link = admin_vacancy_url(@job)
    
    mail(from: 'admin@clockb.com', to: 'careers@clockb.com', subject: "New job application")
  end

end
