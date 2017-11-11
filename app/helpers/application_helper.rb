require   'uri'
module ApplicationHelper


  def all_report
    link_to "Show (#{all_reports.id})", all_report_path
  end
  
  def valid_url?(url)
    uri = URI.parse(url)
    uri.is_a?(URI::HTTP) && !uri.host.nil?
  rescue URI::InvalidURIError
    false
  end

  def link(url)
    if valid_url?(url)
      return link_to "Report link", url, target: :_blank 
    end
    #  if url =~ /\A#{URI::regexp(['http', 'https'])}\z/
    #   return link_to 'Link', url
    # end
    # if url =~ /csv/
    #   return link_to 'Download File', url
    # end

    # if url =~ /pdf/
    #   return link_to 'Download File', url
    # end
    
    # if url =~ /doc/
    #   return link_to 'Download File', url
    # end
    # if url =~ /docx/
    #   return link_to 'Download File', url
    # end
    
    # if url =~ /xls/
    #   return link_to 'Download File', url
    # end
    
    # if url =~ /xlsx/
    #   return link_to 'Download File', url
    # end
  end

  def file(url)
    if url =~ /(png)|(jpg)/
      return link_to 'Download File', url, target: :_blank
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

