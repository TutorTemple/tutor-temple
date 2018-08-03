namespace :create do
  desc 'create users'
  task subjects: :environment do
    Subject.first_or_create([
                              { name: 'Language Arts' },
                              { name: 'Mathematics' },
                              { name: 'Science' },
                              { name: 'Health' },
                              { name: 'Handwriting' },
                              { name: 'Speech' },
                              { name: 'Reading' },
                              { name: 'Pre-algebra' },
                              { name: 'Earth Science' },
                              { name: 'Grammar' },
                              { name: 'Physical Education' }
                            ])
  end
end
