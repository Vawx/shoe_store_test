
class Shoe < ActiveRecord::Base
  has_and_belongs_to_many :stores
  validates_uniqueness_of :name
  validates :name, presence: true
  before_save :capitalize_store_name

  private
  def capitalize_store_name
    split_name = name.split(" ")
    split_name.each do |word|
      word.capitalize!
    end
    self.name = split_name.join(" ")
  end
end
