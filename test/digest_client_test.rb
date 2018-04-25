require 'digest_client'
require 'minitest/autorun'

class DigestClientTest < Minitest::Test
  def test_it_has_a_version
    assert DigestClient::VERSION
  end
end