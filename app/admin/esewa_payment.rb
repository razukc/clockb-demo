ActiveAdmin.register EsewaPayment do
	filter :created_at
	filter :product_id
	filter :reference_id
	filter :amount
actions :all, except: [:update, :edit, :new, :create] #:destroy, 
# config.batch_actions = false
index do
	selectable_column
	column "Date and Time", :created_at
	column "Product ID", :product_id
	column "Reference ID", :reference_id
	column :amount, as: :numeric
	actions
end
csv do
    column :created_at
    column :product_id
    column :reference_id
    column :amount
    # column(:author) { |post| post.author.full_name }
  end
end
