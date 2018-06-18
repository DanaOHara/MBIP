json.extract! forum_discussion, :id, :course, :forum, :name, :firstpost, :userid, :groupid, :assessed, :timemodified, :usermodified, :timestart, :timeend, :created_at, :updated_at
json.url forum_discussion_url(forum_discussion, format: :json)
