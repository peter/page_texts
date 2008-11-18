require 'test_helper'

class PageTextsControllerTest < ActionController::TestCase
  def setup
    @page_text = PageText.create!(:key => "about", :body => "This site is about making money")
  end
  
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:page_texts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create page_text" do
    assert_difference('PageText.count') do
      post :create, :page_text => { :key => "foobar", :body => "the body"}
    end

    assert_redirected_to page_text_path(assigns(:page_text))
  end

  test "should show page_text" do
    get :show, :id => @page_text.id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @page_text.id
    assert_response :success
  end

  test "should update page_text" do
    put :update, :id => @page_text.id, :page_text => { :body => "new body"}
    assert_equal "new body", assigns(:page_text).reload.body
    assert_redirected_to page_text_path(assigns(:page_text))
  end

  test "should destroy page_text" do
    assert_difference('PageText.count', -1) do
      delete :destroy, :id => @page_text.id
    end

    assert_redirected_to page_texts_path
  end
end
