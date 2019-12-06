class <%= migration_class_name %> < ActiveRecord::Migration<%= migration_version %>
  def change
    create_table :<%= session_table_name %> do |t|
      t.string :session_id, :null => false
      t.text :data
      t.timestamps
    end

    add_index :<%= session_table_name %>, :session_id, :unique => true
    add_index :<%= session_table_name %>, :updated_at

    if ActionDispatch::Session::ActiveRecordStore.enable_bot_sessions
      create_table :<%= bot_session_table_name %> do |t|
        t.string :session_id, :null => false
        t.text :data
        t.timestamps
      end

      add_index :<%= bot_session_table_name %>, :session_id, :unique => true
      add_index :<%= bot_session_table_name %>, :updated_at
    end
  end
end
