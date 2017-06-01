# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

##
# Dealers
[
  { name: 'AGA Group', address: '107 Monadnock Rd.', locality: 'Chestnut Hill', region: 'MA', postal_code: '02467', country_id: 'US', phone: '(617) 630-0011', email: 'ag@againc.net', website: 'http://www.againc.net' },
  { name: 'ASTI', address: '18 Blevins Drive', locality: 'New Castle', region: 'DE', postal_code: '19720', country_id: 'US', phone: '(302) 328-3220', email: 'asti@asti-trans.com', website: 'http://www.asti-trans.com' },
  { name: 'Actime BV', address: 'Heuveleindstraat 5', locality: 'Ravenstein', region: 'NL', postal_code: '5371', country_id: 'NL', phone: '+31 (0)486-412846', email: 'info@actime.nl', website: 'http://www.actime.nl' },
  { name: 'Advanced Traffic Products', address: '1122 Industry Street', locality: 'Everett', region: 'WA', postal_code: '98203', country_id: 'US', phone: '(425) 347-6208', email: 'advancedtraffic@advancedtraffic.com', website: 'http://www.advancedtraffic.com' },
  { name: 'Aldridge Electrical Industries', address: 'Unit 10-16 Sir Joseph Banks Drive', locality: 'Kurnell', region: 'NSW', postal_code: '2231', country_id: 'AU', phone: '+612 9540 9966', email: 'info@aldridge.com.au', website: 'http://www.aldridge.com.au' },
  { name: 'Alshamlan International General Trading & Contracting',   address: 'Kuwait - Salmiyah-Blajat Street\r\nBlock #3 - Aloula Tower #34 - 9th Floor - Office 9A\r\nPO Box 5984', locality: 'Salmiyah', region: '', postal_code: '22069', country_id: 'KW', phone: '+965 25712855', email: 'info@alshamlaninternational.com', website: 'http://www.alshamlaninternational.com' },
  { name: 'American Traffic SA', address: 'Av Belgrano 485 Piso 9 Of 20\r\nCP C1092AAQ', locality: 'Ciudad de Buenos Aires', region: '', postal_code: '', country_id: 'AR', phone: '+54 11 4342-6147', email: 'informes@americantrafficsa.com.ar', website: 'http://www.americantrafficsa.com.ar' },
  { name: 'Amparo Solutions', address: 'Falkenbergsgatan 3\r\n', locality: 'Göteborg', region: '', postal_code: '412 85', country_id: 'SE', phone: '+46 (0) 31 721 19 50', email: 'info@amparosolutions.com', website: 'http://www.amparosolutions.com' },
  { name: 'CMS Traffic Systems', address: '70 Lake Road\r\nBhandup (W)', locality: 'Mumbai', region: '', postal_code: '400078', country_id: 'IN', phone: '+91 (22) 2595 2018', email: 'ckrishnakumar@cms.com', website: 'http://www.cms.com/cmstraffic' },
  { name: 'Far Data', address: 'ul. Lipowa 3', locality: 'Krakow', region: '', postal_code: '30-702', country_id: 'PL', phone: '+48 12 255 99 99', email: 'biuro@fardata.pl', website: 'http://www.fardata.pl' },
  { name: 'Fortran Traffic Systems Limited', address: '470 Midwest Road', locality: 'Toronto', region: 'Ontario', postal_code: 'M1P 4Y5', country_id: 'CA', phone: '(416) 288-1320', email: 'sales@fortrantraffic.com', website: 'http://www.fortrantraffic.com' },
  { name: 'HMI Technologies Limited', address: 'PO Box 38164\r\nHowick', locality: 'Auckland', region: '', postal_code: '2145', country_id: 'NZ', phone: '+64 9 572 0006', email: 'info@hmi.co.nz', website: 'http://www.hmi.co.nz' },
  { name: 'IFIPCO Ltd.', address: 'PO Box 14202\r\n213–215 Mesogion Avenue', locality: 'Athens', region: '', postal_code: 'GR 115 10', country_id: 'GR', phone: '+30 210 6725970', email: 'info@ifipco.gr', website: 'http://www.ifipco.gr' },
  { name: 'ITS Teknik A/S', address: 'Københavnsvej 265', locality: 'Roskilde', region: '', postal_code: 'DK-4000', country_id: 'DK', phone: '+45 46 75 72 27', email: 'info@its-teknik.dk', website: 'http://www.its-teknik.dk' },
  { name: 'Interprovincial Traffic Services', address: 'Unit #1, 2153 - 192nd Street', locality: 'Surrey', region: 'BC', postal_code: 'V35 3X2', country_id: 'CA', phone: '(604) 542-8500', email: 'sales@interprovincial.com', website: 'http://www.interprovincial.com' },
  { name: 'Intetra', address: 'Barajyolu Cad. Aral Sok. Özkanca Plaza No:4 K:8', locality: 'Ataşehir Kadıköy', region: 'Istanbul', postal_code: '', country_id: 'TR', phone: '+90 (216) 456 86 40', email: 'info@intetra.com.tr', website: 'http://www.intetra.com.tr' },
  { name: 'Iron Armour', address: '1290 Fox Lane', locality: 'Mogadore', region: 'OH', postal_code: '44260', country_id: 'AF', phone: '(330) 608-5002', email: 'sales@ironarmour.com', website: 'http://www.ironarmour.com' },
  { name: 'Mid American Signal', address: '2429 S. Mill Street', locality: 'Kansas City', region: 'KS', postal_code: '66103', country_id: 'US', phone: '(913) 432-5002', :email=>"", website: 'http://www.midamsignal.com' },
  { name: 'Nam Yeong Information Technology', address: 'Avenida do Dr Rodrigo Rodriquez,', locality: 'Nam Kwong Building 2/F', region: '', postal_code: '', country_id: 'MO', phone: '+853 8391 1572', email: 'service@nymacau.com', website: 'http://www.nymacau.com' },
  { name: 'Navigator', address: '14/19 Novoslobodskaya Street', locality: 'Moscow', region: '', postal_code: '127055', country_id: 'RU', phone: '+7 (495) 775-72-82', email: 'info@navi-ltd.ru', website: 'http://www.strelka-wave.ru' },
  { name: 'Orange Traffic', address: '18195 J.-A. Bombardier', locality: 'Mirabel', region: 'QC', postal_code: 'J7J 0E7', country_id: 'CA', phone: '(450) 477-5262', email: 'info@orangetraffic.com', website: 'http://www.orangetraffic.com' },
  { name: 'QTC Traffic Technology Ltd.', address: 'Unit H, 7/F., World Tech Centre,\r\n95 How Ming Street, Kwun Tong', locality: 'Kowloon', region: '', postal_code: '', country_id: 'HK', phone: '+852 2535 8112', email: 'mlam@qtc-traffic.com', website: 'http://www.qtc-traffic.com' },
  { name: 'Quadrex', address: 'C/ Muntaner 262, 4o-1a', locality: 'Barcelona', region: '', postal_code: '08021', country_id: 'ES', phone: '+34 93 202 2924', email: 'info@quadrex.es', website: 'http://www.quadrex.es' },
  { name: 'S.T.S. s.r.l.', address: 'Via Tita Secchi n. 1', locality: 'Desenzano del Garda (BS)', region: '', postal_code: '25015', country_id: 'IT', phone: '+39 030 918226', email: 'elena.casarini@ststraffic.it', website: 'http://ststraffic.it' },
  { name: 'SMEU Astana Ltd', address: '15/1 Beisekbayev str.,\r\n', locality: 'Astana', region: '', postal_code: '010000', country_id: 'KZ', phone: '+7 (7172) 37 69 90', email: 'info@smeu-astana.kz', website: 'http://smeu-astana.kz' },
  { name: 'Schweizer Electronic AG', address: 'Industriestrasse 3', locality: 'Reiden', region: '', postal_code: 'CH-6260', country_id: 'CH', phone: '+41 62 749 07 07', email: 'info@schweizer-electronic.com', website: 'http://www.schweizer-electronic.com' },
  { name: 'Signal Control Products, Inc.', address: '199 Evans Way', locality: 'Branchburg', region: 'NJ', postal_code: '08876', country_id: 'US', phone: '(908) 231-1133', email: 'sales@signalcontrol.com', website: 'http://www.signalcontrol.com' },
  { name: 'Summit Traffic Solutions', address: '11757 W Ken Caryl Ave.\r\nSuite F-411', locality: 'Littleton', region: 'CO', postal_code: '80127', country_id: 'US', phone: '(303) 717-1917', email: 'info@summit-traffic.com', website: 'http://www.summit-traffic.com' },
  { name: 'SummitCrest (California office)', address: '33175 Temecula Pkwy, Suite A415', locality: 'Temecula', region: 'CA', postal_code: '92592', country_id: 'US', phone: '(760) 529-9792', email: 'sales@summit-crest.com', website: 'http://www.summit-crest.com' },
  { name: 'SummitCrest (Illinois office)', address: '2516 Waukegan Rd, Suite 214', locality: 'Glenview', region: 'IL', postal_code: '60025', country_id: 'US', phone: '(224) 235-4474', email: 'sales@summit-crest.com', website: 'http://www.summit-crest.com' },
  { name: 'TMS Engineering Co., Ltd.', address: '50/413 Moo 6 Tambol Banmai', locality: 'Amphur Pakkred', region: 'Nonthatburi', postal_code: '11120', country_id: 'TH', phone: '+66 (2) 984 1192', email: 'tmsadmin@tmsengineering.co.th', website: 'http://www.tmsengineering.co.th' },
  { name: 'Telehouse Engineering', address: 'JL. A.H Nasution No.236 Ujung Berung', locality: 'Bandung', region: '', postal_code: '40614', country_id: 'ID', phone: '+62 (22) 780 2700', email: 'telehouse@telehouse-eng.com', website: 'http://www.telehouse-eng.com' },
  { name: 'Turbine Technique (M) Sdn Bhd', address: 'No 21, Jalan Uranus AJ U5/AJ\r\nSeksyen U5, 40150 Shah Alam,', locality: 'Selangor', region: 'Darul Ehsan', postal_code: '', country_id: 'MY', phone: '+60 3 7845 4093', email: 'sales@turbine-group.com', website: 'http://www.turbine-group.com' },
  { name: 'Twincrest Technologies', address: '7625 Bellaire Drive South\r\nSuite 130', locality: 'Fort Worth', region: 'TX', postal_code: '76132', country_id: 'US', phone: '(817) 539-2200', email: 'sales@twincresttech.com', website: 'http://twincresttech.com'}
].each do |dealer|
  Dealer.find_or_create_by(name: dealer[:name]) do |d|
    d.address = dealer[:address]
    d.locality = dealer[:locality]
    d.region = dealer[:region]
    d.postal_code = dealer[:postal_code]
    d.country_id = dealer[:country_id]
    d.phone = dealer[:phone]
    d.email = dealer[:email]
    d.website = dealer[:website]
  end
end

dealers = Dealer.order(:name)

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
# Sales Offices

##
# Sales Regions

##
# Sales Territories

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
  { title: 'Advanced Traffic Radar Workshop', training_course_type_id: training_course_types[0].id, number: '105', summary: 'In this workshop, you will learn the basics of radar technology and how it is revolutionizing the traffic detection industry. Familiar with different types of traffic radar and which type  you.', duration: 2, description: 'This is the description portion of the course' },
  { title: 'Introduction to HD SmartSensor Workshop', training_course_type_id: training_course_types[1].id, number: '106', summary: 'In this workshop, you will learn the basics of radar technology and how it is revolutionizing the traffic detection industry. Familiar with different types of traffic radar and which type or you.', duration: 3, description: 'This is the description part of this course!' },
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
  { training_course_id: training_courses[0].id, training_event_id: training_events[0].id, seats:5, started_at: 72.hours.from_now.to_s(:db), ended_at: 75.hours.from_now.to_s(:db), room: 'Library 401' },
  { training_course_id: training_courses[1].id, training_event_id: training_events[0].id, seats:0, started_at: 72.hours.from_now.to_s(:db), ended_at: 75.hours.from_now.to_s(:db), room: 'Library 301' },
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
