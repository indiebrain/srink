require "rails_helper"

RSpec.feature "User view a list of links", type: :feature do

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

  scenario "user wants to creates a new link" do
    sign_in
    visit("/links")
    click_link(t("links.index.new_link"))

    expect(page.current_path).
      to eq(new_link_path)
  end

  scenario "user wants to delete a link" do
    user = create(:user)
    link = create(:link,
                  user: user,
                  url: "http://destination.url",
                  token: "token")
    sign_in_with(user.email,
                 user.password)

    visit("/links")

    within("#link-#{link.id}") do
      click_button("Delete")
    end

    expect(page).
      to have_content(t("links.delete.deleted_link", url: link.url))
  end

  private

  def expect_page_to_have_link(link)
    within("#link-#{link.id}") do
      expect(page).
        to have_content(link.url)

      expect(page).
        to have_content(redirect_url(link.token))

      expect(page).
        to have_content(link.visits.size)
    end
  end
end
