require "omnifocus-lighthouse/version"
require "yaml"
require 'lighthouse-api'

module Omnifocus::Lighthouse
  PREFIX  = "LH"

  def load_or_create_config
    path   = File.expand_path "~/.omnifocus-lighthouse.yml"
    config = YAML.load(File.read(path)) rescue nil

    unless config then
      create_config_file(path)
      abort "Created default config in #{path}. Go fill it out."
    end

    config
  end

  def create_config_file(path)
  	config = { :account => "ACCOUNT", 
               :api_token => "TOKEN"
              }

      File.open(path, "w") { |f|
        YAML.dump(config, f)
      }
  end

  def populate_lighthouse_tickets
  	config = load_or_create_config
    Lighthouse.account = config[:account]
  	Lighthouse.token = config[:api_token]

  	projects = Project.find(:all)
  	projects.each do |project|
      project.tickets.each do |ticket|
        process_tickets(project, ticket)
  		end
  	end

  end

  def process_ticket(project, ticket)
  	
  end
end
