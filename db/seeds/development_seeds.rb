if Rails.env.development?
  require 'factory_bot_rails'

  # create Admin user
  FactoryBot.create(:admin, email: 'admin@example.com')

  # Create Students
  FactoryBot.create_list(:student, 10)

  # Create Tutors
  FactoryBot.create_list(:tutor, 10)
end
