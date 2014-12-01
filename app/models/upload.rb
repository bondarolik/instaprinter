class Upload < ActiveRecord::Base
  has_attached_file :uploaded_file, styles: { original: "1500x1500>", large: "1000x1000>", medium: "500x500>", small: "200x200>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end