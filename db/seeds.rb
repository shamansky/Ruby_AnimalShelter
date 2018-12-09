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
    'nickname' => "Destroyer of Worlds",
    'age' => 3,
    'admission_date' => '22.11.2018',
    'adoptability' => 'FALSE',
    'species' => 'Dog',
    'breed' => 'Rottweiler',
    'owner_id' => nil
    })



binding.pry

nil
