module CompaniesHouseClient
  class Company < Base
    has_many :officers
    collection_path "/company"
    primary_key :company_number

    def name
      company_name
    end

    def number
      company_number
    end
  end
end