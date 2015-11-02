json.array!(@members) do |member|
  json.extract! member, :id, :name, :company, :person_in_charge, :contact_number, :occupation, :package
  json.url member_url(member, format: :json)
end
