require 'rails_helper'

RSpec.describe Task, type: :model do

  let(:user) {User.create!(first_name: 'John', last_name: 'Doe', email: 'john.doe@example.com', password_digest: 'password', avatar: nil)}
  let(:task) {Task.create!(title: 'Valid Title', body: 'Valid body', due_date: '2024-07-02', due_time: '11:11', user: user )}

  context 'validations' do
    
    context 'title validation' do
      it 'is valid with valid attributes' do
        expect(task).to be_valid
      end

      it 'is not valid without a title' do
        task.title = nil
        expect(task).to_not be_valid
        task.title = 'A valid title'
        expect(task).to be_valid
      end

      it 'it is not valid with a title with less than 5 characters  ' do
        task.title = 'ABC'
        expect(task).to_not be_valid
        task.title = 'ABCDE'
        expect(task).to be_valid
      end

      it 'it is not valid with a title with more than 50 characters' do 
        task.title = 'JHCMXvnJonangMXefcPkNDgpacVtSpZAfhqENaHhFHBTysDuDSS' # 51 chars
        expect(task).to_not be_valid
        task.title = 'CMXvnJonangMXefcPkNDgpacVtSpZAfhqENaHhFHBTysDuDSSR' # 50 chars
        expect(task).to be_valid

      end
    end
  end

  it 'it is not valid without a due date' do
    task.due_date = nil
    expect(task).to_not be_valid
    task.due_date = '2024-07-02'
    expect(task).to be_valid
    
  end

  it 'it is not valid without a due time' do
    task.due_time = nil
    expect(task).to_not be_valid
    task.due_time = '11:11'
    expect(task).to be_valid
  end
end
