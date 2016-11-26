class TagsUser < ApplicationRecord
  belongs_to :user
  belongs_to :tag

  validates :tag_id, uniqueness: { scope: :user_id,
                                 message: "One user can only create one tag for themselves." }
end