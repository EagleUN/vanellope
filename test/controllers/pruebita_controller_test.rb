require 'test_helper'

class PruebitaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pruebitum = pruebita(:one)
  end

  test "should get index" do
    get pruebita_url
    assert_response :success
  end

  test "should get new" do
    get new_pruebitum_url
    assert_response :success
  end

  test "should create pruebitum" do
    assert_difference('Pruebitum.count') do
      post pruebita_url, params: { pruebitum: { age: @pruebitum.age, info: @pruebitum.info, name: @pruebitum.name, salary: @pruebitum.salary } }
    end

    assert_redirected_to pruebitum_url(Pruebitum.last)
  end

  test "should show pruebitum" do
    get pruebitum_url(@pruebitum)
    assert_response :success
  end

  test "should get edit" do
    get edit_pruebitum_url(@pruebitum)
    assert_response :success
  end

  test "should update pruebitum" do
    patch pruebitum_url(@pruebitum), params: { pruebitum: { age: @pruebitum.age, info: @pruebitum.info, name: @pruebitum.name, salary: @pruebitum.salary } }
    assert_redirected_to pruebitum_url(@pruebitum)
  end

  test "should destroy pruebitum" do
    assert_difference('Pruebitum.count', -1) do
      delete pruebitum_url(@pruebitum)
    end

    assert_redirected_to pruebita_url
  end
end
