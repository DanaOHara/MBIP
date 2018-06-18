class Forum < ApplicationRecord

  self.table_name = "forum"
  self.inheritance_column = :_type_disabled

end
