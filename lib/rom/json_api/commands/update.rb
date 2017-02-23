module ROM
  module JsonApi
      module Commands
      class Update < ROM::HTTP::Commands::Update
        adapter :json_api
      end
    end
  end
end
