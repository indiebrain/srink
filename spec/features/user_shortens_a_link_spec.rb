require "rails_helper"

feature "User shortens a link" do

  scenario "with a valid url" do
    user = create(:user)
    sign_in_with(user.email,
                 user.password)

    visit("/links/new")
    fill_in(t("links.form.url"),
            with: "http://example.com")
    click_button(t("links.form.submit"))

    link = user.links.first
    expect_link_to_be_shortened(link)
    expect_to_be_on_link_index_page(link)
  end

  scenario "with an invalid url" do
    user = create(:user)
    sign_in_with(user.email,
                 user.password)

    visit("/links/new")
    fill_in(t("links.form.url"),
            with: "invalid-url")
    click_button(t("links.form.submit"))

    expect_page_to_have_invalid_url_notice
  end

  private
  def expect_link_to_be_shortened(link)
    expect(link.token).
      to_not be_nil
  end

  def expect_to_be_on_link_index_page(link)
    expect(page.current_path).
      to eq("/links")
  end

  def expect_page_to_have_invalid_url_notice
    expect(page).
      to have_content(t(:invalid_url, scope: "activerecord.errors.messages"))
  end
end
