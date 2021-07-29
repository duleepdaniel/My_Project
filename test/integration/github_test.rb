require 'test_helper'

class GithubTest < ActionDispatch::IntegrationTest
  # Internal Testing
  def test_valid_user
    get '/projects', params: {username: 'duleepdaniel'}
    assert 200, status
  end

  def test_invalid_user
    get '/projects', params: {username: 'duleepdani'}
    assert 404, status
  end

end
