$:.unshift File.dirname(File.expand_path(__FILE__))

require 'active_support'
require 'active_support/core_ext/hash'

module WootSync
  extend ActiveSupport::Autoload

  autoload :Client
  autoload :Railtie
  autoload :Sale
  autoload :Shop
  autoload :VERSION

  include ActiveSupport::Configurable

  # Pretend like this is a Class when Rails checks to see if it's superclass
  # has any inheritable configuration options.
  def self.superclass; Object; end

  config_accessor :logger

  class Exception < StandardError; end
end

WootSync::Railtie.load_settings!
WS = WootSync
