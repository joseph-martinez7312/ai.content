require "test_helper"

class ContentTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @content_type = content_types(:one)
  end

  test "should get index" do
    get content_types_url
    assert_response :success
  end

  test "should get new" do
    get new_content_type_url
    assert_response :success
  end

  test "should create content_type" do
    assert_difference("ContentType.count") do
      post content_types_url, params: { content_type: { content_type: @content_type.content_type, description: @content_type.description, template: @content_type.template } }
    end

    assert_redirected_to content_type_url(ContentType.last)
  end

  test "should show content_type" do
    get content_type_url(@content_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_content_type_url(@content_type)
    assert_response :success
  end

  test "should update content_type" do
    patch content_type_url(@content_type), params: { content_type: { content_type: @content_type.content_type, description: @content_type.description, template: @content_type.template } }
    assert_redirected_to content_type_url(@content_type)
  end

  test "should destroy content_type" do
    assert_difference("ContentType.count", -1) do
      delete content_type_url(@content_type)
    end

    assert_redirected_to content_types_url
  end
end
