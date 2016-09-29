# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

product_types = ProductType.create([
  { name: 'Detection', position: 1 },
  { name: 'Cabinet Integration', position: 2 },
  { name: 'Data Management', position: 3 }
])

product_categories = ProductCategory.create([
  { name: 'Arterial & Freeway', position: 1, product_type_id: product_types[0].id },
  { name: 'Intersection', position: 2, product_type_id: product_types[0].id },
  { name: 'Rail', position: 3, product_type_id: product_types[0].id },
  { name: 'Surge Protection', position: 4, product_type_id: product_types[1].id },
  { name: 'Cabinet Interface', position: 5, product_type_id: product_types[1].id },
  { name: 'Connectivity', position: 6, product_type_id: product_types[1].id },
  { name: 'Data Collection', position: 7, product_type_id: product_types[2].id },
  { name: 'Data Monitoring', position: 8, product_type_id: product_types[2].id },
  { name: 'Data Distribution', position: 9, product_type_id: product_types[2].id }
])

products = Product.create([
  { name: 'SmartSensor Advance', part_number: 'SS-200V', product_category_id: product_categories[1].id },
  { name: 'SmartSensor Advance Extended Range', part_number: 'SS-200E', product_category_id: product_categories[1].id },
  { name: 'SmartSensor HD', part_number: '101-0415', product_category_id: product_categories[0].id },
  { name: 'SmartSensor Matrix', part_number: 'SS-225', product_category_id: product_categories[1].id },
  { name: 'SmartSensor Rail', part_number: 'SS-300', product_category_id: product_categories[2].id },
  { name: 'SmartSensor V', part_number: 'SS-105V', product_category_id: product_categories[0].id },
  { name: 'Command Collector', part_number: 'CMD-DCx', product_category_id: product_categories[6].id },
  { name: 'Command DataView', part_number: 'CMD-DV', product_category_id: product_categories[7].id },
  { name: 'Command Monitor', part_number: 'CMD-DM', product_category_id: product_categories[7].id },
  { name: 'Command Suite', part_number: 'CMD-COLL', product_category_id: product_categories[6].id },
  { name: 'Command Translator', part_number: 'CMD-DT', product_category_id: product_categories[8].id },
  { name: 'Command Viewpoint', part_number: 'CMD-VP', product_category_id: product_categories[8].id },
])
