require 'spec_helper'

describe Post do
  describe 'permalinks' do
    title = 'test_permalink'
    FactoryGirl.create(:post, {title: title})
    uniq_permalink = Post.get_unique_permalink(title)

    it { Post.exists?(permalink: uniq_permalink).should === false }

  end
end
