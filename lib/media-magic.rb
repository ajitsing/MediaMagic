require 'base64'

module MediaMagic
  module Operations
    def encode(uri)
      Base64.encode64(open(uri, 'rb') { |f| f.read })
    end

    def decode(encoded_string, file_name)
      decoded_media = Base64.decode64(encoded_string)
      File.open(file_name, 'w+') { |f| f.write decoded_media }
    end
  end
end
