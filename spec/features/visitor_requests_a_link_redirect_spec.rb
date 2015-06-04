require "spec_helper"

feature "Visitor requests a link redirect" do

  scenario "with a valid token" do
    link = create(:link,
                  url: "http://destination.url/",
                  token: "token")

    visit("redirects/token")

    expect(page.current_url).
      to eq("http://destination.url/")
  end
end
