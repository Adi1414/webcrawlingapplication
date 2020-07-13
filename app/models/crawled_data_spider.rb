class CrawledDataSpider < Kimurai::Base
  @name = 'vehicles_spider'
  @engine = :mechanize

  def self.process(url,user_id)
    @start_urls = [url]
    @user_id
    self.crawl!
  end

  def parse(response, url:, data: {})

      item = {}
     
    item[:email] = response.xpath('//div[@class="address-container"]/address/a/p').text.squish
    item[:site_name] =  response.css('title')&.text&.squish
    item[:phone_number] = response.xpath('//div[@class="address-container/address/p"]').text.squish
    item[:url] = url
    binding.pry
   # CrawledData.where(item).first_or_create if !item[:site_name].blank?
    
  end
end