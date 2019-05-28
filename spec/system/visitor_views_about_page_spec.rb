require "rails_helper"

RSpec.describe "Visitor views about page", type: :system do

  it "displays the about content" do
    visit("/")

    expect_to_be_viewing_the_about_content
  end

  it "displays the about content when the _about_ navigation item is clicked" do
    visit("/")
    click_link(t("layouts.application.about"))

    expect_to_be_viewing_the_about_content
  end

  def expect_to_be_viewing_the_about_content
    expect(page).
      to have_content(t("pages.about.about_source"))
  end
end
