class MdlFile < ApplicationRecord

  self.table_name = "files"
  belongs_to :ressource

end
