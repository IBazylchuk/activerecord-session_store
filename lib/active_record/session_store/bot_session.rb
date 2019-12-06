require "active_support/core_ext/module/attribute_accessors"
require "thread"

module ActiveRecord
  module SessionStore
    # The default Active Record class.
    class BotSession < Session
      self.table_name = 'bot_sessions'
      self.primary_key = :id
    end
  end
end

ActionDispatch::Session::ActiveRecordStore.bot_session_class = ActiveRecord::SessionStore::BotSession
