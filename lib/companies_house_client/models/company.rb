module CompaniesHouseClient
  class Company < Base
    has_many :officers
    collection_path "/company"
    primary_key :company_number

    def self.search(term, per_page: nil, start: nil)
      get("/search",{q: term, items_per_page: per_page, start_index: start})
    end

    def name
      company_name
    end

    def number
      company_number
    end

    def active?
      company_status == "active"
    end

    def dissolved?
      !active?
    end
  end
end