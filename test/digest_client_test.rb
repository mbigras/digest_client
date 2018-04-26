require 'digest_client'
require 'minitest/autorun'
require 'net/http'
require 'uri'

class DigestClientTest < Minitest::Test
  def test_it_has_a_version
    assert DigestClient::VERSION
  end

  def test_successful_fetch
    goodpw = 'good'

    uri = URI.parse 'http://localhost:8000/'
    uri.user = 'user'
    uri.password = goodpw
    client = Net::HTTP.new uri.host, uri.port
    client.set_debug_output $stderr if ENV['DEBUG']
    request = Net::HTTP::Get.new uri.request_uri
    digest_client = DigestClient.new uri

    response = digest_client.fetch request: request, client: client

    assert_equal '200', response.code
    assert_equal 'You are authenticated', response.body
  end

  def test_unsuccessful_fetch
    goodpw = 'bad'

    uri = URI.parse 'http://localhost:8000/'
    uri.user = 'user'
    uri.password = goodpw
    client = Net::HTTP.new uri.host, uri.port
    client.set_debug_output $stderr if ENV['DEBUG']
    request = Net::HTTP::Get.new uri.request_uri
    digest_client = DigestClient.new uri

    response = digest_client.fetch request: request, client: client
    
    assert_equal '401', response.code
  end
end