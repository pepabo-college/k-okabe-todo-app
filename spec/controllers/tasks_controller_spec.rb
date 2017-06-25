require 'rails_helper'

describe TasksController do

  describe 'GET #show' do
    let(:task) { create(:task) }

    it "@taskに要求したタスクを割り当てること" do
      get :show, params: {id: task.id}
      expect(assigns(:task)).to eq task
    end

    it 'リクエストは200 OKとなること' do
      get :show, params: {id: task.id}
      expect(response.status).to eq 200
    end

    it "showテンプレートが表示されること" do
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

    it 'リクエストは200 OKとなること' do
      get :index
      expect(response.status).to eq 200
    end

    it "indexテンプレートが表示されること" do
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

    it "newテンプレートが表示されること" do
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

    it "editテンプレートが表示されること" do
      get :edit, params: {id: task.id}
      expect(response).to render_template :edit
    end
  end

  describe 'POST #create' do
    context '有効な属性の場合' do
      it 'データベースに新しいタスクを保存' do
        expect{
          process :create, method: :post,
            params: { task: attributes_for(:task_params) }
        }.to change(Task, :count).by(1)
      end

      it 'リクエストは302 リダイレクトとなること' do
        process :create, method: :post,
          params: { task: attributes_for(:task_params) }
        expect(response.status).to eq 302
      end

      it "showページにリダイレクト" do
        process :create, method: :post,
          params: { task: attributes_for(:task_params) }
        expect(response).to redirect_to task_path(assigns[:task])
      end
    end

    context '無効な属性の場合' do
      it 'データベースに新しいタスクを保存しない' do
        expect{
          process :create, method: :post,
            params: { task: attributes_for(:invalid_task_params) }
        }.not_to change(Task, :count)
      end

      it 'リクエストは200 OKとなること' do
        process :create, method: :post,
          params: { task: attributes_for(:invalid_task_params) }
        expect(response.status).to eq 200
      end

      it 'newテンプレートを再表示する' do
        process :create, method: :post,
          params: { task: attributes_for(:invalid_task_params) }
        expect(response).to render_template :new
      end
    end
  end

  describe 'PATCH #update' do
    before :each do
      @task = create(:task,
        content: '99:テストTODO',
        status: 1
      )
    end

    context '有効な属性の場合' do
      it '要求された@taskを取得する' do
        process :update, method: :patch,
          params: { id: @task.id, task: attributes_for(:task_params) }
        expect(assigns(:task)).to eq(@task)
      end

      it '@taskの属性を変更する' do
        process :update, method: :patch,
          params: {
            id: @task.id,
            task: attributes_for(:task_params, content: '100:テストTODO', status: 'done') }
        @task.reload
        expect(@task.content).to eq '100:テストTODO'
        expect(@task.status).to eq 'done'
      end

      it 'リクエストは302 リダイレクトとなること' do
        process :update, method: :patch,
          params: { id: @task.id, task: attributes_for(:task_params) }
        expect(response.status).to eq 302
      end

      it 'showページにリダイレクト' do
        process :update, method: :patch,
          params: { id: @task.id, task: attributes_for(:task_params) }
        expect(response).to redirect_to task_path(assigns[:task])
      end
    end

    context '無効な属性の場合' do
      it 'ユーザーの属性を変更しない' do
        process :update, method: :patch,
          params: {
            id: @task.id,
            task: attributes_for(:invalid_task_params) }
        @task.reload
        expect(@task.content).not_to eq nil
        expect(@task.content).to eq '99:テストTODO'
      end

      it 'リクエストは200 OKになること' do
        process :update, method: :patch,
          params: {
            id: @task.id,
            task: attributes_for(:invalid_task_params) }
        expect(response.status).to eq 200
      end

      it 'editテンプレートを再表示する' do
        process :update, method: :patch,
          params: {
            id: @task.id,
            task: attributes_for(:invalid_task_params) }
        expect(response).to render_template :edit
      end
    end
  end

end
