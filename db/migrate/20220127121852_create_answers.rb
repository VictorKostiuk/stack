class CreateAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :answers do |t|
      t.text :body
      t.references :question, index: true

      t.timestamps
    end
  end
end
