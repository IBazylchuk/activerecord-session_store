require "active_support/core_ext/module/attribute_accessors"
require 'active_record/session_store/session_record/base_session_concern'
require "thread"

module ActiveRecord
  module SessionStore
    # The default Active Record class.
    class Session < ActiveRecord::Base
      extend ClassMethods
      SEMAPHORE = Mutex.new
      
      include ActiveRecord::SessionStore::SessionRecord::BaseSessionConcern
    end
  end
end

ActionDispatch::Session::ActiveRecordStore.session_class = ActiveRecord::SessionStore::Session
