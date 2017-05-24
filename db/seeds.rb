# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


##
# Download Types
[
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
].each do |download_type|
  DownloadType.find_or_create_by(name: download_type[:name]) do |dt|
    dt.position = download_type[:position]
  end
end

##
# Product Types
[
  { name: 'Detection', position: 1 },
  { name: 'Cabinet Integration', position: 2 },
  { name: 'Data Management', position: 3 }
].each do |product_type|
  ProductType.find_or_create_by(name: product_type[:name]) do |pt|
    pt.position   = product_type[:position]
    pt.hero_image = File.new('test/fixtures/files/shark.jpg')
    pt.icon_image = File.new('test/fixtures/files/icon.svg')
  end
end

product_types = ProductType.order(:position)

##
# Product Categories
[
  { name: 'Arterial & Freeway', position: 1, product_type_id: product_types[0].id },
  { name: 'Intersection', position: 2, product_type_id: product_types[0].id },
  { name: 'Rail', position: 3, product_type_id: product_types[0].id },
  { name: 'Surge Protection', position: 4, product_type_id: product_types[1].id },
  { name: 'Cabinet Interface', position: 5, product_type_id: product_types[1].id },
  { name: 'Connectivity', position: 6, product_type_id: product_types[1].id },
  { name: 'Data Collection', position: 7, product_type_id: product_types[2].id },
  { name: 'Data Monitoring', position: 8, product_type_id: product_types[2].id },
  { name: 'Data Distribution', position: 9, product_type_id: product_types[2].id }
].each do |product_category|
  ProductCategory.find_or_create_by(name: product_category[:name]) do |pc|
    pc.position        = product_category[:position]
    pc.product_type_id = product_category[:product_type_id]
    pc.hero_image      = File.new('test/fixtures/files/shark.jpg')
    pc.icon_image      = File.new('test/fixtures/files/icon.svg')
  end
end

product_categories = ProductCategory.order(:position)

##
# Products
[
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
].each do |product|
  Product.find_or_create_by(name: product[:name]) do |p|
    p.part_number         = product[:part_number]
    p.product_category_id = product[:product_category_id]
    p.summary             = product[:summary]
    p.description         = product[:description]
    p.product_image       = File.new('test/fixtures/files/shark.jpg')
    p.hero_image          = File.new('test/fixtures/files/shark.jpg')
  end
end

products = Product.joins(product_category: [:product_type]).order('product_types.position, product_categories.position, products.name')

##
# Features
[
  { title: 'Digital Wave Radar', description: 'Feature description', product_ids: [products[0].id, products[1].id, products[2].id, products[3].id, products[4].id, products[5].id] },
  { title: 'High-definition Radar', description: 'Feature description', product_ids: [products[2].id, products[3].id, products[4].id] }
].each do |feature|
  Feature.find_or_create_by(title: feature[:title]) do |f|
    f.description = feature[:description]
    f.product_ids = feature[:product_ids]
    f.hero_image  = File.new('test/fixtures/files/shark.jpg')
  end
end

##
# Patents
[
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
].each do |patent|
  Patent.find_or_create_by(number: patent[:number]) do |p|
    p.title = patent[:title]
  end
end

##
# Redirect Rules
[
  { source: '/advance1501', destination: 'http://youtu.be/XXzV_jKfWo4?utm_source=traffic_brochure&utm_medium=print&utm_content=wavetronix-smartsensor-advance-youtube&utm_campaign=smartsensor' },
  { source: '/app1401', destination: '/products/wavetronix_app?utm_source=card&utm_medium=print&utm_content=app-pass-along&utm_campaign=app' },
  { source: '/click1401', destination: 'http://youtu.be/qlFOKaUE9Bk' },
  { source: '/dilemma1501', destination: '/products/smartsensor/advance/safearrival?utm_source=traffic_brochure&utm_medium=print&utm_content=advance-dilemma-zone-tool&utm_campaign=smartsensor' },
  { source: '/hdperformance', destination: '/products/smartsensor/hd/performance?utm_source=its_brochure&utm_medium=print&utm_campaign=hdperformance' },
  { source: '/HDperformance', destination: '/products/smartsensor/hd/performance?utm_source=its_brochure&utm_medium=print&utm_campaign=hdperformance' },
  { source: '/history-of-radar', destination: 'https://viewer.aemmobile.adobe.com/index.html#project/5ca54145-0790-4361-b19d-ff3abcefda99/view/PulseMagazine/article/Pulse3-4?utm_source=pulse&utm_medium=print&utm_content=history-of-radar&utm_campaign=Pulse+10.2' },
  { source: '/imsa1101', destination: '/products/smartsensor/matrix?utm_campaign=smartsensor&utm_source=imsa&utm_medium=print&utm_content=matrix-ad-squares' },
  { source: '/intro1501', destination: 'http://youtu.be/OE9_JYiA7zc?utm_source=traffic_brochure&utm_medium=print&utm_content=an-introduction-to-wavetronix-youtube&utm_campaign=corporate' },
  { source: '/it1401', destination: '/products/smartsensor/hd?utm_source=it_preview&utm_medium=print&utm_content=half-page-2014-hd-announcement&utm_campaign=smartsensor' },
  { source: '/it1601', destination: '/products/smartsensor/hd?utm_source=it_preview&utm_medium=print&utm_content=half-page-2015-HD-loops-ad&utm_campaign=smartsensor' },
  { source: '/its1101', destination: '/products/smartsensor/hd?utm_campaign=smartsensor&utm_source=its_international&utm_medium=print&utm_content=international-hd-ad-squares' },
  { source: '/its1102', destination: '/products/smartsensor/matrix?utm_campaign=smartsensor&utm_source=its_daily&utm_medium=print&utm_content=matrix-ad-squares' },
  { source: '/its1201', destination: '/products/smartsensor/hd?utm_campaign=smartsensor&utm_source=its_international&utm_medium=print&utm_content=accept-no-substitutes-elvis' },
  { source: '/its1301', destination: '/products/smartsensor?utm_source=its_international&utm_medium=print&utm_content=move-em-out-half-page&utm_campaign=smartsensor' },
  { source: '/its1304', destination: '/products/smartsensor/hd?utm_source=its_international&utm_medium=print&utm_content=half-page-2014-hd-announcement&utm_campaign=smartsensor' },
  { source: '/its1401', destination: '/products/smartsensor/matrix?utm_source=its_international&utm_medium=print&utm_content=half-page-2014-matrix&utm_campaign=smartsensor' },
  { source: '/its1402', destination: '/products/smartsensor/matrix?utm_source=its_international&utm_medium=print&utm_content=half-page-2014-matrix-tech&utm_campaign=smartsensor' },
  { source: '/its1403', destination: '/products/smartsensor/hd?utm_source=its_international&utm_medium=print&utm_content=half-page-2014-HD&utm_campaign=smartsensor' },
  { source: '/its1404', destination: '/products/smartsensor/hd?utm_source=its_international&utm_medium=print&utm_content=half-page-2014-HD-tech&utm_campaign=smartsensor' },
  { source: '/its1405', destination: '/products/smartsensor/advance?utm_source=its_international&utm_medium=print&utm_content=half-page-2014-advance&utm_campaign=smartsensor' },
  { source: '/its1406', destination: '/products/smartsensor/advance?utm_source=its_international&utm_medium=print&utm_content=half-page-2014-advance-tech&utm_campaign=smartsensor' },
  { source: '/its1501', destination: '/dealers?utm_source=its_international&utm_medium=print&utm_content=half-page-2015-HD-loops-ad&utm_campaign=smartsensor' },
  { source: '/its1601', destination: '/dealers?utm_source=its_international&utm_medium=print&utm_content=half-page-2016-HD-sharper-ad&utm_campaign=smartsensor' },
  { source: '/itsa1201', destination: '/products/smartsensor/hd?utm_campaign=smartsensor&utm_source=its_daily&utm_medium=print&utm_content=accept-no-substitutes-elvis' },
  { source: '/itsa1301', destination: '/products/smartsensor?utm_source=itsa_daily&utm_medium=print&utm_content=move-em-out-and-scenic-cowboy-half-page&utm_campaign=smartsensor' },
  { source: '/itsa1601', destination: 'http://youtu.be/T7mdbsF8FrY?utm_source=itsa_daily&utm_medium=print&utm_content=wavetronix-smartsensor-matrix-youtube&utm_campaign=smartsensor' },
  { source: '/itsa1602', destination: 'http://youtu.be/RpiFph3iTPs?utm_source=itsa_daily&utm_medium=print&utm_content=wavetronix-smartsensor-hd-youtube&utm_campaign=smartsensor' },
  { source: '/itsa1603', destination: 'http://youtu.be/XXzV_jKfWo4?utm_source=itsa_daily&utm_medium=print&utm_content=wavetronix-smartsensor-advance-youtube&utm_campaign=smartsensor' },
  { source: '/itswc1301', destination: '/products/smartsensor/hd?utm_source=ITSWC_Daily_News&utm_medium=print&utm_content=take-control-its-applications-hd-ad&utm_campaign=smartsensor' },
  { source: '/itswc1501', destination: '/products/smartsensor/hd?utm_source=ITSWC_Daily_News&utm_medium=print&utm_content=half-page-2015-HD-reliability-ad&utm_campaign=smartsensor' },
  { source: '/itw1301', destination: '/products/smartsensor/hd?utm_source=itw&utm_medium=print&utm_content=premier-performance-hd-ad&utm_campaign=smartsensor' },
  { source: '/itw1401', destination: '/products/smartsensor/hd?utm_source=itw&utm_medium=print&utm_content=full-page-2014-hd-announcement&utm_campaign=smartsensor' },
  { source: '/itw1501', destination: '/dealers?utm_source=Itw&utm_medium=print&utm_content=full-page-2015-hd-sharper-ad&utm_campaign=smartsensor' },
  { source: '/itw1601', destination: '/dealers?utm_source=Itw&utm_medium=print&utm_content=full-page-2016-hd-sharper-ad&utm_campaign=smartsensor' },
  { source: '/itw2011', destination: '/products/smartsensor/hd?utm_campaign=smartsensor&utm_source=itw&utm_medium=print&utm_content=international-hd-ad' },
  { source: '/iw1201', destination: '/products/smartsensor/hd?utm_campaign=smartsensor&utm_source=intertraffic_world_daily_news&utm_medium=print&utm_content=accept-no-substitutes-elvis' },
  { source: '/matrix1501', destination: 'http://youtu.be/T7mdbsF8FrY?utm_source=traffic_brochure&utm_medium=print&utm_content=wavetronix-smartsensor-matrix-youtube&utm_campaign=smartsensor' },
  { source: '/meter1401', destination: 'http://youtu.be/Sun_TaqL-xc' },
  { source: '/pulse1301', destination: '/?utm_source=pulse&utm_medium=print&utm_content=go-with-gold&utm_campaign=corporate' },
  { source: '/pulse1302', destination: '/dealers?utm_source=pulse&utm_medium=print&utm_content=pulse-live-three-pictures&utm_campaign=pulselive' },
  { source: '/pulse1303', destination: '/products/smartsensor?utm_source=pulse&utm_medium=print&utm_content=rise-above-the-road&utm_campaign=smartsensor' },
  { source: '/pulse1304', destination: '/products/smartsensor/hd?utm_source=pulse&utm_medium=print&utm_content=resolution-matters-horse-race&utm_campaign=smartsensor' },
  { source: '/pulse1305', destination: '/products/command?utm_source=pulse&utm_medium=print&utm_content=cowboy-starry-night&utm_campaign=command' },
  { source: '/pulse1306', destination: '/products/smartsensor?utm_source=pulse&utm_medium=print&utm_content=cowboy-traffic-light-safety-and-efficiency&utm_campaign=smartsensor' },
  { source: '/pulse1307', destination: '/products/smartsensor/advance?utm_source=pulse&utm_medium=print&utm_content=intersection-safety-advance-ad&utm_campaign=smartsensor' },
  { source: '/pulse1308', destination: '/products/smartsensor/matrix?utm_source=pulse&utm_medium=print&utm_content=bike-detection-matrix-ad&utm_campaign=smartsensor' },
  { source: '/pulse1309', destination: '/products/smartsensor/advance/safearrival?utm_source=pulse&utm_medium=print&utm_content=dilemma-zone&utm_campaign=smartsensor' },
  { source: '/pulse1401', destination: '/products/smartsensor/matrix?utm_source=pulse&utm_medium=print&utm_content=sharper-positioning-matrix-spread&utm_campaign=smartsensor' },
  { source: '/pulse1402', destination: '/products/smartsensor/hd?utm_source=pulse&utm_medium=print&utm_content=sharper-positioning-hd-spread&utm_campaign=smartsenor' },
  { source: '/pulse1403', destination: '/dealers?utm_source=pulse&utm_medium=print&utm_content=sharper-positioning-hd-full&utm_campaign=smartsensor' },
  { source: '/sh1501', destination: '/products/smartsensor/hd?utm_source=smart_highways&utm_medium=print&utm_content=half-page-2015-HD-sharper-ad&utm_campaign=smartsensor' },
  { source: '/sh1601', destination: '/dealers?utm_source=smart_highways&utm_medium=print&utm_content=half-page-2016-HD-loops-ad&utm_campaign=smartsensor' },
  { source: '/th1101', destination: '/products/smartsensor/hd?utm_source=th&utm_medium=print&utm_content=international_fp_hd-ad&utm_campaign=smartsensor' },
  { source: '/th1102', destination: '/products/smartsensor/matrix?utm_source=th&utm_medium=print&utm_content=north-america_fp_matrix-ad&utm_campaign=smartsensor' },
  { source: '/tti1201', destination: '/products/smartsensor/hd?utm_campaign=smartsensor&utm_source=tti&utm_medium=print&utm_content=international-hd-ad-squares' },
  { source: '/tti1202', destination: '/products/smartsensor/hd?utm_campaign=smartsensor&utm_source=tti&utm_medium=print&utm_content=accept-no-substitutes-elvis' },
  { source: '/app_viewer', destination: 'https://viewer.aemmobile.adobe.com/index.html#project/5ca54145-0790-4361-b19d-ff3abcefda99/view/topLevelTabletContent/view/Home;openTo=browsePage' },
  { source: '/customersolutions', destination: '/en/news/case_studies' },
  { source: '/facebook', destination: 'http://facebook.com/wavetronix' },
  { source: '/integrator', destination: '/en-GB/about/programs/integrator/applications/new?utm_campaign=corporate&utm_source=brochure&utm_medium=print&utm_content=wavetronix-integrator-benefits-program' },
  { source: '/linkedin', destination: 'http://linkedin.com/company/wavetronix' },
  { source: '/marketing_app_viewer', destination: 'https://viewer.aemmobile.adobe.com/index.html#project/5ca54145-0790-4361-b19d-ff3abcefda99/view/topLevelTabletContent/view/Home;openTo=browsePage' },
  { source: '/patentinfo', destination: '/en/legal/patents' },
  { source: '/twitter', destination: 'http://twitter.com/wavetronix_llc' },
  { source: '/youtube', destination: 'http://youtube.com/wavetronix' },
  { source: '/o365/software', destination: 'https://portal.office.com/OLS/MySoftware.aspx' },
  { source: '/roadway/policy-feedback', destination: 'https://wavetronix.sharepoint.com/wtx/cpb/Comment/SitePages/Home.aspx' }
].each do |redirect_rule|
  RedirectRule.find_or_create_by(source: redirect_rule[:source]) do |rr|
    rr.destination = redirect_rule[:destination]
  end
end

##
# RMA Policy
ReturnMaterialAuthorizationPolicyDocument.find_or_create_by(effective_on: 2.years.ago.to_s(:db)) do |rma_policy|
  rma_policy.title = 'Return Material Authorization Policy'
  rma_policy.body = '<p>RMA policy body.</p>'
end

##
# Roles
%w[
  admin
  blog_post_manager
  case_study_manager
  dealer_manager
  download_type_manager
  download_manager
  feature_manager
  knowledge_base_article_manager
  media_download_manager
  office_manager
  patent_manager
  product_category_manager
  product_type_manager
  product_manager
  return_material_authorization_policy_document_manager
  role_manager
  sales_terms_and_conditions_document_manager
  territory_manager
  training_course_type_manager
  training_course_manager
  training_event_manager
  user_manager
  website_privacy_policy_document_manager
  website_terms_of_use_document_manager
].each do |role|
  Role.find_or_create_by(name: role)
end

##
# Training Course Types
[
  'Certified Training Course',
  'Educational Event',
  'Pulse Live Event',
  'Technical Workshop'
].each do |training_course_type|
  TrainingCourseType.find_or_create_by(name: training_course_type)
end

training_course_types = TrainingCourseType.order(:name)

##
# Training Courses
[
  { title: 'Advanced Traffic Radar Workshop', training_course_type_id: training_course_types[0].id, number: '105', summary: 'In this workshop, you will learn the basics of radar technology and how it is revolutionizing the traffic detection industry. Familiar with different types of traffic radar and which type  you.', duration: 2, description: 'This is the description portion of the course'},
  { title: 'Introduction to HD SmartSensor Workshop', training_course_type_id: training_course_types[1].id, number: '106', summary: 'In this workshop, you will learn the basics of radar technology and how it is revolutionizing the traffic detection industry. Familiar with different types of traffic radar and which type or you.', duration: 3, description: 'This is the description part of this course!'},
  { title: 'Introduction to Traffic Radar Workshop', training_course_type_id: training_course_types[2].id, number: '107', summary: 'In this workshop, you will learn the basics of radar technology and how it is revolutionizing the traffic detection industry. Familiar with different types of traffic radar and d work for you.', duration: 4, description: 'Here we are describing how cool this course really is.'}
].each do |training_course|
  TrainingCourse.find_or_create_by(title: training_course[:title]) do |tc|
    tc.duration    = training_course[:duration]
    tc.description = training_course[:description]
    tc.training_course_type_id = training_course[:training_course_type_id]
    tc.summary = training_course[:summary]
  end
end

training_courses = TrainingCourse.order(:number)

training_courses[1].prerequisites << training_courses[0]
training_courses[2].prerequisites << training_courses[0]

##
# Training Events
[
  {
    title: 'Digital Wave Training Event',
    location: 'Orem, UT',
    description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In nec sapien erat. Maecenas quis pharetra ipsum. Nunc non massa et tellus varius tincidunt. Praesent vel purus sed nunc venenatis posuere. Aliquam vitae ante nulla. Nullam bibendum ligula ac ante vestibulum tempus. Curabitur vitae purus sit amet tellus feugiat mattis at id sem. Suspendisse bibendum posuere lacus ut rhoncus. Phasellus pellentesque consequat enim. Nunc luctus non sapien quis mattis. Praesent velit quam, suscipit ut venenatis eu, interdum vitae quam. Morbi accumsan metus et arcu consectetur iaculis.  Praesent tortor ipsum, tincidunt id efficitur non, porta id turpis. Praesent eleifend tincidunt posuere. Sed rutrum tellus nisi, ut varius odio eleifend in. Aliquam volutpat turpis non urna fringilla, eget scelerisque nibh maximus. Sed velit urna, sagittis eget consectetur et, feugiat ut lectus. Nunc commodo augue et mi hendrerit, eu eleifend tellus tempus. Morbi fermentum vel ex quis feugiat. In maximus magna vel magna facilisis condimentum. Proin aliquet iaculis purus in tristique. Duis vulputate mauris sit amet tincidunt dignissim.',
    started_at: 2.weeks.from_now.to_s(:db),
    ended_at: 2.weeks.from_now.to_s(:db)
  },
  {
    title: 'Microsoft Ignite',
    location: 'Orlando, FL',
    description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In nec sapien erat. Maecenas quis pharetra ipsum. Nunc non massa et tellus varius tincidunt. Praesent vel purus sed nunc venenatis posuere. Aliquam vitae ante nulla. Nullam bibendum ligula ac ante vestibulum tempus. Curabitur vitae purus sit amet tellus feugiat mattis at id sem. Suspendisse bibendum posuere lacus ut rhoncus. Phasellus pellentesque consequat enim. Nunc luctus non sapien quis mattis. Praesent velit quam, suscipit ut venenatis eu, interdum vitae quam. Morbi accumsan metus et arcu consectetur iaculis.  Praesent tortor ipsum, tincidunt id efficitur non, porta id turpis. Praesent eleifend tincidunt posuere. Sed rutrum tellus nisi, ut varius odio eleifend in. Aliquam volutpat turpis non urna fringilla, eget scelerisque nibh maximus. Sed velit urna, sagittis eget consectetur et, feugiat ut lectus. Nunc commodo augue et mi hendrerit, eu eleifend tellus tempus. Morbi fermentum vel ex quis feugiat. In maximus magna vel magna facilisis condimentum. Proin aliquet iaculis purus in tristique. Duis vulputate mauris sit amet tincidunt dignissim.',
    started_at: 2.weeks.from_now.to_s(:db),
    ended_at: 2.weeks.from_now.to_s(:db)
  },
  {
    title: 'SmartSensor HD Training Event',
    location: 'Provo, UT',
    description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In nec sapien erat. Maecenas quis pharetra ipsum. Nunc non massa et tellus varius tincidunt. Praesent vel purus sed nunc venenatis posuere. Aliquam vitae ante nulla. Nullam bibendum ligula ac ante vestibulum tempus. Curabitur vitae purus sit amet tellus feugiat mattis at id sem. Suspendisse bibendum posuere lacus ut rhoncus. Phasellus pellentesque consequat enim. Nunc luctus non sapien quis mattis. Praesent velit quam, suscipit ut venenatis eu, interdum vitae quam. Morbi accumsan metus et arcu consectetur iaculis.  Praesent tortor ipsum, tincidunt id efficitur non, porta id turpis. Praesent eleifend tincidunt posuere. Sed rutrum tellus nisi, ut varius odio eleifend in. Aliquam volutpat turpis non urna fringilla, eget scelerisque nibh maximus. Sed velit urna, sagittis eget consectetur et, feugiat ut lectus. Nunc commodo augue et mi hendrerit, eu eleifend tellus tempus. Morbi fermentum vel ex quis feugiat. In maximus magna vel magna facilisis condimentum. Proin aliquet iaculis purus in tristique. Duis vulputate mauris sit amet tincidunt dignissim.',
    started_at: 2.weeks.from_now.to_s(:db),
    ended_at: 2.weeks.from_now.to_s(:db)
  },
  {
    title: 'Traffic Radar Training Event',
    location: 'Phoniex, AZ',
    description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In nec sapien erat. Maecenas quis pharetra ipsum. Nunc non massa et tellus varius tincidunt. Praesent vel purus sed nunc venenatis posuere. Aliquam vitae ante nulla. Nullam bibendum ligula ac ante vestibulum tempus. Curabitur vitae purus sit amet tellus feugiat mattis at id sem. Suspendisse bibendum posuere lacus ut rhoncus. Phasellus pellentesque consequat enim. Nunc luctus non sapien quis mattis. Praesent velit quam, suscipit ut venenatis eu, interdum vitae quam. Morbi accumsan metus et arcu consectetur iaculis.  Praesent tortor ipsum, tincidunt id efficitur non, porta id turpis. Praesent eleifend tincidunt posuere. Sed rutrum tellus nisi, ut varius odio eleifend in. Aliquam volutpat turpis non urna fringilla, eget scelerisque nibh maximus. Sed velit urna, sagittis eget consectetur et, feugiat ut lectus. Nunc commodo augue et mi hendrerit, eu eleifend tellus tempus. Morbi fermentum vel ex quis feugiat. In maximus magna vel magna facilisis condimentum. Proin aliquet iaculis purus in tristique. Duis vulputate mauris sit amet tincidunt dignissim.',
    started_at: 2.weeks.from_now.to_s(:db),
    ended_at: 2.weeks.from_now.to_s(:db)
  }
].each do |training_event|
  TrainingEvent.find_or_create_by(title: training_event[:title]) do |te|
    te.location    = training_event[:location]
    te.description = training_event[:description]
    te.started_at = training_event[:started_at]
    te.ended_at = training_event[:ended_at]
  end
end

training_events = TrainingEvent.order(:title)

##
# Training Event Course


[
  { training_course_id: training_courses[0].id, training_event_id: training_events[0].id, seats:5, started_at: 72.hours.from_now.to_s(:db), ended_at: 75.hours.from_now.to_s(:db), room: 'Library 401'},
  { training_course_id: training_courses[1].id, training_event_id: training_events[0].id, seats:0, started_at: 72.hours.from_now.to_s(:db), ended_at: 75.hours.from_now.to_s(:db), room: 'Library 301'},
  { training_course_id: training_courses[2].id, training_event_id: training_events[0].id, seats:0, started_at: 72.hours.from_now.to_s(:db), ended_at: 75.hours.from_now.to_s(:db), room: 'Ball Room'}
].each do |training_event_course|
  TrainingEventCourse.find_or_create_by(training_course_id: training_event_course[:training_course_id]) do |tec|
    tec.training_event_id = training_event_course[:training_event_id]
    tec.seats             = training_event_course[:seats]
    tec.started_at        = training_event_course[:started_at]
    tec.ended_at          = training_event_course[:ended_at]
    tec.room              = training_event_course[:room]
  end
end
