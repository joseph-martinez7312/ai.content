require "application_system_test_case"

class ContentTypesTest < ApplicationSystemTestCase
  setup do
    @content_type = content_types(:one)
  end

  test "visiting the index" do
    visit content_types_url
    assert_selector "h1", text: "Content types"
  end

  test "should create content type" do
    visit content_types_url
    click_on "New content type"

    fill_in "Content type", with: @content_type.content_type
    fill_in "Description", with: @content_type.description
    fill_in "Template", with: @content_type.template
    click_on "Create Content type"

    assert_text "Content type was successfully created"
    click_on "Back"
  end

  test "should update Content type" do
    visit content_type_url(@content_type)
    click_on "Edit this content type", match: :first

    fill_in "Content type", with: @content_type.content_type
    fill_in "Description", with: @content_type.description
    fill_in "Template", with: @content_type.template
    click_on "Update Content type"

    assert_text "Content type was successfully updated"
    click_on "Back"
  end

  test "should destroy Content type" do
    visit content_type_url(@content_type)
    click_on "Destroy this content type", match: :first

    assert_text "Content type was successfully destroyed"
  end
end
