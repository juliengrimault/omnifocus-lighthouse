require 'yaml'
require 'lighthouse-api'

module OmniFocus::Lighthouse
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
               :api_token => "TOKEN",
               :queries => {:projectId => ["responsible:me state:open sort:priority milestone:next"] }
              }

      File.open(path, "w") { |f|
        YAML.dump(config, f)
      }
  end

  def populate_lighthouse_tasks
  	config = load_or_create_config
    Lighthouse.account = config[:account]
  	Lighthouse.token = config[:api_token]
    queries = config[:queries]

    queries.each do |project_id, queries|
      project = Lighthouse::Project.find(project_id)
      process_project(project, queries)
    end
  end

  def process_project(project, queries)
     queries.each do |query|
        tickets = project.tickets( :q => query)
        tickets.each do |ticket|
          process_ticket(project, ticket)
        end
      end
  end

  def process_ticket(project, ticket)
  	ticket_id = "#{PREFIX}##{ticket.id}"

    if existing[ticket_id]
      of_project = existing[ticket_id]
      bug_db[of_project][ticket_id] = true
    else
      description = "#{ticket.latest_body}\n\n--------------------------------------------------------\n#{ticket.url}"
      of_project = "#{project.name}"

      bug_db[of_project][ticket_id] = ["#{ticket_id}: #{ticket.title}", description]
    end
  end
end
