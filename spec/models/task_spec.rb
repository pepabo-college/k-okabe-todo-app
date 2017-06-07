require 'rails_helper'

RSpec.describe Task, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  describe 'content' do
    context '空白のとき' do
      it 'valid でないこと' do
        task = Task.new(content: nil)
        task.valid?
        expect(task.errors[:content]).to be_present
      end
    end
  end
end
