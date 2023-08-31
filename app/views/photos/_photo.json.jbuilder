json.extract! photo, :id, :image_url, :caption, :user_id, :business_id, :created_at, :updated_at
json.url photo_url(photo, format: :json)
