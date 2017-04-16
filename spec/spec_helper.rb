# require 'spec_helper'
require 'bundler'
require 'bundler/setup'
require 'pathname'
Bundler.require(:test, :default)
Dir[Pathname.pwd.join('quiz/*.rb')].each { |f| require f }
RSpec.configure do |config|

end
