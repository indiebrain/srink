require_relative "./features/clearance_helpers.rb"

RSpec.configure do |config|
  config.include Features::ClearanceHelpers
end
