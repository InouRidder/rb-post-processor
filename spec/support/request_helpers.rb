# frozen_string_literal: true

module Requests
  module HeaderHelpers
    def logged_in_headers_for(user)
      {
        'X-User-Email' => user.email,
        'X-User-Token' => user.authentication_token
      }
    end
  end
  module JsonHelpers
    def json
      JSON.parse(response.body)
    end

    def to_hash(body)
      JSON.parse(body)
    end
  end
end

