class Comment < ApplicationRecord
 mount_uploader :image, ImageUploader
 validates:username, presence:true, length:{minimum:5}
 validates:body, presence:true, length:{minimum:5}
  belongs_to :post
end
