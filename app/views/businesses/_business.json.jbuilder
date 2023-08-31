json.extract! business, :id, :name, :description, :address, :phone, :website, :created_at, :updated_at
json.url business_url(business, format: :json)
