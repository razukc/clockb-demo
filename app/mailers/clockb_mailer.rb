class ClockbMailer < ApplicationMailer
  def meeting_email(email)
    mail(from: 'meetings@clockb.com', to: email, subject: 'Request For Meeting')
  end
  def meetup_email(email)(email)
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
end
