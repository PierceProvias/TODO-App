require 'rails_helper'

#need to fix this spec

RSpec.describe "tasks/index", type: :view do

  fixtures :tasks
 
  before(:each) do 
    assign(:posts, [tasks[:homework], tasks(:project)])
  end
  

  it 'renders a list of tasks' do
    task = tasks(:homework)
    task2 = tasks(:project)
  
    render
    assert_select 'ul>li', text: 'Valid Title'.to_s, count: 2
    assert_select 'ul>li', text: 'Valid description of task'.to_s, count: 2
    assert_select 'ul>li', text: "2024-07-02".to_s, count: 2
    
  end

end