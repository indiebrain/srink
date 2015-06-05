require "rails_helper"

describe RedirectService do
  it "redirects to the target url when the provided token is valid" do
    link = create(:link)
    service = RedirectService.new(link.token)

    expect(service.url).
      to eq(link.url)
  end

  it "redirects to the 404 page when the provided token is invalud" do
    service = RedirectService.new("invalid-token")

    expect(service.url).
      to eq("/404.html")
  end
end
