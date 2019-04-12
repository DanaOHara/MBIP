class Resource < ApplicationRecord

 self.table_name = "resource"

 has_many :MdlFile

end
