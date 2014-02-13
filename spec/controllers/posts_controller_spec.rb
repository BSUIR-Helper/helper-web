require 'spec_helper'

describe PostsController do
  before do
    @discipline = Discipline.create!(:name => 'Chemistry')
  end

  let(:valid_attributes) { { :title => 'The title', :discipline_id => @discipline.id } }
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all posts as @posts" do
      post = Post.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:posts)).to eq([post])
    end
  end

  describe "GET show" do
    it "assigns the requested post as @post" do
      post = Post.create! valid_attributes
      get :show, {:id => post.to_param}, valid_session
      expect(assigns(:post)).to eq(post)
    end
  end

  describe "GET new" do
    before { sign_in Fabricate(:user) }

    it "assigns a new post as @post" do
      get :new, {}, valid_session
      expect(assigns(:post)).to be_a_new(Post)
    end

    it "assigns all disciplines as @disciplines" do
      get :new, {}, valid_session
      expect(assigns(:disciplines)).to eq([@discipline])
    end
  end

  describe "GET edit" do
    before do
      sign_in Fabricate(:admin)
      @post = Post.create! valid_attributes
      get :edit, {:id => @post.to_param}, valid_session
    end

    it "assigns the requested post as @post" do
      expect(assigns(:post)).to eq(@post)
    end

    it "assigns all disciplines as @disciplines" do
      expect(assigns(:disciplines)).to eq([@discipline])
    end
  end

  describe "POST create" do
    let(:user) { Fabricate(:user) }

    before { sign_in user }

    describe "with valid params" do
      it "creates a new Post" do
        expect {
          post :create, {:post => valid_attributes}, valid_session
        }.to change(Post, :count).by(1)
      end

      it "sets current user as author" do
        post :create, {:post => valid_attributes}, valid_session
        expect(Post.last.author).to eq(user)
      end

      it "assigns a newly created post as @post" do
        post :create, {:post => valid_attributes}, valid_session
        expect(assigns(:post)).to be_a(Post)
        expect(assigns(:post)).to be_persisted
      end

      it "assigns all disciplines as @disciplines" do
        post :create, {:post => valid_attributes}, valid_session
        expect(assigns(:disciplines)).to eq([@discipline])
      end

      it "redirects to the created post" do
        post :create, {:post => valid_attributes}, valid_session
        expect(response).to redirect_to(Post.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved post as @post" do
        post :create, {:post => { :title => '' }}, valid_session
        expect(assigns(:post)).to be_a_new(Post)
      end

      it "assigns all disciplines as @disciplines" do
        post :create, {:post => { :title => '' }}, valid_session
        expect(assigns(:disciplines)).to eq([@discipline])
      end

      it "re-renders the 'new' template" do
        post :create, {:post => { :title => '' }}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    before { sign_in Fabricate(:admin) }

    describe "with valid params" do
      it "updates the requested post" do
        post = Post.create! valid_attributes
        # Assuming there are no other posts in the database, this
        # specifies that the Post created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Post.any_instance.should_receive(:update).with({ "title" => "MyString" })
        put :update, {:id => post.to_param, :post => { "title" => "MyString" }}, valid_session
      end

      it "assigns the requested post as @post" do
        post = Post.create! valid_attributes
        put :update, {:id => post.to_param, :post => valid_attributes}, valid_session
        expect(assigns(:post)).to eq(post)
      end

      it "assigns all disciplines as @disciplines" do
        post = Post.create! valid_attributes
        put :update, {:id => post.to_param, :post => valid_attributes}, valid_session
        expect(assigns(:disciplines)).to eq([@discipline])
      end

      it "redirects to the post" do
        post = Post.create! valid_attributes
        put :update, {:id => post.to_param, :post => valid_attributes}, valid_session
        expect(response).to redirect_to(post)
      end

      it "doesn't change the author" do
        author = Fabricate(:user)
        post = Post.create! valid_attributes
        post.author = author
        post.save!
        put :update, {:id => post.to_param, :post => valid_attributes}, valid_session
        expect(Post.last.author).to eq(author)
      end
    end

    describe "with invalid params" do
      before do
        @post = Post.create! valid_attributes
        put :update, {:id => @post.to_param, :post => { :title => '' }}, valid_session
      end

      it "assigns the post as @post" do
        expect(assigns(:post)).to eq(@post)
      end

      it "assigns disciplines as @disciplines" do
        expect(assigns(:disciplines)).to eq([@discipline])
      end

      it "re-renders the 'edit' template" do
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    before { sign_in Fabricate(:admin) }

    it "destroys the requested post" do
      post = Post.create! valid_attributes
      expect {
        delete :destroy, {:id => post.to_param}, valid_session
      }.to change(Post, :count).by(-1)
    end

    it "redirects to the posts list" do
      post = Post.create! valid_attributes
      delete :destroy, {:id => post.to_param}, valid_session
      expect(response).to redirect_to(posts_url)
    end
  end

end
