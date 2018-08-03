namespace :create do
  desc 'create users'
  task users: :environment do
    user = User.create(
      email: 'student@gmail.com',
      password: '12341234',
      role: 'student'
    )
    user.create_profile(
      first_name: 'Marko',
      last_name: 'Polo',
      gender: 'male',
      birthday: '11/11/1990',
      avatar: File.open("#{Rails.root}/spec/files/avatar.png")
    )

    user = User.create(
      email: 'tutor@gmail.com',
      password: '12341234',
      role: 'tutor'
    )
    user.create_profile(
      first_name: 'Franko',
      last_name: 'Tolo',
      gender: 'male',
      birthday: '11/11/1960',
      avatar: File.open("#{Rails.root}/spec/files/avatar.png")
    )

    user = User.create(
      email: 'admin@gmail.com',
      password: '12341234',
      role: 'admin'
    )
    user.create_profile(
      first_name: 'Alis',
      last_name: 'Dola',
      gender: 'female',
      birthday: '11/11/1980',
      avatar: File.open("#{Rails.root}/spec/files/avatar.png")
    )
  end
end
