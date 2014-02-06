require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe DisciplinesController do

  # This should return the minimal set of attributes required to create a valid
  # Discipline. As you add validations to Discipline, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "name" => "MyString" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # DisciplinesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all disciplines as @disciplines" do
      discipline = Discipline.create! valid_attributes
      get :index, {}, valid_session
      assigns(:disciplines).should eq([discipline])
    end
  end

  describe "GET show" do
    it "assigns the requested discipline as @discipline" do
      discipline = Discipline.create! valid_attributes
      get :show, {:id => discipline.to_param}, valid_session
      assigns(:discipline).should eq(discipline)
    end
  end

  describe "GET new" do
    before { sign_in Fabricate(:admin) }

    it "assigns a new discipline as @discipline" do
      get :new, {}, valid_session
      expect(response.status).to eq(200)
      assigns(:discipline).should be_a_new(Discipline)
    end
  end

  describe "GET edit" do
    before { sign_in Fabricate(:admin) }

    it "assigns the requested discipline as @discipline" do
      discipline = Discipline.create! valid_attributes
      get :edit, {:id => discipline.to_param}, valid_session
      assigns(:discipline).should eq(discipline)
      expect(response.status).to eq(200)
    end
  end

  describe "POST create" do
    before { sign_in Fabricate(:admin) }

    describe "with valid params" do
      it "creates a new Discipline" do
        expect {
          post :create, {:discipline => valid_attributes}, valid_session
        }.to change(Discipline, :count).by(1)
      end

      it "assigns a newly created discipline as @discipline" do
        post :create, {:discipline => valid_attributes}, valid_session
        assigns(:discipline).should be_a(Discipline)
        assigns(:discipline).should be_persisted
      end

      it "redirects to the created discipline" do
        post :create, {:discipline => valid_attributes}, valid_session
        response.should redirect_to(Discipline.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved discipline as @discipline" do
        # Trigger the behavior that occurs when invalid params are submitted
        Discipline.any_instance.stub(:save).and_return(false)
        post :create, {:discipline => { "name" => "invalid value" }}, valid_session
        assigns(:discipline).should be_a_new(Discipline)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Discipline.any_instance.stub(:save).and_return(false)
        post :create, {:discipline => { "name" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    before { sign_in Fabricate(:admin) }

    describe "with valid params" do
      it "updates the requested discipline" do
        discipline = Discipline.create! valid_attributes
        # Assuming there are no other disciplines in the database, this
        # specifies that the Discipline created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Discipline.any_instance.should_receive(:update).with({ "name" => "MyString" })
        put :update, {:id => discipline.to_param, :discipline => { "name" => "MyString" }}, valid_session
      end

      it "assigns the requested discipline as @discipline" do
        discipline = Discipline.create! valid_attributes
        put :update, {:id => discipline.to_param, :discipline => valid_attributes}, valid_session
        assigns(:discipline).should eq(discipline)
      end

      it "redirects to the discipline" do
        discipline = Discipline.create! valid_attributes
        put :update, {:id => discipline.to_param, :discipline => valid_attributes}, valid_session
        response.should redirect_to(discipline)
      end
    end

    describe "with invalid params" do
      it "assigns the discipline as @discipline" do
        discipline = Discipline.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Discipline.any_instance.stub(:save).and_return(false)
        put :update, {:id => discipline.to_param, :discipline => { "name" => "invalid value" }}, valid_session
        assigns(:discipline).should eq(discipline)
      end

      it "re-renders the 'edit' template" do
        discipline = Discipline.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Discipline.any_instance.stub(:save).and_return(false)
        put :update, {:id => discipline.to_param, :discipline => { "name" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    before { sign_in Fabricate(:admin) }

    it "destroys the requested discipline" do
      discipline = Discipline.create! valid_attributes
      expect {
        delete :destroy, {:id => discipline.to_param}, valid_session
      }.to change(Discipline, :count).by(-1)
    end

    it "redirects to the disciplines list" do
      discipline = Discipline.create! valid_attributes
      delete :destroy, {:id => discipline.to_param}, valid_session
      response.should redirect_to(disciplines_url)
    end
  end

end
