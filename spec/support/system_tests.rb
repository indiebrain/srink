require_relative "./features/clearance_helpers.rb"

RSpec.configure do |config|
  config.before(:each, type: :system) do
    driven_by :rack_test
  end

  config.include Features::ClearanceHelpers
end
