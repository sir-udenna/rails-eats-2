# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# Create users
user1 = User.create(username: 'user1', email: 'user1@example.com', password: 'password', bio: 'Food lover')
user2 = User.create(username: 'user2', email: 'user2@example.com', password: 'password', bio: 'Adventurous eater')

# Create businesses
business1 = Business.create(name: 'Local Cafe', description: 'Cozy coffee shop', address: '123 Main St', phone: '555-1234')
business2 = Business.create(name: 'Taco Shack', description: 'Authentic tacos', address: '456 Elm St', phone: '555-5678')

# Create reviews
review1 = Review.create(rating: 4, content: 'Great coffee!', user: user1, business: business1)
review2 = Review.create(rating: 5, content: 'Best tacos ever!', user: user2, business: business2)

# Create photos
photo1 = Photo.create(image_url: 'https://example.com/coffee.jpg', caption: 'Morning coffee', user: user1, business: business1)
photo2 = Photo.create(image_url: 'https://example.com/tacos.jpg', caption: 'Delicious tacos', user: user2, business: business2)

# Create categories
Category.create(name: 'Coffee Shops', description: 'Places for a caffeine fix', icon: 'coffee-cup')
Category.create(name: 'Mexican Cuisine', description: 'Authentic Mexican food', icon: 'taco')

# Create follows
Follow.create(user: user1, business: business1)
Follow.create(user: user2, business: business2)

# Create likes
Like.create(user: user1, review: review1)
Like.create(user: user2, photo: photo2)

