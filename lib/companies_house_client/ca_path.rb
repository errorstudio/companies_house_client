require 'rbconfig'
module CompaniesHouseClient
  class CAPath
    class << self
      def platform_path
        case RbConfig::CONFIG['host_os']
          when /linux|arch/i
            "/usr/lib/ssl"
          when /darwin/i
            "/System/Library/OpenSSL"
        end
      end
    end
  end
end