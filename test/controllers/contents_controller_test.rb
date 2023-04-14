require "test_helper"

class ContentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @content = contents(:one)
  end

  test "should get index" do
    get contents_url
    assert_response :success
  end

  test "should get new" do
    get new_content_url
    assert_response :success
  end

  test "should create content" do
    assert_difference("Content.count") do
      post contents_url, params: { content: { business_customer_subtype: @content.business_customer_subtype, business_customer_subtype_needs: @content.business_customer_subtype_needs, business_customer_subtype_result: @content.business_customer_subtype_result, business_ideal_customer: @content.business_ideal_customer, business_problem_solved: @content.business_problem_solved, content_topic: @content.content_topic, output_language: @content.output_language, topic_quantity: @content.topic_quantity } }
    end

    assert_redirected_to content_url(Content.last)
  end

  test "should show content" do
    get content_url(@content)
    assert_response :success
  end

  test "should get edit" do
    get edit_content_url(@content)
    assert_response :success
  end

  test "should update content" do
    patch content_url(@content), params: { content: { business_customer_subtype: @content.business_customer_subtype, business_customer_subtype_needs: @content.business_customer_subtype_needs, business_customer_subtype_result: @content.business_customer_subtype_result, business_ideal_customer: @content.business_ideal_customer, business_problem_solved: @content.business_problem_solved, content_topic: @content.content_topic, output_language: @content.output_language, topic_quantity: @content.topic_quantity } }
    assert_redirected_to content_url(@content)
  end

  test "should destroy content" do
    assert_difference("Content.count", -1) do
      delete content_url(@content)
    end

    assert_redirected_to contents_url
  end
end
