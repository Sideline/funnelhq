require 'spec_helper'

describe TasksController do
  
  before :each do
    login_user
  end
  
  def valid_attributes
    {:title => "My task"}
  end

  describe "GET index" do
    it "assigns all tasks as @tasks" do
      task = @user.tasks.create! valid_attributes
      get :index
      assigns(:tasks).should eq([task])
    end
  end

  describe "GET show" do
    it "assigns the requested task as @task" do
      task = @user.tasks.create! valid_attributes
      get :show, :id => task.id
      assigns(:task).should eq(task)
    end
  end

  describe "GET new" do
    it "assigns a new task as @task" do
      get :new
      assigns(:task).should be_a_new(Task)
    end
  end

  describe "GET edit" do
    it "assigns the requested task as @task" do
      task = @user.tasks.create! valid_attributes
      get :edit, :id => task.id
      assigns(:task).should eq(task)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Task" do
      end

      it "assigns a newly created task as @task" do
        post :create, :task => valid_attributes
        assigns(:task).should be_a(Task)
        assigns(:task).should be_persisted
      end

      it "redirects to the created task" do

      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved task as @task" do
        Task.any_instance.stub(:save).and_return(false)
        post :create, :task => {}
        assigns(:task).should be_a_new(Task)
      end

      it "re-renders the 'new' template" do
        Task.any_instance.stub(:save).and_return(false)
        post :create, :task => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested task" do
        task = @user.tasks.create! valid_attributes
        Task.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => task.id, :task => {'these' => 'params'}
      end

      it "assigns the requested task as @task" do
        task = @user.tasks.create! valid_attributes
        put :update, :id => task.id, :task => valid_attributes
        assigns(:task).should eq(task)
      end

      it "redirects to the task" do
        task = @user.tasks.create! valid_attributes
        put :update, :id => task.id, :task => valid_attributes
        response.should redirect_to(task)
      end
    end

    describe "with invalid params" do
      it "assigns the task as @task" do
        task = @user.tasks.create! valid_attributes
        Task.any_instance.stub(:save).and_return(false)
        put :update, :id => task.id, :task => {}
        assigns(:task).should eq(task)
      end

      it "re-renders the 'edit' template" do
        task = @user.tasks.create! valid_attributes
        Task.any_instance.stub(:save).and_return(false)
        put :update, :id => task.id, :task => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested task" do
    end

    it "redirects to the tasks list" do
      task = @user.tasks.create! valid_attributes
      delete :destroy, :id => task.id
      response.should redirect_to(tasks_url)
    end
  end

end