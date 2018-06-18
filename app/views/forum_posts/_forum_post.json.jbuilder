json.extract! forum_post, :id, :discussion, :parent, :userid, :created, :modified, :mailed, :subject, :message, :messageformat, :messagetrust, :attachment, :totalscore, :mailnow, :created_at, :updated_at
json.url forum_post_url(forum_post, format: :json)
