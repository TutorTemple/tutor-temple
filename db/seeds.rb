Dir[File.join(Rails.root, 'db/seeds/**/*.rb')].each(&method(:require))
