RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
  config.before(:suite) do
    begin
      DatabaseCleaner.strategy = :truncation
      DatabaseCleaner.clean_with(:truncation)
      FactoryGirl.lint
    ensure
      DatabaseCleaner.clean
    end
  end
  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end
  config.after(:each) do
    Capybara.reset_session!
  end
end
