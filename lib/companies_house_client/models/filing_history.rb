module CompaniesHouseClient
  class FilingHistory < Base
    belongs_to :company, path: "/company/:id"
    primary_key :transaction_id
    collection_path "/company/:company_id/filing-history"

    def url(format='pdf')
      file_path = self['links']['self']
      document_path = "#{file_path}/document?format=#{format}"

      "#{CompaniesHouseClient::DOCUMENT_URL}#{document_path}"
    end
  end
end
