FactoryBot.define do
  factory :link do
    user { nil }
    url { "http://example.com" }
    token { SHA1TokenService.new(input: url).token }
  end
end
