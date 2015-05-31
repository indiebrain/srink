require "rails_helper"

describe UrlValidator do

  it "is valid when the url has a protocol, host" do
    expect_url_to_be_valid("http://example")
  end

  it "is valid when the url has a subdomain" do
    expect_url_to_be_valid("http://subdomain.example.com")
  end

  it "is valid when the url has query string parameters" do
    expect_url_to_be_valid("http://example.com?parameter=true")
  end

  it "is invalid when the url is missing a protocol" do
    expect_url_to_be_invalid("example.com")
  end

  it "is invalid when the url is missing a host" do
    expect_url_to_be_invalid("http://")
  end

  def expect_url_to_be_valid(url)
    link = Link.new(url: url)
    options = {attributes: :url}
    validator = UrlValidator.new(options)

    validator.validate_each(link, :url, link.url)

    expect(link).
      to be_valid
  end

  def expect_url_to_be_invalid(url)
    link = Link.new(url: url)
    options = {attributes: :url}
    validator = UrlValidator.new(options)

    validator.validate_each(link, :url, link.url)

    expect(link).
      to be_invalid

    expect(link.errors[:url]).
      to include(t(:invalid_url, scope: "activerecord.errors.messages"))
  end
end
