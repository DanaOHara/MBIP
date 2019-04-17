class User < ApplicationRecord


   self.table_name = "user"
   has_many :events


end
