uk, usa = Country.create!([{title: 'USA'}, {title: 'UK'}])

%w(Action Adventure Mystery Sci-Fi Thriller Crime Drama).
  map { |g| Genre.create!(title: g) }

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

dicaprio = Person.create!(
  name: 'Leonardo DiCaprio',
  birthdate: Date.today - 39.years,
  birthplace: 'Hollywood, Los Angeles, California, USA'
)

murphy = Person.create!(
  name: 'Cillian Murphy',
  birthdate: Date.today - 37.years,
  birthplace: 'Douglas, Cork, Ireland'
)

dark_knight = Movie.create!(
  title: 'The Dark Knight',
  year: 2008,
  budget: 185_000_000,
  rating: 'PG-13',
  duration: 152
)

dark_knight.countries << [uk, usa]
dark_knight.genres << Genre.where(title: %w(Action Crime Drama Thriller))

inception = Movie.create!(
  title: 'Inception',
  year: 2010,
  budget: 160_000_000,
  rating: 'PG-13',
  duration: 148
)

inception.countries << [uk, usa]
inception.genres << Genre.where(title: %w(Action Thriller Adventure Mystery Sci-Fi))

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
