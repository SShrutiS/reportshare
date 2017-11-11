class UploadImagesJob < ApplicationJob
  queue_as :default

  def perform(*args)
    name, yrmnth, link, orig, token, path, content_type, approval, comment = args
    Azure::Storage.setup(:storage_account_name => 'ssdiskstorage', :storage_access_key => 'Zt004mLtFx8YhYg5eNCrzLPlhx0OWWU3U6TLc/8svhT2/kv2Nw5dk1mUyJfGigZsXZecozZrSIOFzj3+iqHFFw==')
    blob = Azure::Storage::Blob::BlobService.new
    binary = ::File.open(path, 'rb'){|file| file.read}
    host = 'https://ssdiskstorage.blob.core.windows.net/rubyuploads'
    relative = "#{token}/#{orig}"
    absolute = "#{host}/#{relative}"
    blob.create_block_blob('rubyuploads', relative, binary, {content_type: content_type})
    ap AllReport.create!(name: name, yrmnth: yrmnth, link: link, azure: absolute, approval: approval, comment: comment)
  end
end
