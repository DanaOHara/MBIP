json.extract! assignment_submission, :id, :assignment, :userid, :timecreated, :timemodified, :numfiles, :data1, :data2, :grade, :submissioncomment, :format, :teacher, :timemarked, :mailed, :created_at, :updated_at
json.url assignment_submission_url(assignment_submission, format: :json)
