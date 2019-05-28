require "rails_helper"

RSpec.describe LinkCreateService do

  describe "#create" do
    it "creates a new link when valid attributes are passed" do
      user = create(:user)
      link_attributes = attributes_for(:link)

      service = LinkCreateService.new(user: user,
                                      link_attributes: link_attributes)

      expect {
        service.create
      }.to change {
        user.links.count
      }.by(1)
    end

    it "returns true when the new link is created" do
      user = create(:user)
      link_attributes = attributes_for(:link)

      service = LinkCreateService.new(user: user,
                                      link_attributes: link_attributes)

      expect(service.create).
        to eq(true)
    end

    it "generates a token for the new link" do
      user = create(:user)
      link_attributes = attributes_for(:link)
      service = LinkCreateService.new(user: user,
                                      link_attributes: link_attributes,
                                      token_generator_type: FakeTokenGenerator)
      expected_token = FakeTokenGenerator.new(input: link_attributes[:url]).token

      service.create

      link = user.links.where(url: link_attributes.fetch(:url)).first
      expect(link.token).
        to eq(expected_token)
    end

    it "does not create a new link when invalid attributes are passed" do
      user = create(:user)
      link_attributes = {}
      service = LinkCreateService.new(user: user,
                                      link_attributes: link_attributes)

      expect {
        service.create
      }.to_not change {
        user.links.count
      }
    end

    it "returns false when the new link cannot be created" do
      user = create(:user)
      invalid_link_attributes = {}
      service = LinkCreateService.new(user: user,
                                      link_attributes: invalid_link_attributes)

      expect(service.create).
        to eq(false)
    end
  end

  describe "#link" do
    it "returns the link constructed with the input attributes" do
      user = create(:user)
      link_attributes = attributes_for(:link)
      service = LinkCreateService.new(user: user,
                                      link_attributes: link_attributes)
      link = Link.new(link_attributes.merge(user: user))

      expect(service.link).
        to have_equivalent_attributes(link)
    end
  end

  describe "#error_messages" do
    it "returns a list of error messages when the link described by the input parameters is invalid" do
      user = create(:user)
      invalid_link_attributes = {}
      service = LinkCreateService.new(user: user,
                                      link_attributes: invalid_link_attributes)
      link = service.link
      link.valid?
      expected_error_messages = link.errors.full_messages.join("\n")

      expect(service.error_messages).
        to eq(expected_error_messages)
    end
  end
end
