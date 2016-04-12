require 'rails_helper'

RSpec.describe UsersController, :type => :controller do
 # #1
   let(:new_user_attributes) do
     {
         name: "BlocHead",
         email: "blochead@bloc.io",
         password: "blochead",
         password_confirmation: "blochead"
     }
   end

   describe "GET new" do
     it "returns http success" do
       get :new
       expect(response).to have_http_status(:success)
    end

    it "instantiates a new user" do
      get :new
      expect(:user).to_not be_nil
    end
  end

  describe "POST create" do
    it "returns an http redirect" do
      post :create, user: new_user_attributes
      expect(response).to have_http_status(:redirect)
    end

    it "creates a new user" do
      expect{
        post :create, user: new_user_attributes
      }.to change(User, :count).by(1)
    end

    it "sets user name properly" do
      post :create, user: new_user_attributes
      expect(assigns(:user).name).to eq new_user_attributes[:name]
    end

    it "sets user email properly" do
      post :create, user: new_user_attributes
      expect(assigns(:user).email).to eq new_user_attributes[:email]
    end

    it "sets user password properly" do
      post :create, user: new_user_attributes
      expect(assigns(:user).password).to eq new_user_attributes[:password]
    end

     it "sets user password_confirmation properly" do
       post :create, user: new_user_attributes
       expect(assigns(:user).password_confirmation).to eq new_user_attributes[:password_confirmation]
     end

    it "logs the user in after sign up" do
      post :create, user: new_user_attributes
      expect(session[:user_id]).to eq assigns(:user).id
    end
  end


  describe "not signed in" do

    let(:factory_user) { create(:user) }

    before do

      post :create, user: new_user_attributes
    end


    it "returns http success" do
      get :show, {id: factory_user.id}
      expect(response).to have_http_status(:success)
    end

    it "renders the #show view" do
      get :show, {id: factory_user.id}
      expect(response).to render_template :show
    end

    it "assigns factory_user to @user" do
      get :show, {id: factory_user.id}
      expect(assigns(:user)).to eq(factory_user)
    end
  end
  describe "POST create" do
    context "with valid attributes" do
      before do

        @new_user =build(:user)
        post :create, user: { name: @new_user.name, email: @new_user.email, password: @new_user.password, role: "admin"}
      end

      it "returns http success" do
        except(response).to have_http_status(:success)
      end
      it "returns json content type" do
        expect(response.content_type).to eq 'application/json'
      end

      it "creates a user with the correct attributes" do
           hashed_json = JSON.parse(response.body)
           expect(hashed_json["name"]).to eq(@new_user.name)
           expect(hashed_json["email"]).to eq(@new_user.email)
           expect(hashed_json["role"]).to eq("admin")
         end
       end


       context "with invalid attributes" do
         before do
           post :create, user: { name: "", email: "bademail@", password: "short" }
         end

         it "returns http error" do
           expect(response).to have_http_status(400)
         end

         it "returns the correct json error message" do
           expect(response.body).to eq({ "error": "User is invalid", "status": 400 }.to_json)
         end
       end
     end
   end
 end
