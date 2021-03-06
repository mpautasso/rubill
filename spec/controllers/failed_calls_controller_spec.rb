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

describe FailedCallsController do

  # This should return the minimal set of attributes required to create a valid
  # FailedCall. As you add validations to FailedCall, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end

  describe "GET index" do
    it "assigns all failed_calls as @failed_calls" do
      failed_call = FailedCall.create! valid_attributes
      get :index
      assigns(:failed_calls).should eq([failed_call])
    end
  end

  describe "GET show" do
    it "assigns the requested failed_call as @failed_call" do
      failed_call = FailedCall.create! valid_attributes
      get :show, :id => failed_call.id.to_s
      assigns(:failed_call).should eq(failed_call)
    end
  end

  describe "GET new" do
    it "assigns a new failed_call as @failed_call" do
      get :new
      assigns(:failed_call).should be_a_new(FailedCall)
    end
  end

  describe "GET edit" do
    it "assigns the requested failed_call as @failed_call" do
      failed_call = FailedCall.create! valid_attributes
      get :edit, :id => failed_call.id.to_s
      assigns(:failed_call).should eq(failed_call)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new FailedCall" do
        expect {
          post :create, :failed_call => valid_attributes
        }.to change(FailedCall, :count).by(1)
      end

      it "assigns a newly created failed_call as @failed_call" do
        post :create, :failed_call => valid_attributes
        assigns(:failed_call).should be_a(FailedCall)
        assigns(:failed_call).should be_persisted
      end

      it "redirects to the created failed_call" do
        post :create, :failed_call => valid_attributes
        response.should redirect_to(FailedCall.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved failed_call as @failed_call" do
        # Trigger the behavior that occurs when invalid params are submitted
        FailedCall.any_instance.stub(:save).and_return(false)
        post :create, :failed_call => {}
        assigns(:failed_call).should be_a_new(FailedCall)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        FailedCall.any_instance.stub(:save).and_return(false)
        post :create, :failed_call => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested failed_call" do
        failed_call = FailedCall.create! valid_attributes
        # Assuming there are no other failed_calls in the database, this
        # specifies that the FailedCall created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        FailedCall.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => failed_call.id, :failed_call => {'these' => 'params'}
      end

      it "assigns the requested failed_call as @failed_call" do
        failed_call = FailedCall.create! valid_attributes
        put :update, :id => failed_call.id, :failed_call => valid_attributes
        assigns(:failed_call).should eq(failed_call)
      end

      it "redirects to the failed_call" do
        failed_call = FailedCall.create! valid_attributes
        put :update, :id => failed_call.id, :failed_call => valid_attributes
        response.should redirect_to(failed_call)
      end
    end

    describe "with invalid params" do
      it "assigns the failed_call as @failed_call" do
        failed_call = FailedCall.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        FailedCall.any_instance.stub(:save).and_return(false)
        put :update, :id => failed_call.id.to_s, :failed_call => {}
        assigns(:failed_call).should eq(failed_call)
      end

      it "re-renders the 'edit' template" do
        failed_call = FailedCall.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        FailedCall.any_instance.stub(:save).and_return(false)
        put :update, :id => failed_call.id.to_s, :failed_call => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested failed_call" do
      failed_call = FailedCall.create! valid_attributes
      expect {
        delete :destroy, :id => failed_call.id.to_s
      }.to change(FailedCall, :count).by(-1)
    end

    it "redirects to the failed_calls list" do
      failed_call = FailedCall.create! valid_attributes
      delete :destroy, :id => failed_call.id.to_s
      response.should redirect_to(failed_calls_url)
    end
  end

end
