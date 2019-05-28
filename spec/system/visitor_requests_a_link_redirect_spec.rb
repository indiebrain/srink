require "rails_helper"

RSpec.describe "Visitor requests a link redirect", type: :system do

  it "redirects with a valid token" do
    link = create(:link,
                  url: "http://destination.url/",
                  token: "token")

    visit("/r/token")

    expect(page.current_url).
      to eq("http://destination.url/")
  end
end
