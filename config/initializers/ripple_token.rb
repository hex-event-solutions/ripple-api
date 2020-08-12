# frozen_string_literal: true

if Rails.env != 'test'
  RippleToken::Client.configure do |c|
    c.base_url = ENV.fetch('KEYCLOAK_BASE_URL')
    c.realm = ENV.fetch('KEYCLOAK_REALM')
    c.public_key_ttl = ENV.fetch('KEYCLOAK_PUBLIC_KEY_TTL', 86_400)
    c.public_paths = {
      'GET' => [%r{/website}, %r{/probe}],
      'POST' => [%r{/graphql}],
      put: [],
      patch: [],
      delete: []
    }
  end
end
