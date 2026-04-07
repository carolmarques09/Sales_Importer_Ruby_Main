require './app/services/file_parser'

class ImportSales
  def self.call(file)
    total = 0

    FileParser.call(file) do |row|
      purchaser = Purchaser.find_or_create_by!(name: row['purchaser name'])

      merchant = Merchant.find_or_create_by!(
        name: row['merchant name'],
        address: row['merchant address']
      )

      item = Item.find_or_create_by!(
        description: row['item description'],
        price: row['item price']
      )

      purchase = Purchase.create!(
        purchaser: purchaser,
        merchant: merchant,
        item: item,
        purchase_count: row['purchase count']
      )

      total += item.price.to_f * purchase.purchase_count.to_i
    end

    total
  end
end
