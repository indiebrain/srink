require "rails_helper"

RSpec.feature "Visitor requests a link redirect" do

  scenario "with a valid token" do
    link = create(:link,
                  url: "http://destination.url/",
                  token: "token")

    visit("/r/token")

    expect(page.current_url).
      to eq("http://destination.url/")
  end
end
