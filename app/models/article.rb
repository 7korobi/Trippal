# -*- coding: utf-8 -*- 
class Article 
  include Trippal
  field :photo_geo, type: Array
  field :photo_file_name
  field :photo_file_size
  field :photo_content_type
  field :photo_name
  timestamp :at

  referenced_in :user, inverse_of: :articles
  references_and_referenced_in_many :tags
  
  def description
    ""
  end
  def description=(str)
    Tag.find_or_create_all(str).each do |tag|
      self.tags << tag unless self.tags.member? tag
    end
  end
end

class Article
  def self.migrate
    destroy_all

    images = 'public/'
    Dir.glob(images + 'images/trippy/*').each do |name|
      name[images]='/'
      self.new(
        photo_x:139.703865,
        photo_y: 35.646207,
        photo_file_name: name, 
        photo_name: 'test', 
        photo_content_type: 'image/jpeg',
        photo_updated_at: Time.now,
        photo_file_size: 0,
        description: '恵比寿でしたプレゼンテーション'
      ).save
    end
  end
end
