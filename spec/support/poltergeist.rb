require 'capybara/rspec'
require 'capybara/poltergeist'

Capybara.default_driver = :poltergeist
Capybara.javascript_driver = :poltergeist
Capybara.default_max_wait_time = 10
Capybara.ignore_hidden_elements = false
Capybara.server = :puma, {Silent: true}
Capybara.default_max_wait_time = 20

poltergeist_options = { js_errors: false,
                        timeout: 45,
                        url_whitelist: ['127.0.0.1'] }

Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(app, poltergeist_options)
end
