class MembersController < InheritedResources::Base
	before_action :authenticate_member!
def my_events
	@my_events = current_member.events
	@today = Event.today
end
  private

    def member_params
      params.require(:member).permit(:name, :company, :person_in_charge, :contact_number, :occupation, :package)
    end
end

