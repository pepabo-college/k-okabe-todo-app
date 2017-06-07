require 'rails_helper'

RSpec.describe TasksController, type: :controller do
  describe 'GET #new' do
    context 'TODOが作成された時' do
      it 'showに遷移されること' do
        expect(response).to redirect_to(task_path)
      end
    end
  end

  describe 'GET #edit' do
    context 'TODOが更新された時' do
      it 'showに遷移されること' do
        expect(response).to redirect_to(task_path)
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'TODOが削除された時' do
      it 'indexに遷移されること' do
        expect(response).to redirect_to(tasks_path)
      end
    end
  end
end
