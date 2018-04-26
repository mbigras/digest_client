require 'net/http'
require 'net/http/digest_auth'

class DigestClient
  VERSION = '0.1.0'
  
  attr_reader :uri

  def initialize uri
    @uri = uri
  end

  def fetch request:, client:
    challenge = client.request request
    if challenge.code == '401'
      auth_header = Net::HTTP::DigestAuth.new.auth_header uri, challenge['www-authenticate'], request.method
      request.add_field 'Authorization', auth_header
      client.request request
    else
      challenge
    end
  end
end