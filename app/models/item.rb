class Item < ApplicationRecord
    belongs_to :list


    def self.for_date(date)
        where("DATE(event_at)=?", date)
    end

end
