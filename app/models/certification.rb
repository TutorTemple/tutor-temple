class Certification < ApplicationRecord
  belongs_to :profile

  mount_uploader :attachment, AttachmentUploader

  validates :name, :institution, :termination_date, presence: true
end
