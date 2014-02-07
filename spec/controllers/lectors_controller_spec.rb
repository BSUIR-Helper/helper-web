require 'spec_helper'

describe LectorsController do
  let(:valid_attributes) { { :name => 'Albert Einstein' } }
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all lectors as @lectors" do
      lector = Lector.create! valid_attributes
      get :index, {}, valid_session

      expect(assigns(:lectors)).to eq([lector])
    end
  end

  describe "GET show" do
    it "assigns the requested lector as @lector" do
      lector = Lector.create! valid_attributes
      get :show, {:id => lector.to_param}, valid_session

      expect(assigns(:lector)).to eq(lector)
    end
  end

  describe "GET new" do
    before { sign_in Fabricate(:admin) }

    it "assigns a new lector as @lector" do
      get :new, {}, valid_session
      expect(response.status).to eq(200)
      expect(assigns(:lector)).to be_a_new(Lector)
    end
  end

  describe "GET edit" do
    before { sign_in Fabricate(:admin) }

    it "assigns the requested lector as @lector" do
      lector = Lector.create! valid_attributes
      get :edit, {:id => lector.to_param}, valid_session
      expect(response.status).to eq(200)
      expect(assigns(:lector)).to eq(lector)
    end
  end

  describe "POST create" do
    before { sign_in Fabricate(:admin) }

    describe "with valid params" do
      it "creates a new Lector" do
        expect {
          post :create, {:lector => valid_attributes}, valid_session
        }.to change(Lector, :count).by(1)
      end

      it "assigns a newly created lector as @lector" do
        post :create, {:lector => valid_attributes}, valid_session
        expect(assigns(:lector)).to be_a(Lector)
        expect(assigns(:lector)).to be_persisted
      end

      it "redirects to the created lector" do
        post :create, {:lector => valid_attributes}, valid_session
        expect(response).to redirect_to(Lector.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved lector as @lector" do
        # Trigger the behavior that occurs when invalid params are submitted
        Lector.any_instance.stub(:save).and_return(false)
        post :create, {:lector => { "name" => "invalid value" }}, valid_session
        expect(assigns(:lector)).to be_a_new(Lector)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Lector.any_instance.stub(:save).and_return(false)
        post :create, {:lector => { "name" => "invalid value" }}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    before { sign_in Fabricate(:admin) }

    describe "with valid params" do
      it "updates the requested lector" do
        lector = Lector.create! valid_attributes
        # Assuming there are no other lectors in the database, this
        # specifies that the Lector created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Lector.any_instance.should_receive(:update).with({ "name" => "MyString" })
        put :update, {:id => lector.to_param, :lector => { "name" => "MyString" }}, valid_session
      end

      it "assigns the requested lector as @lector" do
        lector = Lector.create! valid_attributes
        put :update, {:id => lector.to_param, :lector => valid_attributes}, valid_session
        expect(assigns(:lector)).to eq(lector)
      end

      it "redirects to the lector" do
        lector = Lector.create! valid_attributes
        put :update, {:id => lector.to_param, :lector => valid_attributes}, valid_session
        expect(response).to redirect_to(lector)
      end
    end

    describe "with invalid params" do
      it "assigns the lector as @lector" do
        lector = Lector.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Lector.any_instance.stub(:save).and_return(false)
        put :update, {:id => lector.to_param, :lector => { "name" => "invalid value" }}, valid_session
        expect(assigns(:lector)).to eq(lector)
      end

      it "re-renders the 'edit' template" do
        lector = Lector.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Lector.any_instance.stub(:save).and_return(false)
        put :update, {:id => lector.to_param, :lector => { "name" => "invalid value" }}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    before { sign_in Fabricate(:admin) }

    it "destroys the requested lector" do
      lector = Lector.create! valid_attributes
      expect {
        delete :destroy, {:id => lector.to_param}, valid_session
      }.to change(Lector, :count).by(-1)
    end

    it "redirects to the lectors list" do
      lector = Lector.create! valid_attributes
      delete :destroy, {:id => lector.to_param}, valid_session
      expect(response).to redirect_to(lectors_url)
    end
  end

end
