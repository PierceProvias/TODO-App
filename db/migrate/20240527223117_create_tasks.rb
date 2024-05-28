class CreateTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :tasks do |t|
      t.string        :title
      t.text          :body
      t.date          :due_date
      t.time          :due_time
      t.boolean       :completed_task
      t.timestamps
    end
  end
end
