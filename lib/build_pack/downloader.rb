require 'net/http'

module BuildPack
  class Downloader

    MYSQL_BASE_URL = "http://security.ubuntu.com/ubuntu/pool/main/m/mysql-5.5/"
    CLIENT = "mysql-client-5.5_5.5.62-0ubuntu0.14.04.1_amd64.deb"
    
    class << self
      def download_latest_lib_to(path)
        Logger.log_header("Downloading MySQL Lib package to: #{path}")
        File.open(path, 'w+').write(Net::HTTP.get(URI.parse("#{MYSQL_BASE_URL}libmysqlclient18_5.5.62-0ubuntu0.14.04.1_amd64.deb")))
      end
      
      def download_latest_client_to(path)
        Logger.log_header("Downloading MySQL Client package to: #{path}")

        File.open(path, 'w+').write(Net::HTTP.get(URI.parse("#{MYSQL_BASE_URL}#{CLIENT}")))
      end
    end
  end
end
