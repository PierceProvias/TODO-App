# spec/views/tasks/index.html.erb_spec.rb

require 'rails_helper'

RSpec.describe "tasks/index.html.erb", type: :view do
  let(:task) { double('Task', title: 'Test Task', body: 'This is a test task body', due_date: due_date, due_time: due_time) }
  let(:due_date) { Date.today }
  let(:due_time) { Time.now + 1.hour }

  before do
    allow(view).to receive(:current_page?).with(tasks_path).and_return(true)
    assign(:tasks, [task])
    render
  end

  context 'when current page is tasks_path' do
    it 'renders the task title' do
      expect(rendered).to have_css('h3', text: 'Test Task')
    end

    it 'renders the task body' do
      expect(rendered).to have_css('p', text: 'This is a test task body')
    end

    context 'when the task is active' do
      let(:due_date) { Date.today + 1.day }
      
      it 'shows the status as Active' do
        expect(rendered).to have_css('p', text: 'Status: Active')
      end
    end

    context 'when the task is inactive' do
      let(:due_date) { Date.today - 1.day }
      
      it 'shows the status as Inactive' do
        expect(rendered).to have_css('p', text: 'Status: Inactive')
      end
    end

    context 'when the task is due today' do
      let(:due_date) { Date.today }
      
      context 'and the current time is before the due time' do
        let(:due_time) { Time.now + 1.hour }
        
        it 'shows the status as Active' do
          expect(rendered).to have_css('p', text: 'Status: Active')
        end
      end

      context 'and the current time is after the due time' do
        let(:due_time) { Time.now - 1.hour }
        
        it 'shows the status as Inactive' do
          expect(rendered).to have_css('p', text: 'Status: Inactive')
        end
      end
    end
  end
end