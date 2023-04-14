require "application_system_test_case"

class ContentsTest < ApplicationSystemTestCase
  setup do
    @content = contents(:one)
  end

  test "visiting the index" do
    visit contents_url
    assert_selector "h1", text: "Contents"
  end

  test "should create content" do
    visit contents_url
    click_on "New content"

    fill_in "Business customer subtype", with: @content.business_customer_subtype
    fill_in "Business customer subtype needs", with: @content.business_customer_subtype_needs
    fill_in "Business customer subtype result", with: @content.business_customer_subtype_result
    fill_in "Business ideal customer", with: @content.business_ideal_customer
    fill_in "Business problem solved", with: @content.business_problem_solved
    fill_in "Content topic", with: @content.content_topic
    fill_in "Output language", with: @content.output_language
    fill_in "Topic quantity", with: @content.topic_quantity
    click_on "Create Content"

    assert_text "Content was successfully created"
    click_on "Back"
  end

  test "should update Content" do
    visit content_url(@content)
    click_on "Edit this content", match: :first

    fill_in "Business customer subtype", with: @content.business_customer_subtype
    fill_in "Business customer subtype needs", with: @content.business_customer_subtype_needs
    fill_in "Business customer subtype result", with: @content.business_customer_subtype_result
    fill_in "Business ideal customer", with: @content.business_ideal_customer
    fill_in "Business problem solved", with: @content.business_problem_solved
    fill_in "Content topic", with: @content.content_topic
    fill_in "Output language", with: @content.output_language
    fill_in "Topic quantity", with: @content.topic_quantity
    click_on "Update Content"

    assert_text "Content was successfully updated"
    click_on "Back"
  end

  test "should destroy Content" do
    visit content_url(@content)
    click_on "Destroy this content", match: :first

    assert_text "Content was successfully destroyed"
  end
end
