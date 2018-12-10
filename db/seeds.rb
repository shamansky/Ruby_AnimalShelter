require_relative('../models/owner.rb')
require_relative('../models/pet.rb')
require('pry')

Pet.delete_all()
Owner.delete_all()


owner1 = Owner.new({
  'first_name' => 'Malcom',
  'last_name' => 'Reynolds',
  'age' => 31,
  'location' => 'Glasgow'
  })

owner1.save()

owner2 = Owner.new({
  'first_name' => 'Jayne',
  'last_name' => 'Cobb',
  'age' => 28,
  'location' => 'Glasgow'
  })

owner2.save()

owner3 = Owner.new({
  'first_name' => 'Inara',
  'last_name' => 'Serra',
  'age' => 27,
  'location' => 'Edinburgh'
  })

owner3.save()

owner4 = Owner.new({
  'first_name' => 'River',
  'last_name' => 'Tam',
  'age' => 19,
  'location' => 'Gairloch'
  })

owner4.save()

  pet1 = Pet.new({
    'name' => 'Boogie',
    'nickname' => '"Destroyer of Worlds"',
    'age' => 3,
    'admission_date' => '22.11.2018',
    'adoptability' => TRUE,
    'species' => 'Dog',
    'breed' => 'Rottweiler',
    'owner_id' => owner3.id
    })

pet1.save()

  pet2 = Pet.new({
    'name' => 'Gigi',
    'nickname' => '"Wrath of God"',
    'age' => 9,
    'admission_date' => '01.06.2018',
    'adoptability' => TRUE,
    'species' => 'Cat',
    'breed' => 'British Shorthair',
    'owner_id' => owner4.id
      })

pet2.save()

pet3 = Pet.new({
  'name' => 'Alex',
  'nickname' => '"IceCube"',
  'age' => 1,
  'admission_date' => '05.11.2018',
  'adoptability' => TRUE,
  'species' => 'Exotic Animals',
  'breed' => 'Boa Constrictor',
  'owner_id' => owner2.id
  })

pet3.save()

pet4 = Pet.new({
  'name' => 'FeeFee',
  'nickname' => '"The Smaug"',
  'age' => 20,
  'admission_date' => '29.11.2018',
  'adoptability' => TRUE,
  'species' => 'Exotic Animals',
  'breed' => 'Iguana',
  'owner_id' => owner2.id
  })

pet4.save()

pet5 = Pet.new({
  'name' => 'Paco',
  'nickname' => '"El Loco"',
  'age' => 6,
  'admission_date' => '21.11.2018',
  'adoptability' => TRUE,
  'species' => 'Exotic Animals',
  'breed' => 'Scarlet macaw',
  'owner_id' => owner1.id
  })

pet5.save()


binding.pry

nil
