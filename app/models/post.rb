class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments

  #you don't need accepts_nested_attributes_for since you are customizing the methods below

  def categories_attributes=(category_attributes)
    category_attributes.each do |i, cat_attrs|
      category = Category.find_or_create_by(cat_attrs)
      self.post_categories.build(category: category)
      #self.categories << category this way is not necessary, line above is more efficient
    end
  end
end
