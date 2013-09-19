nolan = Person.create!(
  name: 'Christopher Nolan',
  birthdate: Date.today - 40.years,
  birthplace: 'London, England, UK'
)

bale = Person.create!(
  name: 'Christian Bale',
  birthdate: Date.today - 39.years,
  birthplace: 'Haverfordwest, Pembrokeshire, Wales, UK'
)

ledger = Person.create!(
  name: 'Heath Ledger',
  birthdate: Date.today - 35.years,
  birthplace: 'Manhattan, New York City, New York, USA'
)

dark_knight = Movie.create!(
  title: 'The Dark Knight',
  year: 2008,
  budget: 185_000_000,
  rating: 'PG-13',
  duration: 152
)

dark_knight.directors << nolan.becomes(Director)

dark_knight.actors << bale.becomes(Actor)
dark_knight.movie_people.where(person_id: bale.id).first.create_role!(title: 'Bruce Wayne')

dark_knight.actors << ledger.becomes(Actor)
dark_knight.movie_people.where(person_id: ledger.id).first.create_role!(title: 'Joker')
