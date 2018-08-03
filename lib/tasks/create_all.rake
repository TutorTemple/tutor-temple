namespace :create do
  desc 'run all create tasks'
  task all: %i[
    users
  ]
end
