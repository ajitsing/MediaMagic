require 'base64'
require 'open-uri'

module MediaMagic
  module Operations
    #uri can be filename or a url or an image or any other media
    #e.g    '/path/to/file'
    #       'http://url/to/media_file'
    def encode(uri)
      Base64.encode64(open(uri, 'rb') { |f| f.read })
    end

    #encoded_string should be the output of encode method
    #file_name will be the file genrated out of encoded_string
    def decode(encoded_string, file_name)
      decoded_media = Base64.decode64(encoded_string)
      File.open(file_name, 'w+') { |f| f.write decoded_media }
    end
  end
end
