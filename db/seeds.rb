# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

DownloadType.create([
  { name: 'Software', position: 1 },
  { name: 'Data Sheet', position: 2 },
  { name: 'User Guide', position: 3 },
  { name: 'Quick-reference Guide', position: 4 },
  { name: 'Support Documents', position: 5 },
  { name: 'Application Note', position: 6 },
  { name: 'How To', position: 7 },
  { name: 'Accessory Data Sheet', position: 8 },
  { name: 'Compliance Test Report', position: 10 },
  { name: 'Performance Test Report', position: 11 },
  { name: 'Wavetronix Test Report', position: 12 },
  { name: 'Technical Reference', position: 13 },
  { name: 'Release Note', position: 14 },
  { name: 'Discontinued Accessory', position: 15 },
  { name: 'Video', position: 16 },
  { name: 'Warranty', position: 17 },
  { name: 'Solution Summary', position: 18 },
  { name: 'Questionnaire', position: 19 },
  { name: 'Design Guide', position: 20 }
])

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
  { name: 'SmartSensor Advance', part_number: 'SS-200V', product_category_id: product_categories[1].id, summary: 'Product summary', description: 'Better product description goes here.' },
  { name: 'SmartSensor Advance Extended Range', part_number: 'SS-200E', product_category_id: product_categories[1].id, summary: 'Product summary', description: 'Better product description goes here.' },
  { name: 'SmartSensor HD', part_number: '101-0415', product_category_id: product_categories[0].id, summary: 'Product summary', description: 'Better product description goes here.' },
  { name: 'SmartSensor Matrix', part_number: 'SS-225', product_category_id: product_categories[1].id, summary: 'Product summary', description: 'Better product description goes here.' },
  { name: 'SmartSensor Rail', part_number: 'SS-300', product_category_id: product_categories[2].id, summary: 'Product summary', description: 'Better product description goes here.' },
  { name: 'SmartSensor V', part_number: 'SS-105V', product_category_id: product_categories[0].id, summary: 'Product summary', description: 'Better product description goes here.' },
  { name: 'Command Collector', part_number: 'CMD-DCx', product_category_id: product_categories[6].id, summary: 'Product summary', description: 'Better product description goes here.' },
  { name: 'Command DataView', part_number: 'CMD-DV', product_category_id: product_categories[7].id, summary: 'Product summary', description: 'Better product description goes here.' },
  { name: 'Command Monitor', part_number: 'CMD-DM', product_category_id: product_categories[7].id, summary: 'Product summary', description: 'Better product description goes here.' },
  { name: 'Command Suite', part_number: 'CMD-COLL', product_category_id: product_categories[6].id, summary: 'Product summary', description: 'Better product description goes here.' },
  { name: 'Command Translator', part_number: 'CMD-DT', product_category_id: product_categories[8].id, summary: 'Product summary', description: 'Better product description goes here.' },
  { name: 'Command Viewpoint', part_number: 'CMD-VP', product_category_id: product_categories[8].id, summary: 'Product summary', description: 'Better product description goes here.' },
])

Feature.create([
  { title: 'Digital Wave Radar', description: 'Feature description', product_ids: [products[0].id, products[1].id, products[2].id, products[3].id, products[4].id, products[5].id] },
  { title: 'High-definition Radar', description: 'Feature description', product_ids: [products[2].id, products[3].id, products[4].id] }
])


training_courses = TrainingCourse.create([
  { title: 'Advanced Traffic Radar Workshop', number: '105', summary: 'In this workshop, you will learn the basics of radar technology and how it is revolutionizing the traffic detection industry. Familiar with different types of traffic radar and which type  you.', duration: 2, description:'This is the description portion of the course'},
  { title: 'Introduction to HD SmartSensor Workshop', number: '106', summary: 'In this workshop, you will learn the basics of radar technology and how it is revolutionizing the traffic detection industry. Familiar with different types of traffic radar and which type or you.', duration: 3, description:'This is the description part of this course!'},
  { title: 'Introduction to Traffic Radar Workshop', number: '107', summary: 'In this workshop, you will learn the basics of radar technology and how it is revolutionizing the traffic detection industry. Familiar with different types of traffic radar and d work for you.', duration: 4, description:'Here we are describing how cool this course really is.'}
])

training_courses[1].prerequisites << training_courses[0]
training_courses[2].prerequisites << training_courses[0]

training_event = TrainingEvent.create([ 
  { title: 'SmartSensor HD Training Event', location: 'Provo, UT', description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In nec sapien erat. Maecenas quis pharetra ipsum. Nunc non massa et tellus varius tincidunt. Praesent vel purus sed nunc venenatis posuere. Aliquam vitae ante nulla. Nullam bibendum ligula ac ante vestibulum tempus. Curabitur vitae purus sit amet tellus feugiat mattis at id sem. Suspendisse bibendum posuere lacus ut rhoncus. Phasellus pellentesque consequat enim. Nunc luctus non sapien quis mattis. Praesent velit quam, suscipit ut venenatis eu, interdum vitae quam. Morbi accumsan metus et arcu consectetur iaculis.  Praesent tortor ipsum, tincidunt id efficitur non, porta id turpis. Praesent eleifend tincidunt posuere. Sed rutrum tellus nisi, ut varius odio eleifend in. Aliquam volutpat turpis non urna fringilla, eget scelerisque nibh maximus. Sed velit urna, sagittis eget consectetur et, feugiat ut lectus. Nunc commodo augue et mi hendrerit, eu eleifend tellus tempus. Morbi fermentum vel ex quis feugiat. In maximus magna vel magna facilisis condimentum. Proin aliquet iaculis purus in tristique. Duis vulputate mauris sit amet tincidunt dignissim.', started_at:'2017-04-07', ended_at:'2017-04-07' },
  { title: 'Traffic Radar Training Event', location: 'Phoniex, AZ', description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In nec sapien erat. Maecenas quis pharetra ipsum. Nunc non massa et tellus varius tincidunt. Praesent vel purus sed nunc venenatis posuere. Aliquam vitae ante nulla. Nullam bibendum ligula ac ante vestibulum tempus. Curabitur vitae purus sit amet tellus feugiat mattis at id sem. Suspendisse bibendum posuere lacus ut rhoncus. Phasellus pellentesque consequat enim. Nunc luctus non sapien quis mattis. Praesent velit quam, suscipit ut venenatis eu, interdum vitae quam. Morbi accumsan metus et arcu consectetur iaculis.  Praesent tortor ipsum, tincidunt id efficitur non, porta id turpis. Praesent eleifend tincidunt posuere. Sed rutrum tellus nisi, ut varius odio eleifend in. Aliquam volutpat turpis non urna fringilla, eget scelerisque nibh maximus. Sed velit urna, sagittis eget consectetur et, feugiat ut lectus. Nunc commodo augue et mi hendrerit, eu eleifend tellus tempus. Morbi fermentum vel ex quis feugiat. In maximus magna vel magna facilisis condimentum. Proin aliquet iaculis purus in tristique. Duis vulputate mauris sit amet tincidunt dignissim.', started_at:'2017-04-07', ended_at:'2017-04-07' },
  { title: 'Digital Wave Training Event', location: 'Orem, UT', description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In nec sapien erat. Maecenas quis pharetra ipsum. Nunc non massa et tellus varius tincidunt. Praesent vel purus sed nunc venenatis posuere. Aliquam vitae ante nulla. Nullam bibendum ligula ac ante vestibulum tempus. Curabitur vitae purus sit amet tellus feugiat mattis at id sem. Suspendisse bibendum posuere lacus ut rhoncus. Phasellus pellentesque consequat enim. Nunc luctus non sapien quis mattis. Praesent velit quam, suscipit ut venenatis eu, interdum vitae quam. Morbi accumsan metus et arcu consectetur iaculis.  Praesent tortor ipsum, tincidunt id efficitur non, porta id turpis. Praesent eleifend tincidunt posuere. Sed rutrum tellus nisi, ut varius odio eleifend in. Aliquam volutpat turpis non urna fringilla, eget scelerisque nibh maximus. Sed velit urna, sagittis eget consectetur et, feugiat ut lectus. Nunc commodo augue et mi hendrerit, eu eleifend tellus tempus. Morbi fermentum vel ex quis feugiat. In maximus magna vel magna facilisis condimentum. Proin aliquet iaculis purus in tristique. Duis vulputate mauris sit amet tincidunt dignissim.', started_at:'2017-04-07', ended_at:'2017-04-07' },
  { title: 'Microsoft Ignite', location: 'Orlando, FL', description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In nec sapien erat. Maecenas quis pharetra ipsum. Nunc non massa et tellus varius tincidunt. Praesent vel purus sed nunc venenatis posuere. Aliquam vitae ante nulla. Nullam bibendum ligula ac ante vestibulum tempus. Curabitur vitae purus sit amet tellus feugiat mattis at id sem. Suspendisse bibendum posuere lacus ut rhoncus. Phasellus pellentesque consequat enim. Nunc luctus non sapien quis mattis. Praesent velit quam, suscipit ut venenatis eu, interdum vitae quam. Morbi accumsan metus et arcu consectetur iaculis.  Praesent tortor ipsum, tincidunt id efficitur non, porta id turpis. Praesent eleifend tincidunt posuere. Sed rutrum tellus nisi, ut varius odio eleifend in. Aliquam volutpat turpis non urna fringilla, eget scelerisque nibh maximus. Sed velit urna, sagittis eget consectetur et, feugiat ut lectus. Nunc commodo augue et mi hendrerit, eu eleifend tellus tempus. Morbi fermentum vel ex quis feugiat. In maximus magna vel magna facilisis condimentum. Proin aliquet iaculis purus in tristique. Duis vulputate mauris sit amet tincidunt dignissim.', started_at:'2017-04-07', ended_at:'2017-04-07' },

])

training_event_courses = TrainingEventCourse.create([
  { training_course_id: training_courses[0].id, training_event_id: training_event[0].id, seats:5, started_at:'2017-02-06 10:00', ended_at:'2017-02-06 1:00', room: 'Library 401'},
  { training_course_id: training_courses[1].id, training_event_id: training_event[0].id, seats:0, started_at:'2017-02-06 11:00', ended_at:'2017-02-06 2:00', room: 'Library 301'},
  { training_course_id: training_courses[2].id, training_event_id: training_event[0].id, seats:0, started_at:'2017-02-06 12:00', ended_at:'2017-02-06 3:00', room: 'Ball Room'}
])

Patent.create([
  { number: 6556916, title: 'System and Method for Identification of Traffic Lane Positions' },
  { number: 6693557, title: 'Vehicular Traffic Sensor' },
  { number: 7426450, title: 'Systems and Methods for Monitoring Speed' },
  { number: 7427930, title: 'Vehicular Traffic Sensor' },
  { number: 7573400, title: 'Systems and Methods for Configuring Intersection Detection Zones' },
  { number: 7889097, title: 'Detecting Targets in Roadway Intersections' },
  { number: 7889098, title: 'Detecting Targets in Roadway Intersections' },
  { number: 7924170, title: 'Detecting Targets in Roadway Intersections' },
  { number: 7991542, title: 'Monitoring Signalized Traffic Flow' },
  { number: 8248272, title: 'Detecting Targets in Roadway Intersections' },
  { number: 8665113, title: 'Detecting Roadway Targets Across Beams Including Filtering Computed Positions' },
  { number: 9240125, title: 'Detecting Roadway Targets Across Beams' }
])
