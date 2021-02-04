require 'test_helper'

class FlashcardsControllerTest < ActionDispatch::IntegrationTest
  test "should get block_id" do
    get flashcards_block_id_url
    assert_response :success
  end

  test "should get question" do
    get flashcards_question_url
    assert_response :success
  end

end
