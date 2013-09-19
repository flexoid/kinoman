class MoviePerson < ActiveRecord::Base

  belongs_to :movie
  belongs_to :person, polymorphic: true
  has_one :role

  before_save :fix_person_type

  private

    # Hack, for some reason rails doesn't do this correctly
    def fix_person_type
      self.person_type = self.person.class.name
    end
end
