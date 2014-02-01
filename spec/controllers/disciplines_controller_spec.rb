require 'spec_helper'

describe DisciplinesController do
  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response.status).to eq(200)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    it "loads all of the disciplines into @disciplines" do
      discipline1, discipline2 = Discipline.create!(name: 'Math'), Discipline.create!(name: 'Chemistry')
      get :index

      expect(assigns(:disciplines)).to match_array([discipline1, discipline2])
    end
  end

  describe "GET #new" do
    it "responds successfully with an HTTP 200 status code" do
      get :new
      expect(response).to be_success
      expect(response.status).to eq(200)
    end

    it "renders the new template" do
      get :new
      expect(response).to render_template("new")
    end
  end

end


class DisciplinesControllerTest < ActionController::TestCase
  test "should create discipline" do
    assert_difference('Discipline.count') do
      post :create, discipline: { abbr: @discipline.abbr, name: @discipline.name }
    end

    assert_redirected_to discipline_path(assigns(:discipline))
  end

  test "should show discipline" do
    get :show, id: @discipline
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @discipline
    assert_response :success
  end

  test "should update discipline" do
    patch :update, id: @discipline, discipline: { abbr: @discipline.abbr, name: @discipline.name }
    assert_redirected_to discipline_path(assigns(:discipline))
  end

  test "should destroy discipline" do
    assert_difference('Discipline.count', -1) do
      delete :destroy, id: @discipline
    end

    assert_redirected_to disciplines_path
  end
end
