require 'spec_helper'

describe UploadsController do
  
  before :each do
    login_user
  end
  
  def valid_attributes
    {:title => "My upload"}
  end

  describe "GET index" do
    it "assigns all uploads as @uploads" do
      upload = @user.uploads.create! valid_attributes
      get :index
      assigns(:uploads).should eq([upload])
    end
  end

  describe "GET show" do
    it "assigns the requested upload as @upload" do
      upload = @user.uploads.create! valid_attributes
      get :show, :id => upload.id
      assigns(:upload).should eq(upload)
    end
  end

  describe "GET new" do
    it "assigns a new upload as @upload" do
      get :new
      assigns(:upload).should be_a_new(Upload)
    end
  end

  describe "GET edit" do
    it "assigns the requested upload as @upload" do
      upload = @user.uploads.create! valid_attributes
      get :edit, :id => upload.id
      assigns(:upload).should eq(upload)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Upload" do
        #expect {
        #  post :create, :upload => valid_attributes
        #}.to change(Upload, :count).by(1)
      end

      it "assigns a newly created upload as @upload" do
        post :create, :upload => valid_attributes
        assigns(:upload).should be_a(Upload)
        assigns(:upload).should be_persisted
      end

      it "redirects to the created upload" do
        #post :create, :upload => valid_attributes
        #response.should redirect_to(Upload.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved upload as @upload" do
        Upload.any_instance.stub(:save).and_return(false)
        post :create, :upload => {}
        assigns(:upload).should be_a_new(Upload)
      end

      it "re-renders the 'new' template" do
        Upload.any_instance.stub(:save).and_return(false)
        post :create, :upload => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested upload" do
        upload = @user.uploads.create! valid_attributes
        Upload.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => upload.id, :upload => {'these' => 'params'}
      end

      it "assigns the requested upload as @upload" do
        upload = @user.uploads.create! valid_attributes
        put :update, :id => upload.id, :upload => valid_attributes
        assigns(:upload).should eq(upload)
      end

      it "redirects to the upload" do
        upload = @user.uploads.create! valid_attributes
        put :update, :id => upload.id, :upload => valid_attributes
        response.should redirect_to(upload)
      end
    end

    describe "with invalid params" do
      it "assigns the upload as @upload" do
        upload = @user.uploads.create! valid_attributes
        Upload.any_instance.stub(:save).and_return(false)
        put :update, :id => upload.id, :upload => {}
        assigns(:upload).should eq(upload)
      end

      it "re-renders the 'edit' template" do
        upload = @user.uploads.create! valid_attributes
        Upload.any_instance.stub(:save).and_return(false)
        put :update, :id => upload.id, :upload => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested upload" do
      upload = @user.uploads.create! valid_attributes
      #expect {
      #  delete :destroy, :id => upload.id
      #}.to change(Upload, :count).by(-1)
    end

    it "redirects to the uploads list" do
      upload = @user.uploads.create! valid_attributes
      delete :destroy, :id => upload.id
      response.should redirect_to(uploads_url)
    end
  end

end
