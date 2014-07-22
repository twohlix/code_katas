# currency converter 
# take 3 arguments: amount, initial currency, conversion currency

amount = ARGV[0].to_f
initial_currency = ARGV[1].upcase
conversion_currency = ARGV[2].upcase

# use ISO 4127 currency codes
currencies = {}
currencies["USD"] = {"EUR" => 0.741339, "GBP" => 0.585959, "INR" => 60.253982, "AUD" => 1.065289, "CAD" => 1.074432 }

# build all our conversions off of just the USD to save some data entry. 'MERICA WORLD VIEW TIME
# this is not financially accurate for things like forex arbitrage, but is nifty automagication
currencies["USD"].each do |currency_code, rate|
  currencies[currency_code] = {"USD" => 1.0/rate}
  currencies["USD"].each do |code, usd_rate|
    currencies[currency_code][code] = currencies["USD"][code] / currencies["USD"][currency_code] unless code == currency_code 
  end
end

abort "Unknown initial currency" unless currencies.has_key? initial_currency
abort "Unknown conversion currency" unless currencies.has_key? conversion_currency

conversion_rate = currencies[initial_currency][conversion_currency]
converted_amount = amount * conversion_rate

puts "#{amount} #{initial_currency} = #{converted_amount} #{conversion_currency} (Conversion rate: 1 #{initial_currency} = #{conversion_rate} #{conversion_currency})"
