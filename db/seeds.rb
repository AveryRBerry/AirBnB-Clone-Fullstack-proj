require "open-uri"

ApplicationRecord.transaction do 
  puts "Destroying tables..."
  Reservation.destroy_all
  Listing.destroy_all
  User.destroy_all
  
  


  puts "Resetting primary keys..."
  ApplicationRecord.connection.reset_pk_sequence!('reservations')
  ApplicationRecord.connection.reset_pk_sequence!('listings')
  ApplicationRecord.connection.reset_pk_sequence!('users')
  
end

puts "Creating users..."

#1 demo
User.create!(
  email: 'demo@user.io', 
  password: '!StrongPassword232305',
  last_name: 'DemoLastName',
  first_name: 'DemoFirstName'
)

#2 wiz
User.create!(
  email: 'demo@user2.io', 
  password: '!StrongPassword232305',
  last_name: 'Grey',
  first_name: 'Axar'
)

#3 Atlanna
User.create!(
  email: 'demo@user3.io', 
  password: '!StrongPassword232305',
  last_name: 'Daanuth',
  first_name: 'Garng'
)

#4 Horror
User.create!(
  email: 'demo@user4.io', 
  password: '!StrongPassword232305',
  last_name: 'Myers',
  first_name: 'Michael'
)

#5 Hobbit
User.create!(
  email: 'demo@user5.io', 
  password: '!StrongPassword232305',
  last_name: 'Baggins',
  first_name: 'Frodo'
)

#6 Candy witch
User.create!(
  email: 'demo@user6.io', 
  password: '!StrongPassword232305',
  last_name: 'Yaga',
  first_name: 'Baba'
)

#7 Defualt sale
User.create!(
  email: 'demo@user7.io', 
  password: '!StrongPassword232305',
  last_name: 'Mays',
  first_name: 'Billy'
)


puts "Creating listings..."

#1
listing1 = Listing.create!(
  host_id: 4,
  address: '13 Main Street, New York, NY 13131',
  title: 'Cozy Cabin in the Woods',
  description: "Unplug, unwind, and let the wilderness be your guide. From creaking floorboards to flickering candlelight, every moment here is an opportunity to discover the unexpected. The 'Cozy Cabin in the Woods' invites you to trade the ordinary for the extraordinary. (Any movement or structural changes to the premises are completely normal and nothing to worry about.)",
  num_beds: 13,
  num_bedrooms: 13,
  number_bathrooms: 13,
  price: 13.13,
  has_ac: true,
  has_wifi: true,
  has_pets_allowed: false,
  has_washer_dryer: false,
  latitude: 40.7128,
  longitude: -74.0060
)

listing1_photo_urls = [
  "https://airdnd-fullstack-prj-seeds.s3.amazonaws.com/CozyCabin/CozyCabin1.jpeg",
  "https://airdnd-fullstack-prj-seeds.s3.amazonaws.com/CozyCabin/CozyCabin2.jpg",
  "https://airdnd-fullstack-prj-seeds.s3.amazonaws.com/CozyCabin/CozyCabin3.jpeg",
  "https://airdnd-fullstack-prj-seeds.s3.amazonaws.com/CozyCabin/CozyCabin4.jpeg",
  "https://airdnd-fullstack-prj-seeds.s3.amazonaws.com/CozyCabin/CozyCabin5.jpeg"
]

listing1_photo_urls.each_with_index do |url, index|
  listing1.photos.attach(
    io: URI.open(url),
    filename: "photo_#{index + 1}"
  )
end

#2
listing2 = Listing.create!(
  host_id: 5,
  address: "789 Fantasy Street",
  title: "Hobbit Hole in the Shire",
  description: "Welcome to my cozy Hobbit Hole, nestled snugly into the earth with all the charm and comfort a hobbit could ever desire! Step through the round doorway, and you'll find yourself in a world of rustic elegance – from the earthy tones of the walls to the cozy nooks where you can enjoy a second breakfast or curl up with a good book. The sunlight filters through the lush, green roof, casting a warm, dappled glow on the handcrafted furnishings.",
  num_beds: 1,
  num_bedrooms: 1,
  number_bathrooms: 1,
  price: 60.0,
  has_ac: false,
  has_wifi: true,
  has_pets_allowed: true,
  has_washer_dryer: false,
  latitude: 51.5074,
  longitude: -0.1278
)

listing2_photo_urls = [
  "https://airdnd-fullstack-prj-seeds.s3.amazonaws.com/HobbitHouse/hobbitHouse1.webp",
  "https://airdnd-fullstack-prj-seeds.s3.amazonaws.com/HobbitHouse/hobbitHouse2.png",
  "https://airdnd-fullstack-prj-seeds.s3.amazonaws.com/HobbitHouse/hobbitHouse3.jpeg",
  "https://airdnd-fullstack-prj-seeds.s3.amazonaws.com/HobbitHouse/hobbitHouse4.webp",
  "https://airdnd-fullstack-prj-seeds.s3.amazonaws.com/HobbitHouse/hobbitHouse5.jpeg"
]

listing2_photo_urls.each_with_index do |url, index|
  listing2.photos.attach(
    io: URI.open(url),
    filename: "photo_#{index + 1}"
  )
end

#3
listing3 = Listing.create!(
  host_id: 2,
  address: "101 Maple Lane, Miami, FL 33101",
  title: "Wizard's Cottage",
  description: "Behold this peculiar 'Witchy Cottage,' a maddening hodgepodge of mystical oddities and endless headaches. From the crooked, leaning walls that defy all logic to the stubborn creaks and groans that serve as the house's morning serenade, it's a nightmare wrapped in enchanted confusion. The self-refilling cauldron in the kitchen? More trouble than it's worth. And don't get me started on the talking portraits that offer unsolicited advice. I've had enough of this chaotic abode, and if you have any sense, you'll stay far, far away! So its 50% off atm",
  num_beds: 3,
  num_bedrooms: 2,
  number_bathrooms: 2,
  price: 50.0,
  has_ac: true,
  has_wifi: true,
  has_pets_allowed: false,
  has_washer_dryer: true,
  latitude: 42.5232,
  longitude: -70.8862
)

listing3_photo_urls = [
  "https://airdnd-fullstack-prj-seeds.s3.amazonaws.com/WizardCottage/WizardCottage1.jpeg",
  "https://airdnd-fullstack-prj-seeds.s3.amazonaws.com/WizardCottage/WizardCottage2.jpeg",
  "https://airdnd-fullstack-prj-seeds.s3.amazonaws.com/WizardCottage/WizardCottage3.webp",
  "https://airdnd-fullstack-prj-seeds.s3.amazonaws.com/WizardCottage/WizardCottage4.jpeg",
  "https://airdnd-fullstack-prj-seeds.s3.amazonaws.com/WizardCottage/WizardCottage5.jpeg"
]

listing3_photo_urls.each_with_index do |url, index|
  listing3.photos.attach(
    io: URI.open(url),
    filename: "photo_#{index + 1}"
  )
end


#4
listing4 = Listing.create!(
  host_id: 6,
  address: "234 Pine Street, San Francisco, CA 94101",
  title: "Candy Cabin",
  description: "🍭 Step into the Enchanted Candy Cabin, a place with secrets woven by a mysterious and delightful host. Immerse yourself in rooms adorned with gingerbread, marshmallow-soft beds, and a fireplace with secrets of its own. The kitchen is a candy maker's paradise, and outside, a forest holds hidden wonders, with candy mushrooms and peppermint flowers. Your hosts, with a touch of enchantment, are ready to make your stay truly magical. Book now for a sweet escape! 🍬🌲🏡",
  num_beds: 2,
  num_bedrooms: 1,
  number_bathrooms: 1,
  price: 1.55,
  has_ac: true,
  has_wifi: true,
  has_pets_allowed: true,
  has_washer_dryer: false,
  latitude: 47.8295,
  longitude: -123.6405
)

listing4_photo_urls = [
  "https://airdnd-fullstack-prj-seeds.s3.amazonaws.com/CandyCabin/CandyCabin1.jpeg",
  "https://airdnd-fullstack-prj-seeds.s3.amazonaws.com/CandyCabin/CandyCabin4.webp",
  "https://airdnd-fullstack-prj-seeds.s3.amazonaws.com/CandyCabin/CandyCabin2.webp",
  "https://airdnd-fullstack-prj-seeds.s3.amazonaws.com/CandyCabin/CandyCabin5.jpeg",
  "https://airdnd-fullstack-prj-seeds.s3.amazonaws.com/CandyCabin/CandyCabin3.jpeg"
]

listing4_photo_urls.each_with_index do |url, index|
  listing4.photos.attach(
    io: URI.open(url),
    filename: "photo_#{index + 1}"
  )
end

#5
listing5 = Listing.create!(
  host_id: 3,
  address: "567 Cedar Drive, Austin, TX 78701",
  title: "Atlantis Underwater Palace",
  description: "🌊 Behold the Kingdom of Atlantis, a realm veiled beneath the ocean's embrace, sculpted by the wisdom of its illustrious monarch. As you descend into the depths, be captivated by the coral castles and seashell-adorned throne room. Within, luxuriate in chambers with beds fit for royalty and dining halls resplendent with ocean's bounty.",
  num_beds: 7568,
  num_bedrooms: 4237,
  number_bathrooms: 4354,
  price: 99999.99,
  has_ac: false,
  has_wifi: false,
  has_pets_allowed: false,
  has_washer_dryer: false,
  latitude: 25.7772,
  longitude: -80.1865
)

listing5_photo_urls = [
  "https://airdnd-fullstack-prj-seeds.s3.amazonaws.com/Atlantis/Atlantis1.avif",
  "https://airdnd-fullstack-prj-seeds.s3.amazonaws.com/Atlantis/Atlantis5.webp",
  "https://airdnd-fullstack-prj-seeds.s3.amazonaws.com/Atlantis/Atlantis3.jpeg",
  "https://airdnd-fullstack-prj-seeds.s3.amazonaws.com/Atlantis/Atlantis2.jpeg",
  "https://airdnd-fullstack-prj-seeds.s3.amazonaws.com/Atlantis/Atlantis4.jpeg"
]

listing5_photo_urls.each_with_index do |url, index|
  listing5.photos.attach(
    io: URI.open(url),
    filename: "photo_#{index + 1}"
  )
end

# #6
listing6 = Listing.create!(
  host_id: 7,
  address: "890 Birch Boulevard, Seattle, WA 98101",
  title: "Dragon's Den Retreat",
  description: "Imagine living in a mystical cave, nestled amidst rugged mountains, with the heart of a dragon. This extraordinary abode offers an unparalleled blend of ancient allure and modern comfort. The cavernous interior boasts spacious chambers adorned with iridescent crystals, where sunlight dances on stone walls. Your own dragon's lair, complete with a subterranean hot spring and a treasure trove of geological wonders, awaits.",
  num_beds: 3,
  num_bedrooms: 2,
  number_bathrooms: 2,
  price: 190.0,
  has_ac: true,
  has_wifi: true,
  has_pets_allowed: false,
  has_washer_dryer: true,
  latitude: 40.0155,
  longitude: -105.2657
)

listing6_photo_urls = [
  "https://airdnd-fullstack-prj-seeds.s3.amazonaws.com/DragonDen/DragonDen1.jpeg",
  "https://airdnd-fullstack-prj-seeds.s3.amazonaws.com/DragonDen/DragonDen3.jpeg",
  "https://airdnd-fullstack-prj-seeds.s3.amazonaws.com/DragonDen/DragonDen4.webp",
  "https://airdnd-fullstack-prj-seeds.s3.amazonaws.com/DragonDen/DragonDen2.jpeg",
  "https://airdnd-fullstack-prj-seeds.s3.amazonaws.com/DragonDen/DragonDen5.jpg"
]

listing6_photo_urls.each_with_index do |url, index|
  listing6.photos.attach(
    io: URI.open(url),
    filename: "photo_#{index + 1}"
  )
end

# 7
listing7 = Listing.create!(
  host_id: 7,
  address: "1234 Willow Lane, Denver, CO 80201",
  title: "Enchanted Hillside Castle",
  description: "Introducing the 'Majestic Relic Castle' - it's the epitome of timeless charm! Sure, it's a bit weathered, but that just adds character, right? Step into a world of regal nostalgia where history meets opportunity. This castle might need a little TLC, but think of it as a blank canvas for your dreams. The grand hall may have seen more elegant days, but with a dash of imagination, it could host the grandest of galas! Plus, the spacious chambers offer unique airflow options (a.k.a. the open windows), and the garden, well, let's call it an 'untamed paradise.'",
  num_beds: 478,
  num_bedrooms: 323,
  number_bathrooms: 311,
  price: 10000.0,
  has_ac: true,
  has_wifi: true,
  has_pets_allowed: true,
  has_washer_dryer: true,
  latitude: 35.6030,
  longitude: -82.5542
)

listing7_photo_urls = [
  "https://airdnd-fullstack-prj-seeds.s3.amazonaws.com/Castle/Castle1.jpeg",
  "https://airdnd-fullstack-prj-seeds.s3.amazonaws.com/Castle/Castle5.jpeg",
  "https://airdnd-fullstack-prj-seeds.s3.amazonaws.com/Castle/Castle3.avif",
  "https://airdnd-fullstack-prj-seeds.s3.amazonaws.com/Castle/Castle4.jpeg",
  "https://airdnd-fullstack-prj-seeds.s3.amazonaws.com/Castle/Castle2.jpeg"
]

listing7_photo_urls.each_with_index do |url, index|
  listing7.photos.attach(
    io: URI.open(url),
    filename: "photo_#{index + 1}"
  )
end



# 8
listing8 = Listing.create!(
  host_id: 2,
  address: "42 Merlin's Way",
  title: "Wizard's Tower with a Magic Library",
  description: "Welcome to my venerable Wizard's Tower, a sanctuary of arcane wisdom and ancient enchantments. Ascend the spiraling staircases, and you'll find yourself amidst a trove of mystic knowledge and ethereal wonders. The walls, adorned with shimmering scrolls and starlit charts, whisper secrets of the cosmos. Gaze out the crystal windows, and you'll witness the dance of constellations, each one a tale of cosmic destiny. In the heart of the tower, an observatory reveals the very fabric of the universe, and the library contains tomes that hold answers to questions unasked. (Its larger on the inside...)",
  num_beds: 999999,
  num_bedrooms: 999999,
  number_bathrooms: 999999,
  price: 450.0,
  has_ac: true,
  has_wifi: true,
  has_pets_allowed: true,
  has_washer_dryer: true,
  latitude: 45.5122,
  longitude: -122.6587
)

listing8_photo_urls = [
  "https://airdnd-fullstack-prj-seeds.s3.amazonaws.com/WizardTower/WizardTower1.jpeg",
  "https://airdnd-fullstack-prj-seeds.s3.amazonaws.com/WizardTower/WizardTower3.jpeg",
  "https://airdnd-fullstack-prj-seeds.s3.amazonaws.com/WizardTower/WizardTower4.jpeg",
  "https://airdnd-fullstack-prj-seeds.s3.amazonaws.com/WizardTower/WizardTower5.jpeg",
  "https://airdnd-fullstack-prj-seeds.s3.amazonaws.com/WizardTower/WizardTower2.webp"
]

listing8_photo_urls.each_with_index do |url, index|
  listing8.photos.attach(
    io: URI.open(url),
    filename: "photo_#{index + 1}"
  )
end

#9
listing9 = Listing.create!(
  host_id: 7,
  address: "123 Magma Avenue, Volcano City, VC 98765",
  title: "Volcano View Retreat",
  description: "Escape to the fiery heart of nature and witness the majestic power of a real volcano up close. The 'Volcano View Retreat' offers you a once-in-a-lifetime opportunity to experience the thrill of living on the edge of a live volcano. Feel the rumble, see the sparks, and embrace the heat as you stay in this unique and adventurous location. (Please note: Lava flows and eruptions are part of the natural charm of this retreat.)",
  num_beds: 5,
  num_bedrooms: 2,
  number_bathrooms: 2,
  price: 99.99,
  has_ac: false,
  has_wifi: true,
  has_pets_allowed: true,
  has_washer_dryer: false,
  latitude: 25.9876,
  longitude: -90.1234
)

listing9_photo_urls = [
  "https://airdnd-fullstack-prj-seeds.s3.amazonaws.com/Volcano/Volcano1.jpeg",
  "https://airdnd-fullstack-prj-seeds.s3.amazonaws.com/Volcano/Volcano3.webp",
  "https://airdnd-fullstack-prj-seeds.s3.amazonaws.com/Volcano/Volcano2.jpeg",
  "https://airdnd-fullstack-prj-seeds.s3.amazonaws.com/Volcano/Volcano5.jpeg",
  "https://airdnd-fullstack-prj-seeds.s3.amazonaws.com/Volcano/Volcano4.jpeg"
]

listing9_photo_urls.each_with_index do |url, index|
  listing9.photos.attach(
    io: URI.open(url),
    filename: "photo_#{index + 1}"
  )
end

#10
listing10 = Listing.create!(
  host_id: 7,
  address: "42 Frosty Way, Arctic Village, AV 54321",
  title: "Arctic Tundra Getaway",
  description: "Experience the breathtaking beauty of the Arctic tundra in our cozy 'Arctic Tundra Getaway.' Nestled amidst a pristine frozen landscape, this retreat offers you a chance to witness the mesmerizing Northern Lights, explore icy landscapes, and observe unique Arctic wildlife. Embrace the serenity and stillness of this remote location.",
  num_beds: 7,
  num_bedrooms: 1,
  number_bathrooms: 1,
  price: 79.99,
  has_ac: false,
  has_wifi: true,
  has_pets_allowed: true,
  has_washer_dryer: true,
  latitude: 70.9876,
  longitude: -160.1234
)

listing10_photo_urls = [
  "https://airdnd-fullstack-prj-seeds.s3.amazonaws.com/ArcticTundra/ArcticTundra1.jpeg",
  "https://airdnd-fullstack-prj-seeds.s3.amazonaws.com/ArcticTundra/ArcticTundra4.jpeg",
  "https://airdnd-fullstack-prj-seeds.s3.amazonaws.com/ArcticTundra/ArcticTundra5.jpeg",
  "https://airdnd-fullstack-prj-seeds.s3.amazonaws.com/ArcticTundra/ArcticTundra2.jpeg",
  "https://airdnd-fullstack-prj-seeds.s3.amazonaws.com/ArcticTundra/ArcticTundra3.jpeg"
]

listing10_photo_urls.each_with_index do |url, index|
  listing10.photos.attach(
    io: URI.open(url),
    filename: "photo_#{index + 1}"
  )
end

#11
listing11 = Listing.create!(
  host_id: 7,
  address: "9 Riches Road, Gemstone Valley, GV 45678",
  title: "The Treasure Hunter's Inn",
  description: "Embark on a quest for riches and adventure at 'The Treasure Hunter's Inn.' This rustic inn is a gathering place for daring explorers seeking hidden treasures, ancient relics, and legendary artifacts. Explore labyrinthine caves, decipher cryptic maps, and bask in the camaraderie of fellow treasure hunters. (Beware of traps and puzzles along the way!)",
  num_beds: 36,
  num_bedrooms: 18,
  number_bathrooms: 18,
  price: 5149.99,
  has_ac: true,
  has_wifi: true,
  has_pets_allowed: false,
  has_washer_dryer: true,
  latitude: 35.1234,
  longitude: -110.7890
)

listing11_photo_urls = [
  "https://airdnd-fullstack-prj-seeds.s3.amazonaws.com/TreasureHunterInn/TreasureHunterInn1.jpeg",
  "https://airdnd-fullstack-prj-seeds.s3.amazonaws.com/TreasureHunterInn/TreasureHunterInn2.webp",
  "https://airdnd-fullstack-prj-seeds.s3.amazonaws.com/TreasureHunterInn/TreasureHunterInn5.avif",
  "https://airdnd-fullstack-prj-seeds.s3.amazonaws.com/TreasureHunterInn/TreasureHunterInn3.jpeg",
  "https://airdnd-fullstack-prj-seeds.s3.amazonaws.com/TreasureHunterInn/TreasureHunterInn4.jpeg"
]

listing11_photo_urls.each_with_index do |url, index|
  listing11.photos.attach(
    io: URI.open(url),
    filename: "photo_#{index + 1}"
  )
end

listing12 = Listing.create!(
  host_id: 2,
  address: "123 Mirage Lane, Sand Dune Oasis, SD 98765",
  title: "Elemental Mage's Oasis",
  description: "Discover the secrets of elemental magic amidst the endless sands at the 'Elemental Mage's Oasis.' This mystical desert retreat is a sanctuary of elemental mastery, where you can learn the ancient arts of fire, earth, air, and water magic. Immerse yourself in the desert's tranquility and harness the power of the elements",
  num_beds: 4,
  num_bedrooms: 2,
  number_bathrooms: 1,
  price: 129.99,
  has_ac: false,
  has_wifi: true,
  has_pets_allowed: true,
  has_washer_dryer: false,
  latitude: 29.5678,
  longitude: -105.4321
)

listing12_photo_urls = [
  "https://airdnd-fullstack-prj-seeds.s3.amazonaws.com/MageOasis/MageOasis1.jpeg",
  "https://airdnd-fullstack-prj-seeds.s3.amazonaws.com/MageOasis/MageOasis2.webp",
  "https://airdnd-fullstack-prj-seeds.s3.amazonaws.com/MageOasis/MageOasis5.webp",
  "https://airdnd-fullstack-prj-seeds.s3.amazonaws.com/MageOasis/MageOasis3.jpeg",
  "https://airdnd-fullstack-prj-seeds.s3.amazonaws.com/MageOasis/MageOasis4.jpeg"
]

listing12_photo_urls.each_with_index do |url, index|
  listing12.photos.attach(
    io: URI.open(url),
    filename: "photo_#{index + 1}"
  )
end


puts "Creating past reservation data foor demo_user..."
demo_user = User.find_by(email: 'demo@user.io')

if demo_user
  listing1 = Listing.find(1)  # Assuming you have a listing with ID 1
  listing2 = Listing.find(2)  # Assuming you have a listing with ID 2
  listing3 = Listing.find(3)
  listing4 = Listing.find(4)
  listing5 = Listing.find(5)  # Assuming you have a listing with ID 1
  listing6 = Listing.find(6)  # Assuming you have a listing with ID 2
  listing7 = Listing.find(7)
  listing8 = Listing.find(8)

  if listing1 && listing2 && listing3 && listing4 && listing5 && listing6 && listing7 && listing8

    # Current trips
    Reservation.create!(
      listing_id: listing5.id,  # Replace with the actual listing ID
      guest_id: demo_user.id,
      num_guests: 2,  # You can adjust the number of guests as needed
      total_price: (5 * listing5.price),  # You can adjust the price as needed
      start_date: '2022-01-06',
      end_date: '2030-01-10'
    )

    Reservation.create!(
      listing_id: listing6.id,  # Replace with the actual listing ID
      guest_id: demo_user.id,
      num_guests: 2,  # You can adjust the number of guests as needed
      total_price: (5 * listing6.price),  # You can adjust the price as needed
      start_date: '2022-01-06',
      end_date: '2030-01-10'
    )


    # Up comming trips
    Reservation.create!(
      listing_id: listing7.id,  # Replace with the actual listing ID
      guest_id: demo_user.id,
      num_guests: 2,  # You can adjust the number of guests as needed
      total_price: (5 * listing7.price),  # You can adjust the price as needed
      start_date: '2030-01-06',
      end_date: '2031-01-10'
    )

    Reservation.create!(
      listing_id: listing8.id,  # Replace with the actual listing ID
      guest_id: demo_user.id,
      num_guests: 2,  # You can adjust the number of guests as needed
      total_price: (5 * listing8.price),  # You can adjust the price as needed
      start_date: '2030-01-06',
      end_date: '2031-01-10'
    )


    # Past trips
    Reservation.create!(
      listing_id: listing1.id,  # Replace with the actual listing ID
      guest_id: demo_user.id,
      num_guests: 2,  # You can adjust the number of guests as needed
      total_price: (5 * listing1.price),  # You can adjust the price as needed
      start_date: '2021-01-06',
      end_date: '2021-01-10'
    )

    Reservation.create!(
      listing_id: listing2.id,  # Replace with the actual listing ID
      guest_id: demo_user.id,
      num_guests: 3,  # You can adjust the number of guests as needed
      total_price: (6 * listing2.price),  # You can adjust the price as needed
      start_date: '2021-03-15',
      end_date: '2021-03-20'
    )

    Reservation.create!(
      listing_id: listing3.id,  # Replace with the actual listing ID
      guest_id: demo_user.id,
      num_guests: 4,  # You can adjust the number of guests as needed
      total_price: (7 * listing3.price),  # You can adjust the price as needed
      start_date: '2021-05-24',
      end_date: '2021-05-30'
    )

    Reservation.create!(
      listing_id: listing4.id,
      guest_id: demo_user.id,
      num_guests: 2,  # You can adjust the number of guests as needed
      total_price: (4 * listing4.price),
      start_date: '2021-07-08',
      end_date: '2021-07-15',
    )

  else
    puts "One or more listings do not exist in the database. Please ensure all required listings are available."
  end

else
  puts "Demo user not found. Make sure the user with email 'demo@user.io' exists in your database."
end


puts "Creating past reservation data foor demo_user2 (wiz)..."
demo_user2 = User.find_by(email: 'demo@user2.io')

if demo_user2
  listing5 = Listing.find(5)  # Assuming you have a listing with ID 1
  listing6 = Listing.find(6)  # Assuming you have a listing with ID 2
  listing7 = Listing.find(7)
  listing8 = Listing.find(8)

  if listing5 && listing6 && listing7 && listing8

    Reservation.create!(
      listing_id: listing5.id,  # Replace with the actual listing ID
      guest_id: demo_user2.id,
      num_guests: 2,  # You can adjust the number of guests as needed
      total_price: (5 * listing5.price),  # You can adjust the price as needed
      start_date: '2021-01-06',
      end_date: '2021-01-10'
    )

    Reservation.create!(
      listing_id: listing6.id,  # Replace with the actual listing ID
      guest_id: demo_user2.id,
      num_guests: 3,  # You can adjust the number of guests as needed
      total_price: (6 * listing6.price),  # You can adjust the price as needed
      start_date: '2021-03-15',
      end_date: '2021-03-20'
    )

    Reservation.create!(
      listing_id: listing7.id,  # Replace with the actual listing ID
      guest_id: demo_user2.id,
      num_guests: 4,  # You can adjust the number of guests as needed
      total_price: (7 * listing7.price),  # You can adjust the price as needed
      start_date: '2021-05-24',
      end_date: '2021-05-30'
    )

    Reservation.create!(
      listing_id: listing8.id,
      guest_id: demo_user2.id,
      num_guests: 2,  # You can adjust the number of guests as needed
      total_price: (4 * listing8.price),
      start_date: '2021-07-08',
      end_date: '2021-07-15',
    )

  else
    puts "One or more listings do not exist in the database. Please ensure all required listings are available."
  end

else
  puts "Demo user not found. Make sure the user with email 'demo@user.io' exists in your database."
end


puts "Done!"