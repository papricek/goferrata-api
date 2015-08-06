json.comment do
  json.id          @comment.id
  json.text        @comment.text
  json.user_id     @comment.user_id
  json.point_id    @comment.point_id
end
