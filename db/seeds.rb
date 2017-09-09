DatabaseCleaner.clean_with(:truncation)

User.create!(email: 'don@aol.com', password: 'abc123', role: 'user')
User.create(email: 'ram@aol.com', password: 'abc123', role: 'admin')