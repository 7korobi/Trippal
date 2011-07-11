# -*- coding: utf-8 -*- 

require './spec/spec_helper'

describe Article do
  it "should create" do
    article = Article.new(
        photo_geo: [139.703865, 35.646207],
        photo_file_name: 'test.jpg', 
        photo_name: 'test', 
        photo_content_type: 'image/jpeg',
        photo_file_size: 0,
        description: '位置情報は九州を設定して、恵比寿でプレゼンテーションをしたときのタグクラウド',
        at: Time.now
    )
    article.save
    p article
    article.destroy
  end
end



