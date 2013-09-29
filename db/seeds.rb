User.create!(email: 'admin@example.com', password: 'admin@example.com',
  username: 'admin', role: User::ADMIN)
User.create!(email: 'flexoid@example.com', password: 'flexoid@example.com',
  username: 'flexoid', role: User::USER)

uk, usa = Country.create!([{title: 'USA'}, {title: 'UK'}])

%w(Action Adventure Mystery Sci-Fi Thriller Crime Drama).
  map { |g| Genre.create!(title: g) }

nolan = Person.create!(
  name: 'Christopher Nolan',
  birthdate: Date.today - 40.years,
  birthplace: 'London, England, UK'
)
nolan.photo = File.open(Rails.root + 'db/files/nolan.jpg')
nolan.save!

bale = Person.create!(
  name: 'Christian Bale',
  birthdate: Date.today - 39.years,
  birthplace: 'Haverfordwest, Pembrokeshire, Wales, UK'
)
bale.photo = File.open(Rails.root + 'db/files/bale.jpg')
bale.save!

ledger = Person.create!(
  name: 'Heath Ledger',
  birthdate: Date.today - 35.years,
  birthplace: 'Manhattan, New York City, New York, USA'
)
ledger.photo = File.open(Rails.root + 'db/files/ledger.jpg')
ledger.save!

dicaprio = Person.create!(
  name: 'Leonardo DiCaprio',
  birthdate: Date.today - 39.years,
  birthplace: 'Hollywood, Los Angeles, California, USA'
)
dicaprio.photo = File.open(Rails.root + 'db/files/dicaprio.jpg')
dicaprio.save!

murphy = Person.create!(
  name: 'Cillian Murphy',
  birthdate: Date.today - 37.years,
  birthplace: 'Douglas, Cork, Ireland'
)
murphy.photo = File.open(Rails.root + 'db/files/murphy.jpg')
murphy.save!

dark_knight = Movie.create!(
  title: 'The Dark Knight',
  year: 2008,
  budget: 185_000_000,
  rating: 'PG-13',
  duration: 152
)

dark_knight.countries << [uk, usa]
dark_knight.genres << Genre.where(title: %w(Action Crime Drama Thriller))
dark_knight.poster = File.open(Rails.root + 'db/files/dark_knight.jpg')
dark_knight.save!

inception = Movie.create!(
  title: 'Inception',
  year: 2010,
  budget: 160_000_000,
  rating: 'PG-13',
  duration: 148
)

inception.countries << [uk, usa]
inception.genres << Genre.where(title: %w(Action Thriller Adventure Mystery Sci-Fi))
inception.poster = File.open(Rails.root + 'db/files/inception.jpg')
inception.save!

dark_knight.directors << nolan.becomes(Director)

dark_knight.actors << bale.becomes(Actor)
dark_knight.movie_people.where(person_id: bale.id).first.create_role!(title: 'Bruce Wayne')

dark_knight.actors << ledger.becomes(Actor)
dark_knight.movie_people.where(person_id: ledger.id).first.create_role!(title: 'Joker')

dark_knight.actors << murphy.becomes(Actor)
dark_knight.movie_people.where(person_id: murphy.id).first.create_role!(title: 'Scarecrow')


inception.directors << nolan.becomes(Director)

inception.actors << dicaprio.becomes(Actor)
inception.movie_people.where(person_id: dicaprio.id).first.create_role!(title: 'Cobb')

inception.actors << murphy.becomes(Actor)
inception.movie_people.where(person_id: murphy.id).first.create_role!(title: 'Robert Fischer')
