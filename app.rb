require "sinatra"
require "csv"
require "active_record"

require_relative "config/database"
require_relative "app/models/init"

get "/" do
  <<-HTML
    <h1>Upload CSV</h1>
    <form action="/import" method="post" enctype="multipart/form-data">
      <input type="file" name="file">
      <button type="submit">Upload</button>
    </form>
  HTML
end

post "/import" do
  halt 400, "No file uploaded" unless params[:file]

  file = params[:file][:tempfile]

  total = 0.0

  ActiveRecord::Base.transaction do
    CSV.foreach(file, headers: true, header_converters: :symbol) do |row|
      purchaser = Purchaser.find_or_create_by!(
        name: row[:purchaser_name]
      )

      merchant = Merchant.find_or_create_by!(
        name: row[:merchant_name],
        address: row[:merchant_address]
      )

      item = Item.find_or_create_by!(
        description: row[:item_description],
        price: row[:item_price].to_f
      )

      purchase = Purchase.create!(
        purchaser: purchaser,
        merchant: merchant,
        item: item,
        purchase_count: row[:purchase_count].to_i
      )

      total += item.price * purchase.purchase_count
    end
  end

  "Total gross revenue: $#{total.round(2)}"
end