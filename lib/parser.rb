require 'csv'

class Parser
  def self.parse(file_path)
    data = []

    CSV.foreach(file_path, headers: true) do |row|
      data << {
        purchaser_name: row['purchaser name'],
        item_description: row['item description'],
        item_price: row['item price'].to_f,
        purchase_count: row['purchase count'].to_i,
        merchant_address: row['merchant address'],
        merchant_name: row['merchant name']
      }
    end

    data
  end
end
