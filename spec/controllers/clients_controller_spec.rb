require 'spec_helper'

describe ClientsController do

  before :each do
    login_user
  end
  
  def valid_attributes
    {:first_name => 'Venetian', :last_name => 'Snares', :email => 'vsnares@gmail.com', :telephone => '01234567891'}
  end

  describe "GET index" do
    it "assigns all clients as @clients" do
      client = @user.clients.create! valid_attributes
      get :index
      assigns(:clients).should eq([client])
    end
  end

  describe "GET show" do
    it "assigns the requested client as @client" do
      client = @user.clients.create! valid_attributes
      get :show, :id => client.id
      assigns(:client).should eq(client)
    end
  end

  describe "GET new" do
    it "assigns a new client as @client" do
      get :new
      assigns(:client).should be_a_new(Client)
    end
  end

  describe "GET edit" do
    it "assigns the requested client as @client" do
      client = @user.clients.create! valid_attributes
      get :edit, :id => client.id
      assigns(:client).should eq(client)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Client" do
      end

      it "assigns a newly created client as @client" do
        post :create, :client => valid_attributes
        assigns(:client).should be_a(Client)
        assigns(:client).should be_persisted
      end

      it "redirects to the created client" do
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved client as @client" do   
        Client.any_instance.stub(:save).and_return(false)
        post :create, :client => {}
        assigns(:client).should be_a_new(Client)
      end

      it "re-renders the 'new' template" do
        Client.any_instance.stub(:save).and_return(false)
        post :create, :client => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested client" do
        client = @user.clients.create! valid_attributes
        Client.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => client.id, :client => {'these' => 'params'}
      end

      it "assigns the requested client as @client" do
        client = @user.clients.create! valid_attributes
        put :update, :id => client.id, :client => valid_attributes
        assigns(:client).should eq(client)
      end

      it "redirects to the client" do
        client = @user.clients.create! valid_attributes
        put :update, :id => client.id, :client => valid_attributes
        response.should redirect_to(client)
      end
    end

    describe "with invalid params" do
      it "assigns the client as @client" do
        client = @user.clients.create! valid_attributes 
        Client.any_instance.stub(:save).and_return(false)
        put :update, :id => client.id, :client => {}
        assigns(:client).should eq(client)
      end

      it "re-renders the 'edit' template" do
        client = @user.clients.create! valid_attributes     
        Client.any_instance.stub(:save).and_return(false)
        put :update, :id => client.id, :client => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested client" do
      client = @user.clients.create! valid_attributes
    end

    it "redirects to the clients list" do
      client = @user.clients.create! valid_attributes
      delete :destroy, :id => client.id
      response.should redirect_to(clients_url)
    end
  end

end
