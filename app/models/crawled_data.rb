class CrawledData < ApplicationRecord

def self.to_csv
    attributes = %w{site_name url email phone_number created_at}

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |crawl|
        csv << attributes.map{ |attr| crawl.send(attr) }
      end
    end
  end

end	