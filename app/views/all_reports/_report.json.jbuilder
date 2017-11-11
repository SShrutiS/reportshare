json.extract! all_report, :id, :name, :yrmnth, :azure, :link, :approval, :comment, :created_at, :updated_at
json.url all_report_url(all_report, format: :json)