require 'net/http'

module BuildPack
  class Downloader
    # MYSQL_BASE_URL = "http://security.debian.org/pool/updates/main/m/mysql-5.5/"
    # MYSQL_BASE_URL = "http://security.ubuntu.com/ubuntu/pool/main/m/mysql-8.0/"
    MYSQL_BASE_URL = "http://security.ubuntu.com/ubuntu/pool/main/m/mysql-5.5/"

    # example client: ""
    # REGEX = /.*(mysql-client-8\.0_8\.0\.18-0ubuntu\d_amd64.deb).*/
    CLIENT = "mysql-client-5.5_5.5.62-0ubuntu0.14.04.1_amd64.deb"
    
    class << self
      def download_latest_lib_to(path)
        File.open(path, 'w+').write(Net::HTTP.get(URI.parse("#{MYSQL_BASE_URL}libmysqlclient21_8.0.18-0ubuntu4_i386.deb")))
      end
      
      def download_latest_client_to(path)
        Logger.log_header("Downloading MySQL Client package")

        File.open(path, 'w+').write(Net::HTTP.get(URI.parse("#{MYSQL_BASE_URL}#{CLIENT}")))
      end
    end
  end
end
