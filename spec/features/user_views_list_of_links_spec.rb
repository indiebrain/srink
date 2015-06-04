require "rails_helper"

feature "User view a list of links" do

  scenario "when the user has at last one link" do
    user = create(:user)
    link = create(:link,
                  user: user,
                  url: "http://destination.url",
                  token: "token")
    sign_in_with(user.email,
                 user.password)

    visit("/links")

    expect_page_to_have_link(link)
  end

  private
  def expect_page_to_have_link(link)
    within("#link-#{link.id}") do
      expect(page).
        to have_content(link.url)

      expect(page).
        to have_content(redirect_url(link.token))
    end
  end
end
