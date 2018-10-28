
module Filterable
  extend ActiveSupport::Concern

  module ClassMethods

    def filter(filtering_params)
      results = self.where(nil) # create an anonymous scope
      filtering_params.each do |key, value|
        case key
        when "price"
          results = results.where("#{:price} LIKE '#{value}'")

        else
          results = results.where("#{key} ILIKE '%#{value}%'")
        end



      end
      results
    end
  end
end
