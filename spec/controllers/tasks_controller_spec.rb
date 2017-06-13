require 'rails_helper'

describe TasksController do
  describe 'GET #show' do
    it "assings the requested task to @task" do
      task = create(:task)
      get :show, id: task
      expect(assings(:task)).to eq task
    end

    it "renders the :show template" do
      task = create(:task)
      get :show, id: task
      expect(response).to render_template :show
    end
  end
end
