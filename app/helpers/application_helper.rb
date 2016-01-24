module ApplicationHelper
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
