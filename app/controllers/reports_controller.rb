class ReportsController <ApplicationController
    require 'tiny_tds' 
    def index
        
# binding.pry   
#     print 'test' 
      
#     client = TinyTds::Report.connection
#     results = client.sp_execute_sql("select SLS_PROC_WRK_DT, COMPANY_CODE, sum(WAC) WAC, sum(SDC) SDC, sum(sls_amt) SALES from dbo.SALES_TRENDS c group by SLS_PROC_WRK_DT, COMPANY_CODE order by SLS_PROC_WRK_DT")
#     #  EXEC sp_executesql N'SELECT  [users].* FROM [users] WHERE [users].[id] = @0  ORDER BY [users].[id] ASC OFFSET 0 ROWS FETCH NEXT @1 ROWS ONLY', N'@0 bigint, @1 int', @0 = 8, @1 = 1  [["id", nil], ["LIMIT", nil]]

#     binding.pry 
#     results.each do |row|  
#         binding.pry 
#         puts row  
#     end

@sales = Report.all.order('SLS_PROC_WRK_DT DESC')
@sales = Report.select(:SLS_PROC_WRK_DT,:COMPANY_CODE,"SUM(WAC) AS WAC"  , "SUM(SDC) AS SDC", "SUM(SF) AS SF","SUM(SSF) AS SSF", "SUM(SLS_QTY) AS QTY","SUM(SLS_AMT) AS SALES").group(:SLS_PROC_WRK_DT,:COMPANY_CODE)
        respond_to do |format|
            format.html
            format.xlsx {
                response.headers['Content-Disposition'] = 'attachment; filename="all_products.xlsx"'
            }
        end    
    end    
end