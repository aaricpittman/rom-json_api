module ROM
  module JsonApi
      module Commands
      class Create < ROM::HTTP::Commands::Create
        adapter :json_api
      end
    end
  end
end
