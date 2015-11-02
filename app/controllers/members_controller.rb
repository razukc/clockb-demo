class MembersController < InheritedResources::Base
	before_action :authenticate_member!
  
  private

    def member_params
      params.require(:member).permit(:name, :company, :person_in_charge, :contact_number, :occupation, :package)
    end
end

