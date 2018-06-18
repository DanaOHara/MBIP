json.extract! resource, :id, :course, :name, :intro, :introformat, :tobemigrated, :legacyfiles, :legacyfileslast, :display, :displayoptions, :filterfiles, :revision, :timemodified, :created_at, :updated_at
json.url resource_url(resource, format: :json)
