#!/usr/bin/ruby
require 'yaml'

dbase = {} 
{
    'adapter' => 'DB_ADAPTER',
    'database' => 'DB_NAME',
    'host' => 'DB_HOST',
    'username' => 'DB_USERNAME',
    'password' => 'DB_PASSWORD',
    'encoding' => 'DB_ENCODING'
}.each do |k,v|
  if ENV[v] 
    dbase[k] = ENV[v]
  end
end
a = { 'production' => dbase }.to_yaml
print a
