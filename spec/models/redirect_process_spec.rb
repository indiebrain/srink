require "rails_helper"

describe RedirectProcess do
  describe "#call" do
    it "is the URL associated with the token when a link exists for the token" do
      token = "link-token"
      link = known_link(url: "link-url", token: token)

      result = described_class.new(token).call

      expect(result)
        .to eq(link.url)
    end

    it "is the unknown URL when the link cannot be found" do
      unknown_link = unknown_link(url: "unknown-url")

      result = described_class.new("unknown-token").call

      expect(result).
        to eq(unknown_link.url)
    end

    def known_link(url:, token:)
      link = instance_double(
        "Link",
        token: token,
        url: url
      )

      link_class = class_double("Link")
                     .as_stubbed_const
      allow(link_class)
        .to receive(:find_by)
        .with(token: link.token)
        .and_return(link)

      link
    end

    def unknown_link(url:)
      unknown_link = instance_double("NoLink", url: "unknown-url")
      class_double("NoLink", new: unknown_link).as_stubbed_const

      unknown_link
    end
  end
end
