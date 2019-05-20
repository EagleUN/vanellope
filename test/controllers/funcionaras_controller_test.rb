require 'test_helper'

class FuncionarasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @funcionara = funcionaras(:one)
  end

  test "should get index" do
    get funcionaras_url
    assert_response :success
  end

  test "should get new" do
    get new_funcionara_url
    assert_response :success
  end

  test "should create funcionara" do
    assert_difference('Funcionara.count') do
      post funcionaras_url, params: { funcionara: { info: @funcionara.info, name: @funcionara.name } }
    end

    assert_redirected_to funcionara_url(Funcionara.last)
  end

  test "should show funcionara" do
    get funcionara_url(@funcionara)
    assert_response :success
  end

  test "should get edit" do
    get edit_funcionara_url(@funcionara)
    assert_response :success
  end

  test "should update funcionara" do
    patch funcionara_url(@funcionara), params: { funcionara: { info: @funcionara.info, name: @funcionara.name } }
    assert_redirected_to funcionara_url(@funcionara)
  end

  test "should destroy funcionara" do
    assert_difference('Funcionara.count', -1) do
      delete funcionara_url(@funcionara)
    end

    assert_redirected_to funcionaras_url
  end
end
