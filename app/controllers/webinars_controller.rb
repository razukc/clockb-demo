class WebinarsController < ApplicationController
	
before_filter :config_opentok,:except => [:index]
def index
@webinars = Webinar.where(:public => true)#.order(“created_at DESC”)
@new_webinar = Webinar.new
end

def create
# session = @opentok.create_session request.remote_addr
session = @opentok.create_session :media_mode => :routed
params[:webinar][:sessionId] = session.session_id

@new_webinar = Webinar.new(webinar_params)

respond_to do |format|
if @new_webinar.save
format.html { redirect_to('/party/'+@new_webinar.id.to_s) }
else
format.html { render :controller => 'webinars',
:action => 'index' }
end
end
end

def party
@webinar = Webinar.find(params[:id])

@tok_token = @opentok.generate_token @webinar.sessionId
end

private
def config_opentok
if @opentok.nil?
	api_key = "45451522"        # Replace with your OpenTok API key.
api_secret = "59deebe014f6257eb2607a875e41a5306c4ceed7"  # Replace with your OpenTok API secret.

@opentok = OpenTok::OpenTok.new api_key, api_secret 
# session = opentok.create_session :media_mode => :routed
# session_id = session.session_id
# @opentok = OpenTok::OpenTok.new {45451522}, {59deebe014f6257eb2607a875e41a5306c4ceed7}
end
end
def webinar_params
	params.require(:webinar).permit(:name, :sessionId, :public)
end
end
