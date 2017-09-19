class Report < ActiveRecord::Base
    establish_connection (:development)
    self.table_name = 'sales_txn'
end