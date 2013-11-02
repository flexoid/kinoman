class FavoriteMovie < ActiveRecord::Base
  belongs_to :user
  belongs_to :movie
  belongs_to :favorites_list

  validates :movie, :user, :favorites_list, presence: true
  validates :movie_id, uniqueness: {scope: :favorites_list_id}
  validate :same_user_as_list

  private

    def same_user_as_list
      if favorites_list && !favorites_list.global? && favorites_list.user_id != user_id
        errors[:user] << "must be the same as list user if list isn't global"
      end
    end
end
