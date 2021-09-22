class AddResolutionRefToBlogs < ActiveRecord::Migration[5.2]
  def change
    add_reference :blogs, :resolution, foreign_key: true
  end
end
