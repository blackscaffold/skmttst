require 'test_helper'

class ApiSamplesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_sample = api_samples(:one)
  end

  test "should get index" do
    get api_samples_url
    assert_response :success
  end

  test "should get new" do
    get new_api_sample_url
    assert_response :success
  end

  test "should create api_sample" do
    assert_difference('ApiSample.count') do
      post api_samples_url, params: { api_sample: { body: @api_sample.body, uri: @api_sample.uri } }
    end

    assert_redirected_to api_sample_url(ApiSample.last)
  end

  test "should show api_sample" do
    get api_sample_url(@api_sample)
    assert_response :success
  end

  test "should get edit" do
    get edit_api_sample_url(@api_sample)
    assert_response :success
  end

  test "should update api_sample" do
    patch api_sample_url(@api_sample), params: { api_sample: { body: @api_sample.body, uri: @api_sample.uri } }
    assert_redirected_to api_sample_url(@api_sample)
  end

  test "should destroy api_sample" do
    assert_difference('ApiSample.count', -1) do
      delete api_sample_url(@api_sample)
    end

    assert_redirected_to api_samples_url
  end
end
