class Art < ActiveRecord::Base
  belongs_to :admin
  has_many :comments, dependent: :destroy

  has_attached_file :image,
                    storage: :s3,
                    s3_credentials: 'aws.yaml',
                    bucket: "secchant.aws.bucket"

  validates_attachment :image,
                        content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }
end
