class ReportsController <ApplicationController
    def index
        @sales = Report.all.order('sls_id DESC')
        respond_to do |format|
            format.html
            format.xlsx {
                response.headers['Content-Disposition'] = 'attachment; filename="all_products.xlsx"'
            }
        end    
    end    
end