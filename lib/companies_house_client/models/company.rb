module CompaniesHouseClient
  class Company < Base
    has_one :registered_office_address, path: "/registered-office-address"
    has_many :officers, path: "/officers"
    has_many :filing_histories, path: "/filing-history"
    has_many :appointments, path: "/appointments"
    has_many :charges, path: "/charges"
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