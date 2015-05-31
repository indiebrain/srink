class UrlValidator < ActiveModel::EachValidator

  def validate_each(record, attribute, value)
    uri = parse_uri(value)
    if uri.nil?
      record.errors.add(attribute, :invalid_url, options)
    end
  end

  private
  def parse_uri(url)
    uri = URI.parse(url)
    if uri.scheme && uri.host
      return uri
    end
  rescue URI::InvalidURIError
    nil
  end
end

