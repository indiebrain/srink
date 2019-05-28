require "rails_helper"

RSpec.describe UnknownLink, type: :model do

  describe ".url" do
    it "is a default url" do
      expect(UnknownLink.url).
        to eq("/404.html")
    end
  end
end
