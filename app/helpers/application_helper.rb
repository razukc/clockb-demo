module ApplicationHelper
  def options_for_field_of_expertise
    [
      ["Agriculture & Forestry Sector","Agriculture & Forestry Sector"],
      ["Arts, Entertainment & Recreation Sector","Arts, Entertainment & Recreation Sector"],
      ["Business Innovation","Business Innovation"],
      ["Business Services Sector","Business Services Sector"],
      ["Construction Sector","Construction Sector"],
      ["Consumer Services","Consumer Services"],
      ["Education Sector","Education Sector"],
      ["Electric Utilities","Electric Utilities"],
      ["Finance & Insurance Sector","Finance & Insurance Sector"],
      ["Government","Government"],
      ["Health Care Sector","Health Care Sector"],
      ["IT & Technology","IT & Technology"],
      ["Lodging","Lodging"],
      ["Management of Companies & Enterprises","Management of Companies & Enterprises"],
      ["Manufacturing Sector","Manufacturing Sector"],
      ["Media","Media"],
      ["Membership Organizations","Membership Organizations"],
      ["Mining","Mining"],
      ["Natural Gas Distribution","Natural Gas Distribution"],
      ["Nonprofit Institutions","Nonprofit Institutions"],
      ["Oil & Gas","Oil & Gas"],
      ["Others","Others"],
      ["Private Households","Private Households"],
      ["Professional Services Sector","Professional Services Sector"],
      ["Real Estate","Real Estate"],
      ["Religious Organizations","Religious Organizations"],
      ["Rental & Leasing","Rental & Leasing"],
      ["Restaurants, Bars & Food Services","Restaurants, Bars & Food Services"],
      ["Retail Sector","Retail Sector"],
      ["Transportation Services Sector","Transportation Services Sector"],
      ["Water & Sewer Utilities","Water & Sewer Utilities"],
      ["Wholesale Sector","Wholesale Sector"]
    ]

  end
def blank_to_nbsp(value)
  value.blank? ? "&nbsp;".html_safe : value
end
	# Should probably go in application_helper
# examples (when run in this order):
# autotab           # returns 1
# autotab           # returns 2
# autotab(100)      # returns 102
# autotab           # returns 3
# autotab(100,true) # returns 104
# autotab           # returns 105

# example   f.text_field :address, :tabindex=>autotab

def autotab(offset=nil,update=false)
  @current_tab ||= 0
  if offset.nil?
    ret = @current_tab += 1
  elsif update
    ret = @current_tab += offset
  else
    ret = @current_tab + offset
  end

  ret
end
end
