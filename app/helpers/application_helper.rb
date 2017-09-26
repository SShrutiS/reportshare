module ApplicationHelper
    
  def all_report
    link_to "Show (#{all_reports.id})", all_report_path
  end
  
  def link(url)
    if url =~ /(png)|(jpg)/
      return "<img class='img-thumbnail' style='width:20px;height:20px;' src='#{url}'>".html_safe
    end

    if url =~ /csv/
      return link_to 'Download File', url
    end

    if url =~ /pdf/
      return link_to 'Download File', url
    end
    
    if url =~ /doc/
      return link_to 'Download File', url
    end
    if url =~ /docx/
      return link_to 'Download File', url
    end
    
    if url =~ /xls/
      return link_to 'Download File', url
    end
    
    if url =~ /xlsx/
      return link_to 'Download File', url
    end
  end

  def file(url)
    if url =~ /(png)|(jpg)/
      return link_to 'Download File', url
    end
    if url =~ /csv/
      return link_to 'Download File', url
    end

    if url =~ /pdf/
      return link_to 'Download File', url
    end
    
    if url =~ /doc/
      return link_to 'Download File', url
    end
    if url =~ /docx/
      return link_to 'Download File', url
    end
    
    if url =~ /xls/
      return link_to 'Download File', url
    end
    
    if url =~ /xlsx/
      return link_to 'Download File', url
    end
  end
end

