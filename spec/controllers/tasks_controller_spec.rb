require 'rails_helper'

describe TasksController do

  describe 'GET #show' do
    it "@taskに要求したタスクを割り当てること" do
      task = create(:task)
      get :show, params: {id: task.id}
      expect(assigns(:task)).to eq task
    end

    it "show.html.erbテンプレートが表示されること" do
      task = create(:task)
      get :show, params: {id: task.id}
      expect(response).to render_template :show
    end
  end

  describe 'GET #index' do
    it "@taskに要求したタスクを割り当てること" do
      task = create(:task)
      get :index
      expect(assigns(:tasks)).to eq([task])
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

    it "new.html.erbテンプレートが表示されること" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    it "@taskに要求したタスクを割り当てること" do
      task = create(:task)
      get :index, params: {id: task.id}
      expect(assigns(:tasks)).to eq([task])
    end

    it "edit.html.erbテンプレートが表示されること" do
      task = create(:task)
      get :edit, params: {id: task.id}
      expect(response).to render_template :edit
    end
  end

end
