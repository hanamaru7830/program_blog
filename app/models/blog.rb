class Blog < ApplicationRecord

  def self.search(search)
    if search != ""
      Blog.where(['title LIKE(?) OR category LIKE(?) OR body LIKE(?)', "%#{search}%", "%#{search}%", "%#{search}%"])
    else
      redirect_to blogs_path
    end
  end

end
