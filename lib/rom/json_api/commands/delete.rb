module ROM
  module JsonApi
      module Commands
      class Delete < ROM::HTTP::Commands::Delete
        adapter :json_api
      end
    end
  end
end
