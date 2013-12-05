current_dir = File.dirname(__FILE__)
user = ENV['OPSCODE_USER'] || ENV['USER']
orgname = ENV['ORGNAME'] || ENV['USER']

node_name                user
client_key               "#{ENV['HOME']}/.chef/#{user}.pem"
validation_client_name   "#{orgname}-validator"
validation_key           "#{ENV['HOME']}/.chef/#{orgname}-validator.pem"
chef_server_url          "https://api.opscode.com/organizations/#{orgname}"
syntax_check_cache_path  "#{ENV['HOME']}/.chef/syntax_check_cache"
cookbook_path            ["#{current_dir}/../cookbooks"]

cookbook_copyright "James Walker"
cookbook_license "apachev2"
cookbook_email "walkah@walkah.net"

# Amazon AWS
knife[:aws_access_key_id] = ENV['AWS_ACCESS_KEY_ID']
knife[:aws_secret_access_key] = ENV['AWS_SECRET_ACCESS_KEY']

# Digital Ocean
knife[:digital_ocean_client_id] = ENV['DIGITAL_OCEAN_CLIENT_ID']
knife[:digital_ocean_api_key]   = ENV['DIGITAL_OCEAN_API_KEY']
