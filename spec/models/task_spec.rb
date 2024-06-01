require 'rails_helper'

RSpec.describe Task, type: :model do
  
  fixtures :tasks
  
  it 'has a title' do
    task = tasks(:no_title)
    expect(task).to_not be_valid
    task.title = 'A valid title'
    expect(task).to be_valid
  end

  it 'has a title of at least 5 characters long ' do
    task = tasks(:no_title)
    task.title = 'ABC'
    expect(task).to_not be_valid
    task.title = 'ABCDE'
    expect(task).to be_valid
  end

  it 'has a title of at most 50 characters long' do 
    task = tasks(:no_title)
    task.title = 'A'
    expect(task).to_not be_valid
    task.title = 'CMXvnJonangMXefcPkNDgpacVtSpZAfhqENaHhFHBTysDuDSSR'
    expect(task).to be_valid
  end

  it 'has a due date' do
    task = tasks(:no_date)  
    expect(task).to_not be_valid
    task.due_date = '2024-07-02'
    expect(task).to be_valid
    expect(task.due_date.strftime('%F')).to eql "2024-07-02"
  end

  
end
