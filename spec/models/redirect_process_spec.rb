require "rails_helper"

RSpec.describe RedirectProcess do
  describe "#call" do
    it "is the link's url when the token belongs to a known link" do
      link = known_link()

      result = described_class.new(link.token).call

      expect(result)
        .to eq(link.url)
    end

    it "is the not found url when the token is unknown" do
      unknown_link = unknown_link()

      result = described_class.new("unknown-token").call

      expect(result).
        to eq(unknown_link.url)
    end

    it "records the visit when the token belongs to a known link" do
      link = known_link()

      described_class.new(link.token).call

      expect(link.visits)
        .to have_received(:create)
    end

    def known_link(url: "known-link-url", token: "known-link-token")
      link = instance_double(
        "Link",
        token: token,
        url: url
      )
      visits = stub_visits(link: link)
      allow(visits).to receive(:create)

      link_class = class_double("Link")
                     .as_stubbed_const
      allow(link_class)
        .to receive(:find_by)
        .with(token: link.token)
        .and_return(link)

      link
    end

    def unknown_link(url: "unknown-link-url")
      class_double("UnknownLink", url: url).as_stubbed_const
    end

    def stub_visits(link:)
     visits_association = instance_double("ActiveRecord::Associations::CollectionProxy")
     allow(link)
       .to receive(:visits)
       .and_return(visits_association)

     visits_association
    end
  end
end
