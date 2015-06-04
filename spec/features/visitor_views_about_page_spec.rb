require "rails_helper"

feature "Visitor views about page" do

  scenario "as default path" do
    visit("/")

    expect_to_be_viewing_the_about_content
  end

  scenario "when the _about_ navigation item is clicked" do
    visit("/")
    click_link(t("layouts.application.about"))

    expect_to_be_viewing_the_about_content
  end

  def expect_to_be_viewing_the_about_content
    expect(page).
      to have_content(t("pages.about.about_source"))
  end
end
