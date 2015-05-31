RSpec::Matchers.define :have_equivalent_attributes do |expected|
  match do |actual|
    actual.attributes == expected.attributes
  end
end
