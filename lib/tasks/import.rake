require 'csv'

namespace :tool do
  desc 'Import'
  task import: :environment do
    cost = Cost.find_by(category: '小器具')
    
    file_path = ['csv/107-07-17.csv', 'csv/107-07-17-2.csv']

    file_path.each do |path|
      CSV.foreach(path, headers: false, encoding: 'rb:GB18030:UTF-8') do |row|
        cost.items.create!(name: row[0], mount: row[1].to_i, price: row[2].delete(',').to_i, sum: (row[1].to_i) * (row[2].delete(',').to_i), note: row[4], created_at: Time.zone.parse('2018-07-17'))
      end
    end
  end

  task default_category: :environment do
    categorys = ['小器具', '開店支出']
    categorys.each do |c|
      Cost.create!(category: c)
    end
  end
end