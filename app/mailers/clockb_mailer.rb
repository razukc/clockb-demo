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
