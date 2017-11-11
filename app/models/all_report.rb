class AllReport < ApplicationRecord
    establish_connection (:development)
    self.table_name = 'all_reports'
end