ActiveAdmin.register_page "Incoming Requests" do
	menu priority: 100
content do
	    columns do
      column do
        panel "Requests for Webinar" do
          Request.webinar.map do |post|
            div do
            h4 h4 post.request_for['_x'].titleize
          end
          div do
            ul do              
                li "Name: " << (post.request_by['name'])
                li "Company: " << (post.request_by['company'])
                li "Phone: " << (post.request_by['phone'])
                li "Email: " << (post.request_by['email'])
                li "Sent at: " << (post.created_at).to_s
            end
          end
          end        
        end

        panel "Requests for Meetings" do
        Request.meeting.map do |post|
          div do
            h4 post.request_for['_x'].titleize << "/" << post.request_for['_y'].titleize
          end
          div do
            ul do              
                li "Name: " << (post.request_by['name'])
                li "Company: " << (post.request_by['company'])
                li "Phone: " << (post.request_by['phone'])
                li "Email: " << (post.request_by['email'])
                li "Sent at: " << (post.created_at).to_s
            end
          end
        end 
        end

        panel "Requests for Meetups (Users)" do
        Request.meetup.map do |post|
          div do
            h4 post.request_for['_x'].titleize << "/" << post.request_for['_y'].titleize
          end
          div do
            ul do
              li simple_format (link_to "From: " << User.find_by_id(post.request_for['_z']).email, admin_user_path(User.find_by_id(post.request_for['_z']))).to_s
              li simple_format (link_to "To: " << User.find_by_id(post.request_for['_a']).email, admin_user_path(User.find_by_id(post.request_for['_a']))).to_s
            end
          end
        end
        end  


        panel "Requests for Webinar (Users)" do
        Request.webinar_meetup.map do |post|
          div do
            h4 post.request_for['_x'].titleize << "/" << post.request_for['_y'].titleize
          end
          div do
            ul do
              li simple_format (link_to "From: " << User.find_by_id(post.request_for['_z']).email, admin_user_path(User.find_by_id(post.request_for['_z']))).to_s
              li simple_format (link_to "To: " << User.find_by_id(post.request_for['_a']).email, admin_user_path(User.find_by_id(post.request_for['_a']))).to_s
            end
          end
        end
        end

      
      end
    
    
    column do
      panel "Registrations for Events" do
        Request.event.map do |post|
          div do
            h4 link_to post.request_for['_x'].titleize << "/" << Event.find_by_id(post.request_for['_z']).form_params['name'].titleize, event_browse_path(Event.find_by_id(post.request_for['_z']))
          end
          div do
            ul do              
                li "Name: " << (post.request_by['name'])
                li "Company: " << (post.request_by['company'])
                li "Phone: " << (post.request_by['phone'])
                li "Email: " << (post.request_by['email'])
                li "Sent at: " << (post.created_at).to_s
            end
          end
        end        
      end

      panel "Requests for Premium Package" do
          Request.premium.map do |post|
            @user = User.find_by_id(post.request_for['_z']) 
            div do
            h4 link_to @user.inputs['name'].titleize, admin_user_path(@user)
          end
          div do
            ul do              
                li "Email: " << (@user.inputs['email']).to_s
                li "Contact: " << (@user.inputs['contact'])
                li "Type: " << (@user.inputs['type']).titleize
                li "Sent at: " << (post.created_at).to_s
            end
          end
          end        
        end
    end


      column do
        panel "Applications for Vacancy" do
          Request.vacancy.map do |post|
            div do
              h4 post.request_for['_x'].titleize << "/" << Vacancy.find_by_id(post.request_for['_z']).content['job_title'].titleize
            end
            div do
              ul do
                  li link_to "Download CV", post.attachment.url
                  li "Sent at: " << post.created_at.to_s 
              end
            end
          end     
        end
        panel "Applications for Internship" do
          Request.internship.map do |post|
            div do
              h4 post.request_for['_x'].titleize
            end
            div do
              ul do
                li link_to "Download CV", post.attachment.url
                li "Comment: " << post.request_by['comment']
                li "Sent at: " << post.created_at.to_s
              end
            end
          end   
        end
      end

    end # columns
end # content

end