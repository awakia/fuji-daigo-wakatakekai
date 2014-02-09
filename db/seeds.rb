# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'

default_published_at = 1.years.ago.to_datetime

filename = Rails.root.join('db', 'seeds.csv')
CSV.open(filename, headers: true).each do |row|
  p = Post.where(path: row['path'], title: row['title']).first_or_initialize
  ['hash_name', 'content'].each do |x|
    p.send("#{x}=", row[x]) if row[x].present?
  end
  p.format_cd = Post.formats(row['format']).to_i if row['format'].present?
  p.published_at = default_published_at
  default_published_at -= 1.day
  p.save!
end
