# spec/views/pages/todo_spec.rb
require 'rails_helper'

RSpec.describe "pages/home.html.erb", type: :view do
  it 'displays the correct heading and paragraph' do
    render

    # Check the h1 element
    expect(rendered).to include('<h1 class="mb-4 mt-7 text-4xl font-extrabold leading-none tracking-tight text-gray-900 md:text-5xl lg:text-6xl dark:text-gray">Do what you got <mark class="px-2 text-white bg-blue-600 rounded dark:bg-gray-800">TODO</mark></h1>')

    # Check the paragraph element
    expect(rendered).to include('<p class="text-lg font-normal text-gray-500 lg:text-xl dark:text-gray-400">Get things done! TODO helps you plan your day, manage your projects, and make progress toward your goals.</p>')
  end
end