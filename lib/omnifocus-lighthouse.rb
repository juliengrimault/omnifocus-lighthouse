require "omnifocus-lighthouse/version"

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
  	config = { :api_token => "TOKEN" }

      File.open(path, "w") { |f|
        YAML.dump(config, f)
      }
  end

  def populate_lighthouse_tickets
  	config = load_or_create_config
  	api_token = config[:api_token]

  	projects = fetch_projects(api_token)
  	projects.each do |project|
  		fetch_tickets(project).each do |ticket|
			process_tickets(project, tickets)
  		end
  	end

  end

  def fetch_projects(api_token)
  	nil
  end

  def fetch_tickets(project)
  	nil
  end

  def process_ticket(project, ticket)
  	
  end
end
