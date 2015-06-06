require "rails_helper"

describe RedirectsController do

  describe "GET #show" do
    it "redirects to the destination url when a link with the given token is found" do
      link = create(:link,
                    url: "http://example.destination.url",
                    token: "token")

      get(:show,
          token: link.token)

      expect(response).
        to redirect_to(link.url)
    end

    it "redirects to a not found page when a link is not found for the given token" do

      get(:show,
          token: 'invalid-token')

      expect(response).
        to redirect_to("/404.html")
    end
  end
end
