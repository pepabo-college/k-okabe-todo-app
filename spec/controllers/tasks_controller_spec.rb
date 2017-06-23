require 'rails_helper'

describe TasksController do

  describe 'GET #show' do
    let(:task) { create(:task) }

    it "@taskに要求したタスクを割り当てること" do
      get :show, params: {id: task.id}
      expect(assigns(:task)).to eq task
    end

    it 'リクエストは200 OKとなること'  do
      get :show, params: {id: task.id}
      expect(response.status).to eq 200
    end

    it "show.html.erbテンプレートが表示されること" do
      get :show, params: {id: task.id}
      expect(response).to render_template :show
    end
  end

  describe 'GET #index' do

    it "@tasksに要求したタスクを割り当てること" do
      task1 = create(:task)
      task2 = create(:task)
      get :index
      expect(assigns(:tasks)).to match_array([task1, task2])
    end

    it 'リクエストは200 OKとなること'  do
      get :index
      expect(response.status).to eq 200
    end

    it "index.html.erbテンプレートが表示されること" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'GET #new' do

    it "@taskに要求したタスクを割り当てること" do
      get :new
      expect(assigns(:task)).to be_a_new(Task)
    end

    it 'リクエストは200 OKとなること' do
      get :new
      expect(response.status).to eq 200
    end

    it "new.html.erbテンプレートが表示されること" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    let(:task) { create(:task) }

    it "@taskに要求したタスクを割り当てること" do
      get :edit, params: {id: task.id}
      expect(assigns(:task)).to eq(task)
    end

    it 'リクエストは200 OKとなること' do
      get :edit, params: {id: task.id}
      expect(response.status).to eq 200
    end

    it "edit.html.erbテンプレートが表示されること" do
      get :edit, params: {id: task.id}
      expect(response).to render_template :edit
    end
  end

end
