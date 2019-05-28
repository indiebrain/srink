require "rails_helper"

RSpec.describe Visit, type: :model do
  it "belongs to a link" do
    expect(described_class.new).
      to belong_to(:link)
  end
end
