ActiveAdmin.register Request do

config.filters = false
# config.per_page = 10
actions :all, except: [:edit, :update, :destroy]

end
