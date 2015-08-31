class Art < ActiveRecord::Base
  belongs_to :admin
  has_many :comments, dependent: :destroy

  has_attached_file :image,
                    styles: { standard: ["210x130#", :jpg] },
                    storage: :s3,
                    s3_credentials: 'aws.yaml',
                    bucket: "secchant.aws.bucket",
                    url: 'secchant.aws.bucket.s3.amazonaws.com',
                    path: "uploads/#{SecureRandom.uuid}",
                    s3_host_name: 's3-us-west-1.amazonaws.com'

  validates_attachment :image,
                        content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }
end
