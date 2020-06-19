# frozen_string_literal: true

RippleToken::Client.configure do |c|
  c.base_url = ENV.fetch('KEYCLOAK_BASE_URL')
  c.realm = ENV.fetch('KEYCLOAK_REALM')
  c.public_key_ttl = ENV.fetch('KEYCLOAK_PUBLIC_KEY_TTL', 86_400)
  c.public_paths = {
    get: [],
    post: [],
    put: [],
    patch: [],
    delete: []
  }
end
