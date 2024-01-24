require 'test_helper'
require 'webmock/minitest'

class ApplicationControllerTest < ActionController::TestCase
  setup do
    WebMock.enable!
    WebMock.disable_net_connect!(allow_localhost: true)
    stub_external_apis
    # stub - para no need ng actual network request
  end

  test "should get root page" do
    get :index
    assert_response :success
  end

  test "should get dog facts page" do
    get :dog_facts
    assert_response :success
    assert_includes @response.body, "Mocked dog fact"
  end

  test "should get cat facts page" do
    get :cat_facts
    assert_response :success
    assert_includes @response.body, "Mocked cat fact"
  end

  test "should get useless facts page" do
    get :useless_facts
    assert_response :success
    assert_includes @response.body, "Mocked useless fact"
  end

  test "should get jokes page" do
    get :jokes
    assert_response :success
    assert_includes @response.body, "Mocked joke"
  end

  private

  def stub_external_apis
    stub_request(:get, "https://dogapi.dog/api/v2/facts.json")
      .with(
        headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent'=>'Ruby'
        }
      )
      .to_return(status: 200, body: '{"data":[{"id":"1","type":"fact","attributes":{"body":"Mocked dog fact."}}]}', headers: { 'Content-Type' => 'application/json' })

    stub_request(:get, "https://cat-fact.herokuapp.com/facts")
      .with(
        headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent'=>'Ruby'
        }
      )
      .to_return(status: 200, body: '[{"text": "Mocked cat fact"}]', headers: { 'Content-Type' => 'application/json' })

    stub_request(:get, "https://uselessfacts.jsph.pl/api/v2/facts/random")
      .with(
        headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent'=>'Ruby'
        }
      )
      .to_return(status: 200, body: '{"text": "Mocked useless fact"}', headers: { 'Content-Type' => 'application/json' })


    stub_request(:get, "https://geek-jokes.sameerkumar.website/api?format=json/")
      .with(
        headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent'=>'Ruby'
        }
      )
      .to_return(status: 200, body: '{"joke": "Mocked joke"}', headers: { 'Content-Type' => 'application/json' })
  end
end
