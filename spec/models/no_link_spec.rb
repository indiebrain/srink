require "rails_helper"

describe NoLink do

  describe "url" do
    it "is a default url" do
      no_link = NoLink.new
      expect(no_link.url).
        to eq("/404.html")
    end
  end
end
