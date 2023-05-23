require 'capybara/rspec'



Capybara.default_driver = :rack_test



RSpec.configure do |config|
  config.before(:each, type: :system) do |example|
    Capybara.server_port = Rails.application.config.action_mailer.default_url_options[:port]
    Capybara.app_host = "http://localhost:#{Capybara.server_port}"

    driver = if ENV["CHROME"] && example.metadata[:js]
      :selenium_chrome
    elsif example.metadata[:js]
      :selenium_chrome_headless
    else
      :rack_test
    end

    driven_by driver
  end

  config.after(:each) do
    Capybara.use_default_driver
  end
end
