class CommentSerializer < ApplicationSerializer
  include MarkdownHelper

  has_one :user, serializer: UserSerializer
  attributes :body, :created_at, :markdown_body, :news_feed_item_id, :hearts_count

  def user
    User.find(object.user_id)
  end

  def markdown_body
    markdown(body)
  end
end