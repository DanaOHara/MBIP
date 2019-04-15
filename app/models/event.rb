class Event < ApplicationRecord

  self.table_name = "event"
  belongs_to :user 

end
