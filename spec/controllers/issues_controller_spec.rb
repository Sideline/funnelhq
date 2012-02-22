require 'spec_helper'

describe IssuesController do
  
  before :each do
    login_user
  end

  def valid_attributes
    {:title => "Website issue", 
     :description => "The website doesn't work!",
     :status => "open", 
     :project_title => "Project 1"}
  end

  describe "GET index" do
    it "assigns all issues as @issues" do
      issue = @user.issues.create! valid_attributes
      get :index
      assigns(:issues).should eq([issue])
    end
  end

  describe "GET show" do
    it "assigns the requested issue as @issue" do
      issue = @user.issues.create! valid_attributes
      get :show, :id => issue.id
      assigns(:issue).should eq(issue)
    end
  end

  describe "GET new" do
    it "assigns a new issue as @issue" do
      get :new
      assigns(:issue).should be_a_new(Issue)
    end
  end

  describe "GET edit" do
    it "assigns the requested issue as @issue" do
      issue = @user.issues.create! valid_attributes
      get :edit, :id => issue.id
      assigns(:issue).should eq(issue)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Issue" do
       
      end

      it "assigns a newly created issue as @issue" do
        post :create, :issue => valid_attributes
        assigns(:issue).should be_a(Issue)
        assigns(:issue).should be_persisted
      end

      it "redirects to the created issue" do
        
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved issue as @issue" do
        # Trigger the behavior that occurs when invalid params are submitted
        @user.issues.any_instance.stub(:save).and_return(false)
        post :create, :issue => {}
        assigns(:issue).should be_a_new(Issue)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        @user.issues.any_instance.stub(:save).and_return(false)
        post :create, :issue => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested issue" do
        issue = @user.issues.create! valid_attributes
        @user.issues.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => issue.id, :issue => {'these' => 'params'}
      end

      it "assigns the requested issue as @issue" do
        issue = @user.issues.create! valid_attributes
        put :update, :id => issue.id, :issue => valid_attributes
        assigns(:issue).should eq(issue)
      end

      it "redirects to the issue" do
        issue = @user.issues.create! valid_attributes
        put :update, :id => issue.id, :issue => valid_attributes
        response.should redirect_to(issue)
      end
    end

    describe "with invalid params" do
      it "assigns the issue as @issue" do
        issue = @user.issues.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        @user.issues.any_instance.stub(:save).and_return(false)
        put :update, :id => issue.id, :issue => {}
        assigns(:issue).should eq(issue)
      end

      it "re-renders the 'edit' template" do
        issue = @user.issues.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        @user.issues.any_instance.stub(:save).and_return(false)
        put :update, :id => issue.id, :issue => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested issue" do
      issue = @user.issues.create! valid_attributes
    end

    it "redirects to the issues list" do
      issue = @user.issues.create! valid_attributes
      delete :destroy, :id => issue.id
      response.should redirect_to(issues_url)
    end
  end

end
