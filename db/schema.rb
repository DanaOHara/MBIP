# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_08_12_201417) do

  create_table "assign", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "This table saves information about an instance of mod_assign", force: :cascade do |t|
    t.bigint "course", default: 0, null: false
    t.string "name", default: "", null: false
    t.text "intro", limit: 4294967295, null: false
    t.integer "introformat", limit: 2, default: 0, null: false
    t.integer "alwaysshowdescription", limit: 1, default: 0, null: false
    t.integer "nosubmissions", limit: 1, default: 0, null: false
    t.integer "submissiondrafts", limit: 1, default: 0, null: false
    t.integer "sendnotifications", limit: 1, default: 0, null: false
    t.integer "sendlatenotifications", limit: 1, default: 0, null: false
    t.bigint "duedate", default: 0, null: false
    t.bigint "allowsubmissionsfromdate", default: 0, null: false
    t.bigint "grade", default: 0, null: false
    t.bigint "timemodified", default: 0, null: false
    t.integer "requiresubmissionstatement", limit: 1, default: 0, null: false
    t.integer "completionsubmit", limit: 1, default: 0, null: false
    t.bigint "cutoffdate", default: 0, null: false
    t.integer "teamsubmission", limit: 1, default: 0, null: false
    t.integer "requireallteammemberssubmit", limit: 1, default: 0, null: false
    t.bigint "teamsubmissiongroupingid", default: 0, null: false
    t.integer "blindmarking", limit: 1, default: 0, null: false
    t.integer "revealidentities", limit: 1, default: 0, null: false
    t.string "attemptreopenmethod", limit: 10, default: "none", null: false
    t.integer "maxattempts", limit: 3, default: -1, null: false
    t.integer "markingworkflow", limit: 1, default: 0, null: false
    t.integer "markingallocation", limit: 1, default: 0, null: false
    t.integer "sendstudentnotifications", limit: 1, default: 1, null: false
    t.index ["course"], name: "assi_cou_ix"
    t.index ["teamsubmissiongroupingid"], name: "assi_tea_ix"
  end

  create_table "assign_grades", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Grading information about a single assignment submission.", force: :cascade do |t|
    t.bigint "assignment", default: 0, null: false
    t.bigint "userid", default: 0, null: false
    t.bigint "timecreated", default: 0, null: false
    t.bigint "timemodified", default: 0, null: false
    t.bigint "grader", default: 0, null: false
    t.decimal "grade", precision: 10, scale: 5, default: "0.0"
    t.bigint "attemptnumber", default: 0, null: false
    t.index ["assignment", "userid", "attemptnumber"], name: "assigrad_assuseatt_uix", unique: true
    t.index ["assignment"], name: "assigrad_ass_ix"
    t.index ["attemptnumber"], name: "assigrad_att_ix"
    t.index ["userid"], name: "assigrad_use_ix"
  end

  create_table "assign_plugin_config", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Config data for an instance of a plugin in an assignment.", force: :cascade do |t|
    t.bigint "assignment", default: 0, null: false
    t.string "plugin", limit: 28, default: "", null: false
    t.string "subtype", limit: 28, default: "", null: false
    t.string "name", limit: 28, default: "", null: false
    t.text "value", limit: 4294967295
    t.index ["assignment"], name: "assiplugconf_ass_ix"
    t.index ["name"], name: "assiplugconf_nam_ix"
    t.index ["plugin"], name: "assiplugconf_plu_ix"
    t.index ["subtype"], name: "assiplugconf_sub_ix"
  end

  create_table "assign_submission", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "This table keeps information about student interactions with", force: :cascade do |t|
    t.bigint "assignment", default: 0, null: false
    t.bigint "userid", default: 0, null: false
    t.bigint "timecreated", default: 0, null: false
    t.bigint "timemodified", default: 0, null: false
    t.string "status", limit: 10
    t.bigint "groupid", default: 0, null: false
    t.bigint "attemptnumber", default: 0, null: false
    t.index ["assignment", "userid", "groupid", "attemptnumber"], name: "assisubm_assusegroatt_uix", unique: true
    t.index ["assignment"], name: "assisubm_ass_ix"
    t.index ["attemptnumber"], name: "assisubm_att_ix"
    t.index ["userid"], name: "assisubm_use_ix"
  end

  create_table "assign_user_flags", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "List of flags that can be set for a single user in a single ", force: :cascade do |t|
    t.bigint "userid", default: 0, null: false
    t.bigint "assignment", default: 0, null: false
    t.bigint "locked", default: 0, null: false
    t.integer "mailed", limit: 2, default: 0, null: false
    t.bigint "extensionduedate", default: 0, null: false
    t.string "workflowstate", limit: 20
    t.bigint "allocatedmarker", default: 0, null: false
    t.index ["assignment"], name: "assiuserflag_ass_ix"
    t.index ["mailed"], name: "assiuserflag_mai_ix"
    t.index ["userid"], name: "assiuserflag_use_ix"
  end

  create_table "assign_user_mapping", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Map an assignment specific id number to a user", force: :cascade do |t|
    t.bigint "assignment", default: 0, null: false
    t.bigint "userid", default: 0, null: false
    t.index ["assignment"], name: "assiusermapp_ass_ix"
    t.index ["userid"], name: "assiusermapp_use_ix"
  end

  create_table "assignfeedback_comments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Text feedback for submitted assignments", force: :cascade do |t|
    t.bigint "assignment", default: 0, null: false
    t.bigint "grade", default: 0, null: false
    t.text "commenttext", limit: 4294967295
    t.integer "commentformat", limit: 2, default: 0, null: false
    t.index ["assignment"], name: "assicomm_ass_ix"
    t.index ["grade"], name: "assicomm_gra_ix"
  end

  create_table "assignfeedback_editpdf_annot", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "stores annotations added to pdfs submitted by students", force: :cascade do |t|
    t.bigint "gradeid", default: 0, null: false
    t.bigint "pageno", default: 0, null: false
    t.bigint "x", default: 0
    t.bigint "y", default: 0
    t.bigint "endx", default: 0
    t.bigint "endy", default: 0
    t.text "path", limit: 4294967295
    t.string "type", limit: 10, default: "line"
    t.string "colour", limit: 10, default: "black"
    t.integer "draft", limit: 1, default: 1, null: false
    t.index ["gradeid", "pageno"], name: "assieditanno_grapag_ix"
    t.index ["gradeid"], name: "assieditanno_gra_ix"
  end

  create_table "assignfeedback_editpdf_cmnt", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Stores comments added to pdfs", force: :cascade do |t|
    t.bigint "gradeid", default: 0, null: false
    t.bigint "x", default: 0
    t.bigint "y", default: 0
    t.bigint "width", default: 120
    t.text "rawtext", limit: 4294967295
    t.bigint "pageno", default: 0, null: false
    t.string "colour", limit: 10, default: "black"
    t.integer "draft", limit: 1, default: 1, null: false
    t.index ["gradeid", "pageno"], name: "assieditcmnt_grapag_ix"
    t.index ["gradeid"], name: "assieditcmnt_gra_ix"
  end

  create_table "assignfeedback_editpdf_quick", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Stores teacher specified quicklist comments", force: :cascade do |t|
    t.bigint "userid", default: 0, null: false
    t.text "rawtext", limit: 4294967295, null: false
    t.bigint "width", default: 120, null: false
    t.string "colour", limit: 10, default: "yellow"
    t.index ["userid"], name: "assieditquic_use_ix"
  end

  create_table "assignfeedback_file", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Stores info about the number of files submitted by a student", force: :cascade do |t|
    t.bigint "assignment", default: 0, null: false
    t.bigint "grade", default: 0, null: false
    t.bigint "numfiles", default: 0, null: false
    t.index ["assignment"], name: "assifile_ass2_ix"
    t.index ["grade"], name: "assifile_gra_ix"
  end

  create_table "assignment", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Defines assignments", force: :cascade do |t|
    t.bigint "course", default: 0, null: false
    t.string "name", default: "", null: false
    t.text "intro", limit: 4294967295, null: false
    t.integer "introformat", limit: 2, default: 0, null: false
    t.string "assignmenttype", limit: 50, default: "", null: false
    t.integer "resubmit", limit: 1, default: 0, null: false
    t.integer "preventlate", limit: 1, default: 0, null: false
    t.integer "emailteachers", limit: 1, default: 0, null: false
    t.bigint "var1", default: 0
    t.bigint "var2", default: 0
    t.bigint "var3", default: 0
    t.bigint "var4", default: 0
    t.bigint "var5", default: 0
    t.bigint "maxbytes", default: 100000, null: false
    t.bigint "timedue", default: 0, null: false
    t.bigint "timeavailable", default: 0, null: false
    t.bigint "grade", default: 0, null: false
    t.bigint "timemodified", default: 0, null: false
    t.index ["course"], name: "assi_cou2_ix"
  end

  create_table "assignment_submissions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Info about submitted assignments", force: :cascade do |t|
    t.bigint "assignment", default: 0, null: false
    t.bigint "userid", default: 0, null: false
    t.bigint "timecreated", default: 0, null: false
    t.bigint "timemodified", default: 0, null: false
    t.bigint "numfiles", default: 0, null: false
    t.text "data1", limit: 4294967295
    t.text "data2", limit: 4294967295
    t.bigint "grade", default: 0, null: false
    t.text "submissioncomment", limit: 4294967295, null: false
    t.integer "format", limit: 2, default: 0, null: false
    t.bigint "teacher", default: 0, null: false
    t.bigint "timemarked", default: 0, null: false
    t.boolean "mailed", default: false, null: false
    t.index ["assignment"], name: "assisubm_ass2_ix"
    t.index ["mailed"], name: "assisubm_mai_ix"
    t.index ["timemarked"], name: "assisubm_tim_ix"
    t.index ["userid"], name: "assisubm_use2_ix"
  end

  create_table "assignment_upgrade", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Info about upgraded assignments", force: :cascade do |t|
    t.bigint "oldcmid", default: 0, null: false
    t.bigint "oldinstance", default: 0, null: false
    t.bigint "newcmid", default: 0, null: false
    t.bigint "newinstance", default: 0, null: false
    t.bigint "timecreated", default: 0, null: false
    t.index ["oldcmid"], name: "assiupgr_old_ix"
    t.index ["oldinstance"], name: "assiupgr_old2_ix"
  end

  create_table "assignsubmission_file", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Info about file submissions for assignments", force: :cascade do |t|
    t.bigint "assignment", default: 0, null: false
    t.bigint "submission", default: 0, null: false
    t.bigint "numfiles", default: 0, null: false
    t.index ["assignment"], name: "assifile_ass_ix"
    t.index ["submission"], name: "assifile_sub_ix"
  end

  create_table "assignsubmission_onlinetext", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Info about onlinetext submission", force: :cascade do |t|
    t.bigint "assignment", default: 0, null: false
    t.bigint "submission", default: 0, null: false
    t.text "onlinetext", limit: 4294967295
    t.integer "onlineformat", limit: 2, default: 0, null: false
    t.index ["assignment"], name: "assionli_ass_ix"
    t.index ["submission"], name: "assionli_sub_ix"
  end

  create_table "backup_controllers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "To store the backup_controllers as they are used", force: :cascade do |t|
    t.string "backupid", limit: 32, default: "", null: false
    t.string "operation", limit: 20, default: "backup", null: false
    t.string "type", limit: 10, default: "", null: false
    t.bigint "itemid", null: false
    t.string "format", limit: 20, default: "", null: false
    t.integer "interactive", limit: 2, null: false
    t.integer "purpose", limit: 2, null: false
    t.bigint "userid", null: false
    t.integer "status", limit: 2, null: false
    t.integer "execution", limit: 2, null: false
    t.bigint "executiontime", null: false
    t.string "checksum", limit: 32, default: "", null: false
    t.bigint "timecreated", null: false
    t.bigint "timemodified", null: false
    t.text "controller", limit: 4294967295, null: false
    t.index ["backupid"], name: "backcont_bac_uix", unique: true
    t.index ["type", "itemid"], name: "backcont_typite_ix"
    t.index ["userid"], name: "backcont_use_ix"
  end

  create_table "backup_courses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "To store every course backup status", force: :cascade do |t|
    t.bigint "courseid", default: 0, null: false
    t.bigint "laststarttime", default: 0, null: false
    t.bigint "lastendtime", default: 0, null: false
    t.string "laststatus", limit: 1, default: "5", null: false
    t.bigint "nextstarttime", default: 0, null: false
    t.index ["courseid"], name: "backcour_cou_uix", unique: true
  end

  create_table "backup_logs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "To store all the logs from backup and restore operations (by", force: :cascade do |t|
    t.string "backupid", limit: 32, default: "", null: false
    t.integer "loglevel", limit: 2, null: false
    t.text "message", limit: 4294967295, null: false
    t.bigint "timecreated", null: false
    t.index ["backupid", "id"], name: "backlogs_bacid_uix", unique: true
    t.index ["backupid"], name: "backlogs_bac_ix"
  end

  create_table "badge", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Defines badge", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.text "description", limit: 4294967295
    t.bigint "timecreated", default: 0, null: false
    t.bigint "timemodified", default: 0, null: false
    t.bigint "usercreated", null: false
    t.bigint "usermodified", null: false
    t.string "issuername", default: "", null: false
    t.string "issuerurl", default: "", null: false
    t.string "issuercontact"
    t.bigint "expiredate"
    t.bigint "expireperiod"
    t.boolean "type", default: true, null: false
    t.bigint "courseid"
    t.text "message", limit: 4294967295, null: false
    t.text "messagesubject", limit: 4294967295, null: false
    t.boolean "attachment", default: true, null: false
    t.boolean "notification", default: true, null: false
    t.boolean "status", default: false, null: false
    t.bigint "nextcron"
    t.index ["courseid"], name: "badg_cou_ix"
    t.index ["type"], name: "badg_typ_ix"
    t.index ["usercreated"], name: "badg_use2_ix"
    t.index ["usermodified"], name: "badg_use_ix"
  end

  create_table "badge_backpack", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Defines settings for connecting external backpack", force: :cascade do |t|
    t.bigint "userid", default: 0, null: false
    t.string "email", limit: 100, default: "", null: false
    t.string "backpackurl", default: "", null: false
    t.bigint "backpackuid", null: false
    t.boolean "autosync", default: false, null: false
    t.string "password", limit: 50
    t.index ["userid"], name: "badgback_use_ix"
  end

  create_table "badge_criteria", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Defines criteria for issuing badges", force: :cascade do |t|
    t.bigint "badgeid", default: 0, null: false
    t.bigint "criteriatype"
    t.boolean "method", default: true, null: false
    t.index ["badgeid", "criteriatype"], name: "badgcrit_badcri_uix", unique: true
    t.index ["badgeid"], name: "badgcrit_bad_ix"
    t.index ["criteriatype"], name: "badgcrit_cri_ix"
  end

  create_table "badge_criteria_met", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Defines criteria that were met for an issued badge", force: :cascade do |t|
    t.bigint "issuedid"
    t.bigint "critid", null: false
    t.bigint "userid", null: false
    t.bigint "datemet", null: false
    t.index ["critid"], name: "badgcritmet_cri_ix"
    t.index ["issuedid"], name: "badgcritmet_iss_ix"
    t.index ["userid"], name: "badgcritmet_use_ix"
  end

  create_table "badge_criteria_param", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Defines parameters for badges criteria", force: :cascade do |t|
    t.bigint "critid", null: false
    t.string "name", default: "", null: false
    t.string "value"
    t.index ["critid"], name: "badgcritpara_cri_ix"
  end

  create_table "badge_external", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Setting for external badges display", force: :cascade do |t|
    t.bigint "backpackid", null: false
    t.bigint "collectionid", null: false
    t.index ["backpackid"], name: "badgexte_bac_ix"
  end

  create_table "badge_issued", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Defines issued badges", force: :cascade do |t|
    t.bigint "badgeid", default: 0, null: false
    t.bigint "userid", default: 0, null: false
    t.text "uniquehash", limit: 4294967295, null: false
    t.bigint "dateissued", default: 0, null: false
    t.bigint "dateexpire"
    t.boolean "visible", default: false, null: false
    t.bigint "issuernotified"
    t.index ["badgeid", "userid"], name: "badgissu_baduse_uix", unique: true
    t.index ["badgeid"], name: "badgissu_bad_ix"
    t.index ["userid"], name: "badgissu_use_ix"
  end

  create_table "badge_manual_award", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Track manual award criteria for badges", force: :cascade do |t|
    t.bigint "badgeid", null: false
    t.bigint "recipientid", null: false
    t.bigint "issuerid", null: false
    t.bigint "issuerrole", null: false
    t.bigint "datemet", null: false
    t.index ["badgeid"], name: "badgmanuawar_bad_ix"
    t.index ["issuerid"], name: "badgmanuawar_iss_ix"
    t.index ["issuerrole"], name: "badgmanuawar_iss2_ix"
    t.index ["recipientid"], name: "badgmanuawar_rec_ix"
  end

  create_table "block", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "contains all installed blocks", force: :cascade do |t|
    t.string "name", limit: 40, default: "", null: false
    t.bigint "cron", default: 0, null: false
    t.bigint "lastcron", default: 0, null: false
    t.boolean "visible", default: true, null: false
    t.index ["name"], name: "bloc_nam_uix", unique: true
  end

  create_table "block_community", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Community block", force: :cascade do |t|
    t.bigint "userid", null: false
    t.string "coursename", default: "", null: false
    t.text "coursedescription", limit: 4294967295
    t.string "courseurl", default: "", null: false
    t.string "imageurl", default: "", null: false
  end

  create_table "block_instances", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "This table stores block instances. The type of block this is", force: :cascade do |t|
    t.string "blockname", limit: 40, default: "", null: false
    t.bigint "parentcontextid", null: false
    t.integer "showinsubcontexts", limit: 2, null: false
    t.string "pagetypepattern", limit: 64, default: "", null: false
    t.string "subpagepattern", limit: 16
    t.string "defaultregion", limit: 16, default: "", null: false
    t.bigint "defaultweight", null: false
    t.text "configdata", limit: 4294967295
    t.index ["parentcontextid", "showinsubcontexts", "pagetypepattern", "subpagepattern"], name: "blocinst_parshopagsub_ix"
    t.index ["parentcontextid"], name: "blocinst_par_ix"
  end

  create_table "block_positions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Stores the position of a sticky block_instance on a another ", force: :cascade do |t|
    t.bigint "blockinstanceid", null: false
    t.bigint "contextid", null: false
    t.string "pagetype", limit: 64, default: "", null: false
    t.string "subpage", limit: 16, default: "", null: false
    t.integer "visible", limit: 2, null: false
    t.string "region", limit: 16, default: "", null: false
    t.bigint "weight", null: false
    t.index ["blockinstanceid", "contextid", "pagetype", "subpage"], name: "blocposi_bloconpagsub_uix", unique: true
    t.index ["blockinstanceid"], name: "blocposi_blo_ix"
    t.index ["contextid"], name: "blocposi_con_ix"
  end

  create_table "block_recent_activity", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Recent activity block", force: :cascade do |t|
    t.bigint "courseid", null: false
    t.bigint "cmid", null: false
    t.bigint "timecreated", null: false
    t.bigint "userid", null: false
    t.boolean "action", null: false
    t.string "modname", limit: 20
    t.index ["courseid", "timecreated"], name: "blocreceacti_coutim_ix"
  end

  create_table "block_rss_client", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Remote news feed information. Contains the news feed id, the", force: :cascade do |t|
    t.bigint "userid", default: 0, null: false
    t.text "title", limit: 4294967295, null: false
    t.string "preferredtitle", limit: 64, default: "", null: false
    t.text "description", limit: 4294967295, null: false
    t.integer "shared", limit: 1, default: 0, null: false
    t.string "url", default: "", null: false
  end

  create_table "blog_association", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Associations of blog entries with courses and module instanc", force: :cascade do |t|
    t.bigint "contextid", null: false
    t.bigint "blogid", null: false
    t.index ["blogid"], name: "blogasso_blo_ix"
    t.index ["contextid"], name: "blogasso_con_ix"
  end

  create_table "blog_external", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "External blog links used for RSS copying of blog entries to ", force: :cascade do |t|
    t.bigint "userid", null: false
    t.string "name", default: "", null: false
    t.text "description", limit: 4294967295
    t.text "url", limit: 4294967295, null: false
    t.string "filtertags"
    t.boolean "failedlastsync", default: false, null: false
    t.bigint "timemodified"
    t.bigint "timefetched", default: 0, null: false
    t.index ["userid"], name: "blogexte_use_ix"
  end

  create_table "book", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Defines book", force: :cascade do |t|
    t.bigint "course", default: 0, null: false
    t.string "name", default: "", null: false
    t.text "intro", limit: 4294967295
    t.integer "introformat", limit: 2, default: 0, null: false
    t.integer "numbering", limit: 2, default: 0, null: false
    t.integer "customtitles", limit: 1, default: 0, null: false
    t.bigint "revision", default: 0, null: false
    t.bigint "timecreated", default: 0, null: false
    t.bigint "timemodified", default: 0, null: false
  end

  create_table "book_chapters", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Defines book_chapters", force: :cascade do |t|
    t.bigint "bookid", default: 0, null: false
    t.bigint "pagenum", default: 0, null: false
    t.bigint "subchapter", default: 0, null: false
    t.string "title", default: "", null: false
    t.text "content", limit: 4294967295, null: false
    t.integer "contentformat", limit: 2, default: 0, null: false
    t.integer "hidden", limit: 1, default: 0, null: false
    t.bigint "timecreated", default: 0, null: false
    t.bigint "timemodified", default: 0, null: false
    t.string "importsrc", default: "", null: false
  end

  create_table "cache_filters", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "For keeping information about cached data", force: :cascade do |t|
    t.string "filter", limit: 32, default: "", null: false
    t.bigint "version", default: 0, null: false
    t.string "md5key", limit: 32, default: "", null: false
    t.text "rawtext", limit: 4294967295, null: false
    t.bigint "timemodified", default: 0, null: false
    t.index ["filter", "md5key"], name: "cachfilt_filmd5_ix"
  end

  create_table "cache_flags", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Cache of time-sensitive flags", force: :cascade do |t|
    t.string "flagtype", default: "", null: false
    t.string "name", default: "", null: false
    t.bigint "timemodified", default: 0, null: false
    t.text "value", limit: 4294967295, null: false
    t.bigint "expiry", null: false
    t.index ["flagtype"], name: "cachflag_fla_ix"
    t.index ["name"], name: "cachflag_nam_ix"
  end

  create_table "capabilities", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "this defines all capabilities", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "captype", limit: 50, default: "", null: false
    t.bigint "contextlevel", default: 0, null: false
    t.string "component", limit: 100, default: "", null: false
    t.bigint "riskbitmask", default: 0, null: false
    t.index ["name"], name: "capa_nam_uix", unique: true
  end

  create_table "chat", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Each of these is a chat room", force: :cascade do |t|
    t.bigint "course", default: 0, null: false
    t.string "name", default: "", null: false
    t.text "intro", limit: 4294967295, null: false
    t.integer "introformat", limit: 2, default: 0, null: false
    t.bigint "keepdays", default: 0, null: false
    t.integer "studentlogs", limit: 2, default: 0, null: false
    t.bigint "chattime", default: 0, null: false
    t.integer "schedule", limit: 2, default: 0, null: false
    t.bigint "timemodified", default: 0, null: false
    t.index ["course"], name: "chat_cou_ix"
  end

  create_table "chat_messages", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Stores all the actual chat messages", force: :cascade do |t|
    t.bigint "chatid", default: 0, null: false
    t.bigint "userid", default: 0, null: false
    t.bigint "groupid", default: 0, null: false
    t.boolean "system", default: false, null: false
    t.text "message", limit: 4294967295, null: false
    t.bigint "timestamp", default: 0, null: false
    t.index ["chatid"], name: "chatmess_cha_ix"
    t.index ["groupid"], name: "chatmess_gro_ix"
    t.index ["timestamp", "chatid"], name: "chatmess_timcha_ix"
    t.index ["userid"], name: "chatmess_use_ix"
  end

  create_table "chat_messages_current", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Stores current session", force: :cascade do |t|
    t.bigint "chatid", default: 0, null: false
    t.bigint "userid", default: 0, null: false
    t.bigint "groupid", default: 0, null: false
    t.boolean "system", default: false, null: false
    t.text "message", limit: 4294967295, null: false
    t.bigint "timestamp", default: 0, null: false
    t.index ["chatid"], name: "chatmesscurr_cha_ix"
    t.index ["groupid"], name: "chatmesscurr_gro_ix"
    t.index ["timestamp", "chatid"], name: "chatmesscurr_timcha_ix"
    t.index ["userid"], name: "chatmesscurr_use_ix"
  end

  create_table "chat_users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Keeps track of which users are in which chat rooms", force: :cascade do |t|
    t.bigint "chatid", default: 0, null: false
    t.bigint "userid", default: 0, null: false
    t.bigint "groupid", default: 0, null: false
    t.string "version", limit: 16, default: "", null: false
    t.string "ip", limit: 45, default: "", null: false
    t.bigint "firstping", default: 0, null: false
    t.bigint "lastping", default: 0, null: false
    t.bigint "lastmessageping", default: 0, null: false
    t.string "sid", limit: 32, default: "", null: false
    t.bigint "course", default: 0, null: false
    t.string "lang", limit: 30, default: "", null: false
    t.index ["chatid"], name: "chatuser_cha_ix"
    t.index ["groupid"], name: "chatuser_gro_ix"
    t.index ["lastping"], name: "chatuser_las_ix"
    t.index ["userid"], name: "chatuser_use_ix"
  end

  create_table "choice", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Available choices are stored here", force: :cascade do |t|
    t.bigint "course", default: 0, null: false
    t.string "name", default: "", null: false
    t.text "intro", limit: 4294967295, null: false
    t.integer "introformat", limit: 2, default: 0, null: false
    t.integer "publish", limit: 1, default: 0, null: false
    t.integer "showresults", limit: 1, default: 0, null: false
    t.integer "display", limit: 2, default: 0, null: false
    t.integer "allowupdate", limit: 1, default: 0, null: false
    t.integer "showunanswered", limit: 1, default: 0, null: false
    t.integer "limitanswers", limit: 1, default: 0, null: false
    t.bigint "timeopen", default: 0, null: false
    t.bigint "timeclose", default: 0, null: false
    t.bigint "timemodified", default: 0, null: false
    t.boolean "completionsubmit", default: false, null: false
    t.index ["course"], name: "choi_cou_ix"
  end

  create_table "choice_answers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "choices performed by users", force: :cascade do |t|
    t.bigint "choiceid", default: 0, null: false
    t.bigint "userid", default: 0, null: false
    t.bigint "optionid", default: 0, null: false
    t.bigint "timemodified", default: 0, null: false
    t.index ["choiceid"], name: "choiansw_cho_ix"
    t.index ["optionid"], name: "choiansw_opt_ix"
    t.index ["userid"], name: "choiansw_use_ix"
  end

  create_table "choice_options", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "available options to choice", force: :cascade do |t|
    t.bigint "choiceid", default: 0, null: false
    t.text "text", limit: 4294967295
    t.bigint "maxanswers", default: 0
    t.bigint "timemodified", default: 0, null: false
    t.index ["choiceid"], name: "choiopti_cho_ix"
  end

  create_table "cohort", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Each record represents one cohort (aka site-wide group).", force: :cascade do |t|
    t.bigint "contextid", null: false
    t.string "name", limit: 254, default: "", null: false
    t.string "idnumber", limit: 100
    t.text "description", limit: 4294967295
    t.integer "descriptionformat", limit: 1, null: false
    t.string "component", limit: 100, default: "", null: false
    t.bigint "timecreated", null: false
    t.bigint "timemodified", null: false
    t.index ["contextid"], name: "coho_con_ix"
  end

  create_table "cohort_members", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Link a user to a cohort.", force: :cascade do |t|
    t.bigint "cohortid", default: 0, null: false
    t.bigint "userid", default: 0, null: false
    t.bigint "timeadded", default: 0, null: false
    t.index ["cohortid", "userid"], name: "cohomemb_cohuse_uix", unique: true
    t.index ["cohortid"], name: "cohomemb_coh_ix"
    t.index ["userid"], name: "cohomemb_use_ix"
  end

  create_table "comments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "moodle comments module", force: :cascade do |t|
    t.bigint "contextid", null: false
    t.string "commentarea", default: "", null: false
    t.bigint "itemid", null: false
    t.text "content", limit: 4294967295, null: false
    t.integer "format", limit: 1, default: 0, null: false
    t.bigint "userid", null: false
    t.bigint "timecreated", null: false
  end

  create_table "config", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Moodle configuration variables", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.text "value", limit: 4294967295, null: false
    t.index ["name"], name: "conf_nam_uix", unique: true
  end

  create_table "config_log", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Changes done in server configuration through admin UI", force: :cascade do |t|
    t.bigint "userid", null: false
    t.bigint "timemodified", null: false
    t.string "plugin", limit: 100
    t.string "name", limit: 100, default: "", null: false
    t.text "value", limit: 4294967295
    t.text "oldvalue", limit: 4294967295
    t.index ["timemodified"], name: "conflog_tim_ix"
    t.index ["userid"], name: "conflog_use_ix"
  end

  create_table "config_plugins", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Moodle modules and plugins configuration variables", force: :cascade do |t|
    t.string "plugin", limit: 100, default: "core", null: false
    t.string "name", limit: 100, default: "", null: false
    t.text "value", limit: 4294967295, null: false
    t.index ["plugin", "name"], name: "confplug_plunam_uix", unique: true
  end

  create_table "context", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "one of these must be set", force: :cascade do |t|
    t.bigint "contextlevel", default: 0, null: false
    t.bigint "instanceid", default: 0, null: false
    t.string "path"
    t.integer "depth", limit: 1, default: 0, null: false
    t.index ["contextlevel", "instanceid"], name: "cont_conins_uix", unique: true
    t.index ["instanceid"], name: "cont_ins_ix"
    t.index ["path"], name: "cont_pat_ix"
  end

  create_table "context_temp", id: :bigint, default: nil, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Used by build_context_path() in upgrade and cron to keep con", force: :cascade do |t|
    t.string "path", default: "", null: false
    t.integer "depth", limit: 1, null: false
  end

  create_table "course", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Central course table", force: :cascade do |t|
    t.bigint "category", default: 0, null: false
    t.bigint "sortorder", default: 0, null: false
    t.string "fullname", limit: 254, default: "", null: false
    t.string "shortname", default: "", null: false
    t.string "idnumber", limit: 100, default: "", null: false
    t.text "summary", limit: 4294967295
    t.integer "summaryformat", limit: 1, default: 0, null: false
    t.string "format", limit: 21, default: "topics", null: false
    t.integer "showgrades", limit: 1, default: 1, null: false
    t.integer "newsitems", limit: 3, default: 1, null: false
    t.bigint "startdate", default: 0, null: false
    t.bigint "marker", default: 0, null: false
    t.bigint "maxbytes", default: 0, null: false
    t.integer "legacyfiles", limit: 2, default: 0, null: false
    t.integer "showreports", limit: 2, default: 0, null: false
    t.boolean "visible", default: true, null: false
    t.boolean "visibleold", default: true, null: false
    t.integer "groupmode", limit: 2, default: 0, null: false
    t.integer "groupmodeforce", limit: 2, default: 0, null: false
    t.bigint "defaultgroupingid", default: 0, null: false
    t.string "lang", limit: 30, default: "", null: false
    t.string "calendartype", limit: 30, default: "", null: false
    t.string "theme", limit: 50, default: "", null: false
    t.bigint "timecreated", default: 0, null: false
    t.bigint "timemodified", default: 0, null: false
    t.boolean "requested", default: false, null: false
    t.boolean "enablecompletion", default: false, null: false
    t.boolean "completionnotify", default: false, null: false
    t.bigint "cacherev", default: 0, null: false
    t.index ["category"], name: "cour_cat_ix"
    t.index ["idnumber"], name: "cour_idn_ix"
    t.index ["shortname"], name: "cour_sho_ix"
    t.index ["sortorder"], name: "cour_sor_ix"
  end

  create_table "course_categories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Course categories", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "idnumber", limit: 100
    t.text "description", limit: 4294967295
    t.integer "descriptionformat", limit: 1, default: 0, null: false
    t.bigint "parent", default: 0, null: false
    t.bigint "sortorder", default: 0, null: false
    t.bigint "coursecount", default: 0, null: false
    t.boolean "visible", default: true, null: false
    t.boolean "visibleold", default: true, null: false
    t.bigint "timemodified", default: 0, null: false
    t.bigint "depth", default: 0, null: false
    t.string "path", default: "", null: false
    t.string "theme", limit: 50
    t.index ["parent"], name: "courcate_par_ix"
  end

  create_table "course_completion_aggr_methd", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Course completion aggregation methods for criteria", force: :cascade do |t|
    t.bigint "course", default: 0, null: false
    t.bigint "criteriatype"
    t.boolean "method", default: false, null: false
    t.decimal "value", precision: 10, scale: 5
    t.index ["course", "criteriatype"], name: "courcompaggrmeth_coucri_uix", unique: true
    t.index ["course"], name: "courcompaggrmeth_cou_ix"
    t.index ["criteriatype"], name: "courcompaggrmeth_cri_ix"
  end

  create_table "course_completion_crit_compl", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Course completion user records", force: :cascade do |t|
    t.bigint "userid", default: 0, null: false
    t.bigint "course", default: 0, null: false
    t.bigint "criteriaid", default: 0, null: false
    t.decimal "gradefinal", precision: 10, scale: 5
    t.bigint "unenroled"
    t.bigint "timecompleted"
    t.index ["course"], name: "courcompcritcomp_cou_ix"
    t.index ["criteriaid"], name: "courcompcritcomp_cri_ix"
    t.index ["timecompleted"], name: "courcompcritcomp_tim_ix"
    t.index ["userid", "course", "criteriaid"], name: "courcompcritcomp_usecoucri_uix", unique: true
    t.index ["userid"], name: "courcompcritcomp_use_ix"
  end

  create_table "course_completion_criteria", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Course completion criteria", force: :cascade do |t|
    t.bigint "course", default: 0, null: false
    t.bigint "criteriatype", default: 0, null: false
    t.string "module", limit: 100
    t.bigint "moduleinstance"
    t.bigint "courseinstance"
    t.bigint "enrolperiod"
    t.bigint "timeend"
    t.decimal "gradepass", precision: 10, scale: 5
    t.bigint "role"
    t.index ["course"], name: "courcompcrit_cou_ix"
  end

  create_table "course_completions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Course completion records", force: :cascade do |t|
    t.bigint "userid", default: 0, null: false
    t.bigint "course", default: 0, null: false
    t.bigint "timeenrolled", default: 0, null: false
    t.bigint "timestarted", default: 0, null: false
    t.bigint "timecompleted"
    t.bigint "reaggregate", default: 0, null: false
    t.index ["course"], name: "courcomp_cou_ix"
    t.index ["timecompleted"], name: "courcomp_tim_ix"
    t.index ["userid", "course"], name: "courcomp_usecou_uix", unique: true
    t.index ["userid"], name: "courcomp_use_ix"
  end

  create_table "course_format_options", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Stores format-specific options for the course or course sect", force: :cascade do |t|
    t.bigint "courseid", null: false
    t.string "format", limit: 21, default: "", null: false
    t.bigint "sectionid", default: 0, null: false
    t.string "name", limit: 100, default: "", null: false
    t.text "value", limit: 4294967295
    t.index ["courseid", "format", "sectionid", "name"], name: "courformopti_couforsecnam_uix", unique: true
    t.index ["courseid"], name: "courformopti_cou_ix"
  end

  create_table "course_modules", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "course_modules table retrofitted from MySQL", force: :cascade do |t|
    t.bigint "course", default: 0, null: false
    t.bigint "module", default: 0, null: false
    t.bigint "instance", default: 0, null: false
    t.bigint "section", default: 0, null: false
    t.string "idnumber", limit: 100
    t.bigint "added", default: 0, null: false
    t.integer "score", limit: 2, default: 0, null: false
    t.integer "indent", limit: 3, default: 0, null: false
    t.boolean "visible", default: true, null: false
    t.boolean "visibleold", default: true, null: false
    t.integer "groupmode", limit: 2, default: 0, null: false
    t.bigint "groupingid", default: 0, null: false
    t.integer "groupmembersonly", limit: 2, default: 0, null: false
    t.boolean "completion", default: false, null: false
    t.bigint "completiongradeitemnumber"
    t.boolean "completionview", default: false, null: false
    t.bigint "completionexpected", default: 0, null: false
    t.boolean "showdescription", default: false, null: false
    t.text "availability", limit: 4294967295
    t.index ["course"], name: "courmodu_cou_ix"
    t.index ["groupingid"], name: "courmodu_gro_ix"
    t.index ["idnumber", "course"], name: "courmodu_idncou_ix"
    t.index ["instance"], name: "courmodu_ins_ix"
    t.index ["module"], name: "courmodu_mod_ix"
    t.index ["visible"], name: "courmodu_vis_ix"
  end

  create_table "course_modules_completion", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Stores the completion state (completed or not completed, etc", force: :cascade do |t|
    t.bigint "coursemoduleid", null: false
    t.bigint "userid", null: false
    t.boolean "completionstate", null: false
    t.boolean "viewed"
    t.bigint "timemodified", null: false
    t.index ["coursemoduleid"], name: "courmoducomp_cou_ix"
    t.index ["userid", "coursemoduleid"], name: "courmoducomp_usecou_uix", unique: true
  end

  create_table "course_published", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Information about how and when an local courses were publish", force: :cascade do |t|
    t.string "huburl"
    t.bigint "courseid", null: false
    t.bigint "timepublished", null: false
    t.boolean "enrollable", default: true, null: false
    t.bigint "hubcourseid", null: false
    t.boolean "status", default: false
    t.bigint "timechecked"
  end

  create_table "course_request", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "course requests", force: :cascade do |t|
    t.string "fullname", limit: 254, default: "", null: false
    t.string "shortname", limit: 100, default: "", null: false
    t.text "summary", limit: 4294967295, null: false
    t.integer "summaryformat", limit: 1, default: 0, null: false
    t.bigint "category", default: 0, null: false
    t.text "reason", limit: 4294967295, null: false
    t.bigint "requester", default: 0, null: false
    t.string "password", limit: 50, default: "", null: false
    t.index ["shortname"], name: "courrequ_sho_ix"
  end

  create_table "course_sections", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "to define the sections for each course", force: :cascade do |t|
    t.bigint "course", default: 0, null: false
    t.bigint "section", default: 0, null: false
    t.string "name"
    t.text "summary", limit: 4294967295
    t.integer "summaryformat", limit: 1, default: 0, null: false
    t.text "sequence", limit: 4294967295
    t.boolean "visible", default: true, null: false
    t.text "availability", limit: 4294967295
    t.index ["course", "section"], name: "coursect_cousec_uix", unique: true
  end

  create_table "data", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "all database activities", force: :cascade do |t|
    t.bigint "course", default: 0, null: false
    t.string "name", default: "", null: false
    t.text "intro", limit: 4294967295, null: false
    t.integer "introformat", limit: 2, default: 0, null: false
    t.integer "comments", limit: 2, default: 0, null: false
    t.bigint "timeavailablefrom", default: 0, null: false
    t.bigint "timeavailableto", default: 0, null: false
    t.bigint "timeviewfrom", default: 0, null: false
    t.bigint "timeviewto", default: 0, null: false
    t.integer "requiredentries", default: 0, null: false
    t.integer "requiredentriestoview", default: 0, null: false
    t.integer "maxentries", default: 0, null: false
    t.integer "rssarticles", limit: 2, default: 0, null: false
    t.text "singletemplate", limit: 4294967295
    t.text "listtemplate", limit: 4294967295
    t.text "listtemplateheader", limit: 4294967295
    t.text "listtemplatefooter", limit: 4294967295
    t.text "addtemplate", limit: 4294967295
    t.text "rsstemplate", limit: 4294967295
    t.text "rsstitletemplate", limit: 4294967295
    t.text "csstemplate", limit: 4294967295
    t.text "jstemplate", limit: 4294967295
    t.text "asearchtemplate", limit: 4294967295
    t.integer "approval", limit: 2, default: 0, null: false
    t.bigint "scale", default: 0, null: false
    t.bigint "assessed", default: 0, null: false
    t.bigint "assesstimestart", default: 0, null: false
    t.bigint "assesstimefinish", default: 0, null: false
    t.bigint "defaultsort", default: 0, null: false
    t.integer "defaultsortdir", limit: 2, default: 0, null: false
    t.integer "editany", limit: 2, default: 0, null: false
    t.bigint "notification", default: 0, null: false
    t.index ["course"], name: "data_cou_ix"
  end

  create_table "data_content", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "the content introduced in each record/fields", force: :cascade do |t|
    t.bigint "fieldid", default: 0, null: false
    t.bigint "recordid", default: 0, null: false
    t.text "content", limit: 4294967295
    t.text "content1", limit: 4294967295
    t.text "content2", limit: 4294967295
    t.text "content3", limit: 4294967295
    t.text "content4", limit: 4294967295
    t.index ["fieldid"], name: "datacont_fie_ix"
    t.index ["recordid"], name: "datacont_rec_ix"
  end

  create_table "data_fields", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "every field available", force: :cascade do |t|
    t.bigint "dataid", default: 0, null: false
    t.string "type", default: "", null: false
    t.string "name", default: "", null: false
    t.text "description", limit: 4294967295, null: false
    t.text "param1", limit: 4294967295
    t.text "param2", limit: 4294967295
    t.text "param3", limit: 4294967295
    t.text "param4", limit: 4294967295
    t.text "param5", limit: 4294967295
    t.text "param6", limit: 4294967295
    t.text "param7", limit: 4294967295
    t.text "param8", limit: 4294967295
    t.text "param9", limit: 4294967295
    t.text "param10", limit: 4294967295
    t.index ["dataid"], name: "datafiel_dat_ix"
    t.index ["type", "dataid"], name: "datafiel_typdat_ix"
  end

  create_table "data_records", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "every record introduced", force: :cascade do |t|
    t.bigint "userid", default: 0, null: false
    t.bigint "groupid", default: 0, null: false
    t.bigint "dataid", default: 0, null: false
    t.bigint "timecreated", default: 0, null: false
    t.bigint "timemodified", default: 0, null: false
    t.integer "approved", limit: 2, default: 0, null: false
    t.index ["dataid"], name: "datareco_dat_ix"
  end

  create_table "enrol", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Instances of enrolment plugins used in courses, fields marke", force: :cascade do |t|
    t.string "enrol", limit: 20, default: "", null: false
    t.bigint "status", default: 0, null: false
    t.bigint "courseid", null: false
    t.bigint "sortorder", default: 0, null: false
    t.string "name"
    t.bigint "enrolperiod", default: 0
    t.bigint "enrolstartdate", default: 0
    t.bigint "enrolenddate", default: 0
    t.boolean "expirynotify", default: false
    t.bigint "expirythreshold", default: 0
    t.boolean "notifyall", default: false
    t.string "password", limit: 50
    t.string "cost", limit: 20
    t.string "currency", limit: 3
    t.bigint "roleid", default: 0
    t.bigint "customint1"
    t.bigint "customint2"
    t.bigint "customint3"
    t.bigint "customint4"
    t.bigint "customint5"
    t.bigint "customint6"
    t.bigint "customint7"
    t.bigint "customint8"
    t.string "customchar1"
    t.string "customchar2"
    t.string "customchar3", limit: 1333
    t.decimal "customdec1", precision: 12, scale: 7
    t.decimal "customdec2", precision: 12, scale: 7
    t.text "customtext1", limit: 4294967295
    t.text "customtext2", limit: 4294967295
    t.text "customtext3", limit: 4294967295
    t.text "customtext4", limit: 4294967295
    t.bigint "timecreated", default: 0, null: false
    t.bigint "timemodified", default: 0, null: false
    t.index ["courseid"], name: "enro_cou_ix"
    t.index ["enrol"], name: "enro_enr_ix"
  end

  create_table "enrol_flatfile", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "enrol_flatfile table retrofitted from MySQL", force: :cascade do |t|
    t.string "action", limit: 30, default: "", null: false
    t.bigint "roleid", null: false
    t.bigint "userid", null: false
    t.bigint "courseid", null: false
    t.bigint "timestart", default: 0, null: false
    t.bigint "timeend", default: 0, null: false
    t.bigint "timemodified", default: 0, null: false
    t.index ["courseid"], name: "enroflat_cou_ix"
    t.index ["roleid"], name: "enroflat_rol_ix"
    t.index ["userid"], name: "enroflat_use_ix"
  end

  create_table "enrol_paypal", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Holds all known information about PayPal transactions", force: :cascade do |t|
    t.string "business", default: "", null: false
    t.string "receiver_email", default: "", null: false
    t.string "receiver_id", default: "", null: false
    t.string "item_name", default: "", null: false
    t.bigint "courseid", default: 0, null: false
    t.bigint "userid", default: 0, null: false
    t.bigint "instanceid", default: 0, null: false
    t.string "memo", default: "", null: false
    t.string "tax", default: "", null: false
    t.string "option_name1", default: "", null: false
    t.string "option_selection1_x", default: "", null: false
    t.string "option_name2", default: "", null: false
    t.string "option_selection2_x", default: "", null: false
    t.string "payment_status", default: "", null: false
    t.string "pending_reason", default: "", null: false
    t.string "reason_code", limit: 30, default: "", null: false
    t.string "txn_id", default: "", null: false
    t.string "parent_txn_id", default: "", null: false
    t.string "payment_type", limit: 30, default: "", null: false
    t.bigint "timeupdated", default: 0, null: false
  end

  create_table "event", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "For everything with a time associated to it", force: :cascade do |t|
    t.text "name", limit: 4294967295, null: false
    t.text "description", limit: 4294967295, null: false
    t.integer "format", limit: 2, default: 0, null: false
    t.bigint "courseid", default: 0, null: false
    t.bigint "groupid", default: 0, null: false
    t.bigint "userid", default: 0, null: false
    t.bigint "repeatid", default: 0, null: false
    t.string "modulename", limit: 20, default: "", null: false
    t.bigint "instance", default: 0, null: false
    t.string "eventtype", limit: 20, default: "", null: false
    t.bigint "timestart", default: 0, null: false
    t.bigint "timeduration", default: 0, null: false
    t.integer "visible", limit: 2, default: 1, null: false
    t.string "uuid", default: "", null: false
    t.bigint "sequence", default: 1, null: false
    t.bigint "timemodified", default: 0, null: false
    t.bigint "subscriptionid"
    t.index ["courseid"], name: "even_cou_ix"
    t.index ["groupid", "courseid", "visible", "userid"], name: "even_grocouvisuse_ix"
    t.index ["timeduration"], name: "even_tim2_ix"
    t.index ["timestart"], name: "even_tim_ix"
    t.index ["userid"], name: "even_use_ix"
  end

  create_table "event_subscriptions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Tracks subscriptions to remote calendars.", force: :cascade do |t|
    t.string "url", default: "", null: false
    t.bigint "courseid", default: 0, null: false
    t.bigint "groupid", default: 0, null: false
    t.bigint "userid", default: 0, null: false
    t.string "eventtype", limit: 20, default: "", null: false
    t.bigint "pollinterval", default: 0, null: false
    t.bigint "lastupdated"
    t.string "name", default: "", null: false
  end

  create_table "events_handlers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "This table is for storing which components requests what typ", force: :cascade do |t|
    t.string "eventname", limit: 166, default: "", null: false
    t.string "component", limit: 166, default: "", null: false
    t.string "handlerfile", default: "", null: false
    t.text "handlerfunction", limit: 4294967295
    t.string "schedule"
    t.bigint "status", default: 0, null: false
    t.integer "internal", limit: 1, default: 1, null: false
    t.index ["eventname", "component"], name: "evenhand_evecom_uix", unique: true
  end

  create_table "events_queue", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "This table is for storing queued events. It stores only one ", force: :cascade do |t|
    t.text "eventdata", limit: 4294967295, null: false
    t.text "stackdump", limit: 4294967295
    t.bigint "userid"
    t.bigint "timecreated", null: false
    t.index ["userid"], name: "evenqueu_use_ix"
  end

  create_table "events_queue_handlers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "This is the list of queued handlers for processing. The even", force: :cascade do |t|
    t.bigint "queuedeventid", null: false
    t.bigint "handlerid", null: false
    t.bigint "status"
    t.text "errormessage", limit: 4294967295
    t.bigint "timemodified", null: false
    t.index ["handlerid"], name: "evenqueuhand_han_ix"
    t.index ["queuedeventid"], name: "evenqueuhand_que_ix"
  end

  create_table "external_functions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "list of all external functions", force: :cascade do |t|
    t.string "name", limit: 200, default: "", null: false
    t.string "classname", limit: 100, default: "", null: false
    t.string "methodname", limit: 100, default: "", null: false
    t.string "classpath"
    t.string "component", limit: 100, default: "", null: false
    t.string "capabilities"
    t.index ["name"], name: "extefunc_nam_uix", unique: true
  end

  create_table "external_services", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "built in and custom external services", force: :cascade do |t|
    t.string "name", limit: 200, default: "", null: false
    t.boolean "enabled", null: false
    t.string "requiredcapability", limit: 150
    t.boolean "restrictedusers", null: false
    t.string "component", limit: 100
    t.bigint "timecreated", null: false
    t.bigint "timemodified"
    t.string "shortname"
    t.boolean "downloadfiles", default: false, null: false
    t.boolean "uploadfiles", default: false, null: false
    t.index ["name"], name: "exteserv_nam_uix", unique: true
  end

  create_table "external_services_functions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "lists functions available in each service group", force: :cascade do |t|
    t.bigint "externalserviceid", null: false
    t.string "functionname", limit: 200, default: "", null: false
    t.index ["externalserviceid"], name: "exteservfunc_ext_ix"
  end

  create_table "external_services_users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "users allowed to use services with restricted users flag", force: :cascade do |t|
    t.bigint "externalserviceid", null: false
    t.bigint "userid", null: false
    t.string "iprestriction"
    t.bigint "validuntil"
    t.bigint "timecreated"
    t.index ["externalserviceid"], name: "exteservuser_ext_ix"
    t.index ["userid"], name: "exteservuser_use_ix"
  end

  create_table "external_tokens", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Security tokens for accessing of external services", force: :cascade do |t|
    t.string "token", limit: 128, default: "", null: false
    t.integer "tokentype", limit: 2, null: false
    t.bigint "userid", null: false
    t.bigint "externalserviceid", null: false
    t.string "sid", limit: 128
    t.bigint "contextid", null: false
    t.bigint "creatorid", default: 1, null: false
    t.string "iprestriction"
    t.bigint "validuntil"
    t.bigint "timecreated", null: false
    t.bigint "lastaccess"
    t.index ["contextid"], name: "extetoke_con_ix"
    t.index ["creatorid"], name: "extetoke_cre_ix"
    t.index ["externalserviceid"], name: "extetoke_ext_ix"
    t.index ["userid"], name: "extetoke_use_ix"
  end

  create_table "feedback", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "all feedbacks", force: :cascade do |t|
    t.bigint "course", default: 0, null: false
    t.string "name", default: "", null: false
    t.text "intro", limit: 4294967295, null: false
    t.integer "introformat", limit: 2, default: 0, null: false
    t.boolean "anonymous", default: true, null: false
    t.boolean "email_notification", default: true, null: false
    t.boolean "multiple_submit", default: true, null: false
    t.boolean "autonumbering", default: true, null: false
    t.string "site_after_submit", default: "", null: false
    t.text "page_after_submit", limit: 4294967295, null: false
    t.integer "page_after_submitformat", limit: 1, default: 0, null: false
    t.boolean "publish_stats", default: false, null: false
    t.bigint "timeopen", default: 0, null: false
    t.bigint "timeclose", default: 0, null: false
    t.bigint "timemodified", default: 0, null: false
    t.boolean "completionsubmit", default: false, null: false
    t.index ["course"], name: "feed_cou_ix"
  end

  create_table "feedback_completed", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "filled out feedback", force: :cascade do |t|
    t.bigint "feedback", default: 0, null: false
    t.bigint "userid", default: 0, null: false
    t.bigint "timemodified", default: 0, null: false
    t.bigint "random_response", default: 0, null: false
    t.boolean "anonymous_response", default: false, null: false
    t.index ["feedback"], name: "feedcomp_fee_ix"
    t.index ["userid"], name: "feedcomp_use_ix"
  end

  create_table "feedback_completedtmp", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "filled out feedback", force: :cascade do |t|
    t.bigint "feedback", default: 0, null: false
    t.bigint "userid", default: 0, null: false
    t.string "guestid", default: "", null: false
    t.bigint "timemodified", default: 0, null: false
    t.bigint "random_response", default: 0, null: false
    t.boolean "anonymous_response", default: false, null: false
    t.index ["feedback"], name: "feedcomp_fee2_ix"
    t.index ["userid"], name: "feedcomp_use2_ix"
  end

  create_table "feedback_item", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "feedback_items", force: :cascade do |t|
    t.bigint "feedback", default: 0, null: false
    t.bigint "template", default: 0, null: false
    t.string "name", default: "", null: false
    t.string "label", default: "", null: false
    t.text "presentation", limit: 4294967295, null: false
    t.string "typ", default: "", null: false
    t.boolean "hasvalue", default: false, null: false
    t.integer "position", limit: 2, default: 0, null: false
    t.boolean "required", default: false, null: false
    t.bigint "dependitem", default: 0, null: false
    t.string "dependvalue", default: "", null: false
    t.string "options", default: "", null: false
    t.index ["feedback"], name: "feeditem_fee_ix"
    t.index ["template"], name: "feeditem_tem_ix"
  end

  create_table "feedback_sitecourse_map", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "feedback sitecourse map", force: :cascade do |t|
    t.bigint "feedbackid", default: 0, null: false
    t.bigint "courseid", default: 0, null: false
    t.index ["courseid"], name: "feedsitemap_cou_ix"
    t.index ["feedbackid"], name: "feedsitemap_fee_ix"
  end

  create_table "feedback_template", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "templates of feedbackstructures", force: :cascade do |t|
    t.bigint "course", default: 0, null: false
    t.boolean "ispublic", default: false, null: false
    t.string "name", default: "", null: false
    t.index ["course"], name: "feedtemp_cou_ix"
  end

  create_table "feedback_tracking", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "feedback trackingdata", force: :cascade do |t|
    t.bigint "userid", default: 0, null: false
    t.bigint "feedback", default: 0, null: false
    t.bigint "completed", default: 0, null: false
    t.bigint "tmp_completed", default: 0, null: false
    t.index ["completed"], name: "feedtrac_com_ix"
    t.index ["feedback"], name: "feedtrac_fee_ix"
    t.index ["userid"], name: "feedtrac_use_ix"
  end

  create_table "feedback_value", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "values of the completeds", force: :cascade do |t|
    t.bigint "course_id", default: 0, null: false
    t.bigint "item", default: 0, null: false
    t.bigint "completed", default: 0, null: false
    t.bigint "tmp_completed", default: 0, null: false
    t.text "value", limit: 4294967295, null: false
    t.index ["course_id"], name: "feedvalu_cou_ix"
    t.index ["item"], name: "feedvalu_ite_ix"
  end

  create_table "feedback_valuetmp", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "values of the completedstmp", force: :cascade do |t|
    t.bigint "course_id", default: 0, null: false
    t.bigint "item", default: 0, null: false
    t.bigint "completed", default: 0, null: false
    t.bigint "tmp_completed", default: 0, null: false
    t.text "value", limit: 4294967295, null: false
    t.index ["course_id"], name: "feedvalu_cou2_ix"
    t.index ["item"], name: "feedvalu_ite2_ix"
  end

  create_table "files", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "description of files, content is stored in sha1 file pool", force: :cascade do |t|
    t.string "contenthash", limit: 40, default: "", null: false
    t.string "pathnamehash", limit: 40, default: "", null: false
    t.bigint "contextid", null: false
    t.string "component", limit: 100, default: "", null: false
    t.string "filearea", limit: 50, default: "", null: false
    t.bigint "itemid", null: false
    t.string "filepath", default: "", null: false
    t.string "filename", default: "", null: false
    t.bigint "userid"
    t.bigint "filesize", null: false
    t.string "mimetype", limit: 100
    t.bigint "status", default: 0, null: false
    t.text "source", limit: 4294967295
    t.string "author"
    t.string "license"
    t.bigint "timecreated", null: false
    t.bigint "timemodified", null: false
    t.bigint "sortorder", default: 0, null: false
    t.bigint "referencefileid"
    t.index ["component", "filearea", "contextid", "itemid"], name: "file_comfilconite_ix"
    t.index ["contenthash"], name: "file_con_ix"
    t.index ["contextid"], name: "file_con2_ix"
    t.index ["pathnamehash"], name: "file_pat_uix", unique: true
    t.index ["referencefileid"], name: "file_ref_ix"
    t.index ["userid"], name: "file_use_ix"
  end

  create_table "files_reference", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Store files references", force: :cascade do |t|
    t.bigint "repositoryid", null: false
    t.bigint "lastsync"
    t.text "reference", limit: 4294967295
    t.string "referencehash", limit: 40, default: "", null: false
    t.index ["repositoryid", "referencehash"], name: "filerefe_repref_uix", unique: true
    t.index ["repositoryid"], name: "filerefe_rep_ix"
  end

  create_table "filter_active", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Stores information about which filters are active in which c", force: :cascade do |t|
    t.string "filter", limit: 32, default: "", null: false
    t.bigint "contextid", null: false
    t.integer "active", limit: 2, null: false
    t.bigint "sortorder", default: 0, null: false
    t.index ["contextid", "filter"], name: "filtacti_confil_uix", unique: true
    t.index ["contextid"], name: "filtacti_con_ix"
  end

  create_table "filter_config", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Stores per-context configuration settings for filters which ", force: :cascade do |t|
    t.string "filter", limit: 32, default: "", null: false
    t.bigint "contextid", null: false
    t.string "name", default: "", null: false
    t.text "value", limit: 4294967295
    t.index ["contextid", "filter", "name"], name: "filtconf_confilnam_uix", unique: true
    t.index ["contextid"], name: "filtconf_con_ix"
  end

  create_table "folder", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "each record is one folder resource", force: :cascade do |t|
    t.bigint "course", default: 0, null: false
    t.string "name", default: "", null: false
    t.text "intro", limit: 4294967295
    t.integer "introformat", limit: 2, default: 0, null: false
    t.bigint "revision", default: 0, null: false
    t.bigint "timemodified", default: 0, null: false
    t.integer "display", limit: 2, default: 0, null: false
    t.boolean "showexpanded", default: true, null: false
    t.index ["course"], name: "fold_cou_ix"
  end

  create_table "forum", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Forums contain and structure discussion", force: :cascade do |t|
    t.bigint "course", default: 0, null: false
    t.string "type", limit: 20, default: "general", null: false
    t.string "name", default: "", null: false
    t.text "intro", limit: 4294967295, null: false
    t.integer "introformat", limit: 2, default: 0, null: false
    t.bigint "assessed", default: 0, null: false
    t.bigint "assesstimestart", default: 0, null: false
    t.bigint "assesstimefinish", default: 0, null: false
    t.bigint "scale", default: 0, null: false
    t.bigint "maxbytes", default: 0, null: false
    t.bigint "maxattachments", default: 1, null: false
    t.boolean "forcesubscribe", default: false, null: false
    t.integer "trackingtype", limit: 1, default: 1, null: false
    t.integer "rsstype", limit: 1, default: 0, null: false
    t.integer "rssarticles", limit: 1, default: 0, null: false
    t.bigint "timemodified", default: 0, null: false
    t.bigint "warnafter", default: 0, null: false
    t.bigint "blockafter", default: 0, null: false
    t.bigint "blockperiod", default: 0, null: false
    t.integer "completiondiscussions", default: 0, null: false
    t.integer "completionreplies", default: 0, null: false
    t.integer "completionposts", default: 0, null: false
    t.boolean "displaywordcount", default: false, null: false
    t.index ["course"], name: "foru_cou_ix"
  end

  create_table "forum_digests", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Keeps track of user mail delivery preferences for each forum", force: :cascade do |t|
    t.bigint "userid", null: false
    t.bigint "forum", null: false
    t.boolean "maildigest", default: true, null: false
    t.index ["forum", "userid", "maildigest"], name: "forudige_forusemai_uix", unique: true
    t.index ["forum"], name: "forudige_for_ix"
    t.index ["userid"], name: "forudige_use_ix"
  end

  create_table "forum_discussions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Forums are composed of discussions", force: :cascade do |t|
    t.bigint "course", default: 0, null: false
    t.bigint "forum", default: 0, null: false
    t.string "name", default: "", null: false
    t.bigint "firstpost", default: 0, null: false
    t.bigint "userid", default: 0, null: false
    t.bigint "groupid", default: -1, null: false
    t.boolean "assessed", default: true, null: false
    t.bigint "timemodified", default: 0, null: false
    t.bigint "usermodified", default: 0, null: false
    t.bigint "timestart", default: 0, null: false
    t.bigint "timeend", default: 0, null: false
    t.index ["forum"], name: "forudisc_for_ix"
    t.index ["userid"], name: "forudisc_use_ix"
  end

  create_table "forum_posts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "All posts are stored in this table", force: :cascade do |t|
    t.bigint "discussion", default: 0, null: false
    t.bigint "parent", default: 0, null: false
    t.bigint "userid", default: 0, null: false
    t.bigint "created", default: 0, null: false
    t.bigint "modified", default: 0, null: false
    t.integer "mailed", default: 0, null: false
    t.string "subject", default: "", null: false
    t.text "message", limit: 4294967295, null: false
    t.integer "messageformat", default: 1, null: false
    t.integer "messagetrust", default: 0, null: false
    t.string "attachment", default: "0", null: false
    t.integer "totalscore", default: 0, null: false
    t.bigint "mailnow", default: 0, null: false
    t.index ["created"], name: "forupost_cre_ix"
    t.index ["discussion"], name: "forupost_dis_ix"
    t.index ["mailed"], name: "forupost_mai_ix"
    t.index ["parent"], name: "forupost_par_ix"
    t.index ["userid"], name: "forupost_use_ix"
  end

  create_table "forum_queue", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "For keeping track of posts that will be mailed in digest for", force: :cascade do |t|
    t.bigint "userid", default: 0, null: false
    t.bigint "discussionid", default: 0, null: false
    t.bigint "postid", default: 0, null: false
    t.bigint "timemodified", default: 0, null: false
    t.index ["discussionid"], name: "foruqueu_dis_ix"
    t.index ["postid"], name: "foruqueu_pos_ix"
    t.index ["userid"], name: "foruqueu_use_ix"
  end

  create_table "forum_read", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Tracks each users read posts", force: :cascade do |t|
    t.bigint "userid", default: 0, null: false
    t.bigint "forumid", default: 0, null: false
    t.bigint "discussionid", default: 0, null: false
    t.bigint "postid", default: 0, null: false
    t.bigint "firstread", default: 0, null: false
    t.bigint "lastread", default: 0, null: false
    t.index ["postid", "userid"], name: "foruread_posuse_ix"
    t.index ["userid", "discussionid"], name: "foruread_usedis_ix"
    t.index ["userid", "forumid"], name: "foruread_usefor_ix"
  end

  create_table "forum_subscriptions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Keeps track of who is subscribed to what forum", force: :cascade do |t|
    t.bigint "userid", default: 0, null: false
    t.bigint "forum", default: 0, null: false
    t.index ["forum"], name: "forusubs_for_ix"
    t.index ["userid"], name: "forusubs_use_ix"
  end

  create_table "forum_track_prefs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Tracks each users untracked forums", force: :cascade do |t|
    t.bigint "userid", default: 0, null: false
    t.bigint "forumid", default: 0, null: false
    t.index ["userid", "forumid"], name: "forutracpref_usefor_ix"
  end

  create_table "glossary", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "all glossaries", force: :cascade do |t|
    t.bigint "course", default: 0, null: false
    t.string "name", default: "", null: false
    t.text "intro", limit: 4294967295, null: false
    t.integer "introformat", limit: 2, default: 0, null: false
    t.integer "allowduplicatedentries", limit: 1, default: 0, null: false
    t.string "displayformat", limit: 50, default: "dictionary", null: false
    t.integer "mainglossary", limit: 1, default: 0, null: false
    t.integer "showspecial", limit: 1, default: 1, null: false
    t.integer "showalphabet", limit: 1, default: 1, null: false
    t.integer "showall", limit: 1, default: 1, null: false
    t.integer "allowcomments", limit: 1, default: 0, null: false
    t.integer "allowprintview", limit: 1, default: 1, null: false
    t.integer "usedynalink", limit: 1, default: 1, null: false
    t.integer "defaultapproval", limit: 1, default: 1, null: false
    t.string "approvaldisplayformat", limit: 50, default: "default", null: false
    t.integer "globalglossary", limit: 1, default: 0, null: false
    t.integer "entbypage", limit: 2, default: 10, null: false
    t.integer "editalways", limit: 1, default: 0, null: false
    t.integer "rsstype", limit: 1, default: 0, null: false
    t.integer "rssarticles", limit: 1, default: 0, null: false
    t.bigint "assessed", default: 0, null: false
    t.bigint "assesstimestart", default: 0, null: false
    t.bigint "assesstimefinish", default: 0, null: false
    t.bigint "scale", default: 0, null: false
    t.bigint "timecreated", default: 0, null: false
    t.bigint "timemodified", default: 0, null: false
    t.integer "completionentries", default: 0, null: false
    t.index ["course"], name: "glos_cou_ix"
  end

  create_table "glossary_alias", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "entries alias", force: :cascade do |t|
    t.bigint "entryid", default: 0, null: false
    t.string "alias", default: "", null: false
    t.index ["entryid"], name: "glosalia_ent_ix"
  end

  create_table "glossary_categories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "all categories for glossary entries", force: :cascade do |t|
    t.bigint "glossaryid", default: 0, null: false
    t.string "name", default: "", null: false
    t.integer "usedynalink", limit: 1, default: 1, null: false
    t.index ["glossaryid"], name: "gloscate_glo_ix"
  end

  create_table "glossary_entries", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "all glossary entries", force: :cascade do |t|
    t.bigint "glossaryid", default: 0, null: false
    t.bigint "userid", default: 0, null: false
    t.string "concept", default: "", null: false
    t.text "definition", limit: 4294967295, null: false
    t.integer "definitionformat", limit: 1, default: 0, null: false
    t.integer "definitiontrust", limit: 1, default: 0, null: false
    t.string "attachment", limit: 100, default: "", null: false
    t.bigint "timecreated", default: 0, null: false
    t.bigint "timemodified", default: 0, null: false
    t.integer "teacherentry", limit: 1, default: 0, null: false
    t.bigint "sourceglossaryid", default: 0, null: false
    t.integer "usedynalink", limit: 1, default: 1, null: false
    t.integer "casesensitive", limit: 1, default: 0, null: false
    t.integer "fullmatch", limit: 1, default: 1, null: false
    t.integer "approved", limit: 1, default: 1, null: false
    t.index ["concept"], name: "glosentr_con_ix"
    t.index ["glossaryid"], name: "glosentr_glo_ix"
    t.index ["userid"], name: "glosentr_use_ix"
  end

  create_table "glossary_entries_categories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "categories of each glossary entry", force: :cascade do |t|
    t.bigint "categoryid", default: 0, null: false
    t.bigint "entryid", default: 0, null: false
    t.index ["categoryid"], name: "glosentrcate_cat_ix"
    t.index ["entryid"], name: "glosentrcate_ent_ix"
  end

  create_table "glossary_formats", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Setting of the display formats", force: :cascade do |t|
    t.string "name", limit: 50, default: "", null: false
    t.string "popupformatname", limit: 50, default: "", null: false
    t.integer "visible", limit: 1, default: 1, null: false
    t.integer "showgroup", limit: 1, default: 1, null: false
    t.string "defaultmode", limit: 50, default: "", null: false
    t.string "defaulthook", limit: 50, default: "", null: false
    t.string "sortkey", limit: 50, default: "", null: false
    t.string "sortorder", limit: 50, default: "", null: false
  end

  create_table "grade_categories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "This table keeps information about categories, used for grou", force: :cascade do |t|
    t.bigint "courseid", null: false
    t.bigint "parent"
    t.bigint "depth", default: 0, null: false
    t.string "path"
    t.string "fullname", default: "", null: false
    t.bigint "aggregation", default: 0, null: false
    t.bigint "keephigh", default: 0, null: false
    t.bigint "droplow", default: 0, null: false
    t.boolean "aggregateonlygraded", default: false, null: false
    t.boolean "aggregateoutcomes", default: false, null: false
    t.boolean "aggregatesubcats", default: false, null: false
    t.bigint "timecreated", null: false
    t.bigint "timemodified", null: false
    t.boolean "hidden", default: false, null: false
    t.index ["courseid"], name: "gradcate_cou_ix"
    t.index ["parent"], name: "gradcate_par_ix"
  end

  create_table "grade_categories_history", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "History of grade_categories", force: :cascade do |t|
    t.bigint "action", default: 0, null: false
    t.bigint "oldid", null: false
    t.string "source"
    t.bigint "timemodified"
    t.bigint "loggeduser"
    t.bigint "courseid", null: false
    t.bigint "parent"
    t.bigint "depth", default: 0, null: false
    t.string "path"
    t.string "fullname", default: "", null: false
    t.bigint "aggregation", default: 0, null: false
    t.bigint "keephigh", default: 0, null: false
    t.bigint "droplow", default: 0, null: false
    t.boolean "aggregateonlygraded", default: false, null: false
    t.boolean "aggregateoutcomes", default: false, null: false
    t.boolean "aggregatesubcats", default: false, null: false
    t.boolean "hidden", default: false, null: false
    t.index ["action"], name: "gradcatehist_act_ix"
    t.index ["courseid"], name: "gradcatehist_cou_ix"
    t.index ["loggeduser"], name: "gradcatehist_log_ix"
    t.index ["oldid"], name: "gradcatehist_old_ix"
    t.index ["parent"], name: "gradcatehist_par_ix"
  end

  create_table "grade_grades", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "grade_grades  This table keeps individual grades for each us", force: :cascade do |t|
    t.bigint "itemid", null: false
    t.bigint "userid", null: false
    t.decimal "rawgrade", precision: 10, scale: 5
    t.decimal "rawgrademax", precision: 10, scale: 5, default: "100.0", null: false
    t.decimal "rawgrademin", precision: 10, scale: 5, default: "0.0", null: false
    t.bigint "rawscaleid"
    t.bigint "usermodified"
    t.decimal "finalgrade", precision: 10, scale: 5
    t.bigint "hidden", default: 0, null: false
    t.bigint "locked", default: 0, null: false
    t.bigint "locktime", default: 0, null: false
    t.bigint "exported", default: 0, null: false
    t.bigint "overridden", default: 0, null: false
    t.bigint "excluded", default: 0, null: false
    t.text "feedback", limit: 4294967295
    t.bigint "feedbackformat", default: 0, null: false
    t.text "information", limit: 4294967295
    t.bigint "informationformat", default: 0, null: false
    t.bigint "timecreated"
    t.bigint "timemodified"
    t.index ["itemid"], name: "gradgrad_ite_ix"
    t.index ["locked", "locktime"], name: "gradgrad_locloc_ix"
    t.index ["rawscaleid"], name: "gradgrad_raw_ix"
    t.index ["userid", "itemid"], name: "gradgrad_useite_uix", unique: true
    t.index ["userid"], name: "gradgrad_use_ix"
    t.index ["usermodified"], name: "gradgrad_use2_ix"
  end

  create_table "grade_grades_history", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "History table", force: :cascade do |t|
    t.bigint "action", default: 0, null: false
    t.bigint "oldid", null: false
    t.string "source"
    t.bigint "timemodified"
    t.bigint "loggeduser"
    t.bigint "itemid", null: false
    t.bigint "userid", null: false
    t.decimal "rawgrade", precision: 10, scale: 5
    t.decimal "rawgrademax", precision: 10, scale: 5, default: "100.0", null: false
    t.decimal "rawgrademin", precision: 10, scale: 5, default: "0.0", null: false
    t.bigint "rawscaleid"
    t.bigint "usermodified"
    t.decimal "finalgrade", precision: 10, scale: 5
    t.bigint "hidden", default: 0, null: false
    t.bigint "locked", default: 0, null: false
    t.bigint "locktime", default: 0, null: false
    t.bigint "exported", default: 0, null: false
    t.bigint "overridden", default: 0, null: false
    t.bigint "excluded", default: 0, null: false
    t.text "feedback", limit: 4294967295
    t.bigint "feedbackformat", default: 0, null: false
    t.text "information", limit: 4294967295
    t.bigint "informationformat", default: 0, null: false
    t.index ["action"], name: "gradgradhist_act_ix"
    t.index ["itemid"], name: "gradgradhist_ite_ix"
    t.index ["loggeduser"], name: "gradgradhist_log_ix"
    t.index ["oldid"], name: "gradgradhist_old_ix"
    t.index ["rawscaleid"], name: "gradgradhist_raw_ix"
    t.index ["timemodified"], name: "gradgradhist_tim_ix"
    t.index ["userid"], name: "gradgradhist_use_ix"
    t.index ["usermodified"], name: "gradgradhist_use2_ix"
  end

  create_table "grade_import_newitem", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "temporary table for storing new grade_item names from grade ", force: :cascade do |t|
    t.string "itemname", default: "", null: false
    t.bigint "importcode", null: false
    t.bigint "importer", null: false
    t.index ["importer"], name: "gradimponewi_imp_ix"
  end

  create_table "grade_import_values", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Temporary table for importing grades", force: :cascade do |t|
    t.bigint "itemid"
    t.bigint "newgradeitem"
    t.bigint "userid", null: false
    t.decimal "finalgrade", precision: 10, scale: 5
    t.text "feedback", limit: 4294967295
    t.bigint "importcode", null: false
    t.bigint "importer"
    t.index ["importer"], name: "gradimpovalu_imp_ix"
    t.index ["itemid"], name: "gradimpovalu_ite_ix"
    t.index ["newgradeitem"], name: "gradimpovalu_new_ix"
  end

  create_table "grade_items", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "This table keeps information about gradeable items (ie colum", force: :cascade do |t|
    t.bigint "courseid"
    t.bigint "categoryid"
    t.string "itemname"
    t.string "itemtype", limit: 30, default: "", null: false
    t.string "itemmodule", limit: 30
    t.bigint "iteminstance"
    t.bigint "itemnumber"
    t.text "iteminfo", limit: 4294967295
    t.string "idnumber"
    t.text "calculation", limit: 4294967295
    t.integer "gradetype", limit: 2, default: 1, null: false
    t.decimal "grademax", precision: 10, scale: 5, default: "100.0", null: false
    t.decimal "grademin", precision: 10, scale: 5, default: "0.0", null: false
    t.bigint "scaleid"
    t.bigint "outcomeid"
    t.decimal "gradepass", precision: 10, scale: 5, default: "0.0", null: false
    t.decimal "multfactor", precision: 10, scale: 5, default: "1.0", null: false
    t.decimal "plusfactor", precision: 10, scale: 5, default: "0.0", null: false
    t.decimal "aggregationcoef", precision: 10, scale: 5, default: "0.0", null: false
    t.bigint "sortorder", default: 0, null: false
    t.bigint "display", default: 0, null: false
    t.boolean "decimals"
    t.bigint "hidden", default: 0, null: false
    t.bigint "locked", default: 0, null: false
    t.bigint "locktime", default: 0, null: false
    t.bigint "needsupdate", default: 0, null: false
    t.bigint "timecreated"
    t.bigint "timemodified"
    t.index ["categoryid"], name: "graditem_cat_ix"
    t.index ["courseid"], name: "graditem_cou_ix"
    t.index ["gradetype"], name: "graditem_gra_ix"
    t.index ["idnumber", "courseid"], name: "graditem_idncou_ix"
    t.index ["itemtype", "needsupdate"], name: "graditem_itenee_ix"
    t.index ["locked", "locktime"], name: "graditem_locloc_ix"
    t.index ["outcomeid"], name: "graditem_out_ix"
    t.index ["scaleid"], name: "graditem_sca_ix"
  end

  create_table "grade_items_history", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "History of grade_items", force: :cascade do |t|
    t.bigint "action", default: 0, null: false
    t.bigint "oldid", null: false
    t.string "source"
    t.bigint "timemodified"
    t.bigint "loggeduser"
    t.bigint "courseid"
    t.bigint "categoryid"
    t.string "itemname"
    t.string "itemtype", limit: 30, default: "", null: false
    t.string "itemmodule", limit: 30
    t.bigint "iteminstance"
    t.bigint "itemnumber"
    t.text "iteminfo", limit: 4294967295
    t.string "idnumber"
    t.text "calculation", limit: 4294967295
    t.integer "gradetype", limit: 2, default: 1, null: false
    t.decimal "grademax", precision: 10, scale: 5, default: "100.0", null: false
    t.decimal "grademin", precision: 10, scale: 5, default: "0.0", null: false
    t.bigint "scaleid"
    t.bigint "outcomeid"
    t.decimal "gradepass", precision: 10, scale: 5, default: "0.0", null: false
    t.decimal "multfactor", precision: 10, scale: 5, default: "1.0", null: false
    t.decimal "plusfactor", precision: 10, scale: 5, default: "0.0", null: false
    t.decimal "aggregationcoef", precision: 10, scale: 5, default: "0.0", null: false
    t.bigint "sortorder", default: 0, null: false
    t.bigint "hidden", default: 0, null: false
    t.bigint "locked", default: 0, null: false
    t.bigint "locktime", default: 0, null: false
    t.bigint "needsupdate", default: 0, null: false
    t.bigint "display", default: 0, null: false
    t.boolean "decimals"
    t.index ["action"], name: "graditemhist_act_ix"
    t.index ["categoryid"], name: "graditemhist_cat_ix"
    t.index ["courseid"], name: "graditemhist_cou_ix"
    t.index ["loggeduser"], name: "graditemhist_log_ix"
    t.index ["oldid"], name: "graditemhist_old_ix"
    t.index ["outcomeid"], name: "graditemhist_out_ix"
    t.index ["scaleid"], name: "graditemhist_sca_ix"
  end

  create_table "grade_letters", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Repository for grade letters, for courses and other moodle e", force: :cascade do |t|
    t.bigint "contextid", null: false
    t.decimal "lowerboundary", precision: 10, scale: 5, null: false
    t.string "letter", default: "", null: false
    t.index ["contextid", "lowerboundary", "letter"], name: "gradlett_conlowlet_uix", unique: true
  end

  create_table "grade_outcomes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "This table describes the outcomes used in the system. An out", force: :cascade do |t|
    t.bigint "courseid"
    t.string "shortname", default: "", null: false
    t.text "fullname", limit: 4294967295, null: false
    t.bigint "scaleid"
    t.text "description", limit: 4294967295
    t.integer "descriptionformat", limit: 1, default: 0, null: false
    t.bigint "timecreated"
    t.bigint "timemodified"
    t.bigint "usermodified"
    t.index ["courseid", "shortname"], name: "gradoutc_cousho_uix", unique: true
    t.index ["courseid"], name: "gradoutc_cou_ix"
    t.index ["scaleid"], name: "gradoutc_sca_ix"
    t.index ["usermodified"], name: "gradoutc_use_ix"
  end

  create_table "grade_outcomes_courses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "stores what outcomes are used in what courses.", force: :cascade do |t|
    t.bigint "courseid", null: false
    t.bigint "outcomeid", null: false
    t.index ["courseid", "outcomeid"], name: "gradoutccour_couout_uix", unique: true
    t.index ["courseid"], name: "gradoutccour_cou_ix"
    t.index ["outcomeid"], name: "gradoutccour_out_ix"
  end

  create_table "grade_outcomes_history", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "History table", force: :cascade do |t|
    t.bigint "action", default: 0, null: false
    t.bigint "oldid", null: false
    t.string "source"
    t.bigint "timemodified"
    t.bigint "loggeduser"
    t.bigint "courseid"
    t.string "shortname", default: "", null: false
    t.text "fullname", limit: 4294967295, null: false
    t.bigint "scaleid"
    t.text "description", limit: 4294967295
    t.integer "descriptionformat", limit: 1, default: 0, null: false
    t.index ["action"], name: "gradoutchist_act_ix"
    t.index ["courseid"], name: "gradoutchist_cou_ix"
    t.index ["loggeduser"], name: "gradoutchist_log_ix"
    t.index ["oldid"], name: "gradoutchist_old_ix"
    t.index ["scaleid"], name: "gradoutchist_sca_ix"
  end

  create_table "grade_settings", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "gradebook settings", force: :cascade do |t|
    t.bigint "courseid", null: false
    t.string "name", default: "", null: false
    t.text "value", limit: 4294967295
    t.index ["courseid", "name"], name: "gradsett_counam_uix", unique: true
    t.index ["courseid"], name: "gradsett_cou_ix"
  end

  create_table "grading_areas", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Identifies gradable areas where advanced grading can happen.", force: :cascade do |t|
    t.bigint "contextid", null: false
    t.string "component", limit: 100, default: "", null: false
    t.string "areaname", limit: 100, default: "", null: false
    t.string "activemethod", limit: 100
    t.index ["contextid", "component", "areaname"], name: "gradarea_concomare_uix", unique: true
    t.index ["contextid"], name: "gradarea_con_ix"
  end

  create_table "grading_definitions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Contains the basic information about an advanced grading for", force: :cascade do |t|
    t.bigint "areaid", null: false
    t.string "method", limit: 100, default: "", null: false
    t.string "name", default: "", null: false
    t.text "description", limit: 4294967295
    t.integer "descriptionformat", limit: 1
    t.bigint "status", default: 0, null: false
    t.bigint "copiedfromid"
    t.bigint "timecreated", null: false
    t.bigint "usercreated", null: false
    t.bigint "timemodified", null: false
    t.bigint "usermodified", null: false
    t.bigint "timecopied", default: 0
    t.text "options", limit: 4294967295
    t.index ["areaid", "method"], name: "graddefi_aremet_uix", unique: true
    t.index ["areaid"], name: "graddefi_are_ix"
    t.index ["usercreated"], name: "graddefi_use2_ix"
    t.index ["usermodified"], name: "graddefi_use_ix"
  end

  create_table "grading_instances", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Grading form instance is an assessment record for one gradab", force: :cascade do |t|
    t.bigint "definitionid", null: false
    t.bigint "raterid", null: false
    t.bigint "itemid"
    t.decimal "rawgrade", precision: 10, scale: 5
    t.bigint "status", default: 0, null: false
    t.text "feedback", limit: 4294967295
    t.integer "feedbackformat", limit: 1
    t.bigint "timemodified", null: false
    t.index ["definitionid"], name: "gradinst_def_ix"
    t.index ["raterid"], name: "gradinst_rat_ix"
  end

  create_table "gradingform_guide_comments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "frequently used comments used in marking guide", force: :cascade do |t|
    t.bigint "definitionid", null: false
    t.bigint "sortorder", null: false
    t.text "description", limit: 4294967295
    t.integer "descriptionformat", limit: 1
    t.index ["definitionid"], name: "gradguidcomm_def_ix"
  end

  create_table "gradingform_guide_criteria", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Stores the rows of the criteria grid.", force: :cascade do |t|
    t.bigint "definitionid", null: false
    t.bigint "sortorder", null: false
    t.string "shortname", default: "", null: false
    t.text "description", limit: 4294967295
    t.integer "descriptionformat", limit: 1
    t.text "descriptionmarkers", limit: 4294967295
    t.integer "descriptionmarkersformat", limit: 1
    t.decimal "maxscore", precision: 10, scale: 5, null: false
    t.index ["definitionid"], name: "gradguidcrit_def_ix"
  end

  create_table "gradingform_guide_fillings", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Stores the data of how the guide is filled by a particular r", force: :cascade do |t|
    t.bigint "instanceid", null: false
    t.bigint "criterionid", null: false
    t.text "remark", limit: 4294967295
    t.integer "remarkformat", limit: 1
    t.decimal "score", precision: 10, scale: 5, null: false
    t.index ["criterionid"], name: "gradguidfill_cri_ix"
    t.index ["instanceid", "criterionid"], name: "gradguidfill_inscri_uix", unique: true
    t.index ["instanceid"], name: "gradguidfill_ins_ix"
  end

  create_table "gradingform_rubric_criteria", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Stores the rows of the rubric grid.", force: :cascade do |t|
    t.bigint "definitionid", null: false
    t.bigint "sortorder", null: false
    t.text "description", limit: 4294967295
    t.integer "descriptionformat", limit: 1
    t.index ["definitionid"], name: "gradrubrcrit_def_ix"
  end

  create_table "gradingform_rubric_fillings", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Stores the data of how the rubric is filled by a particular ", force: :cascade do |t|
    t.bigint "instanceid", null: false
    t.bigint "criterionid", null: false
    t.bigint "levelid"
    t.text "remark", limit: 4294967295
    t.integer "remarkformat", limit: 1
    t.index ["criterionid"], name: "gradrubrfill_cri_ix"
    t.index ["instanceid", "criterionid"], name: "gradrubrfill_inscri_uix", unique: true
    t.index ["instanceid"], name: "gradrubrfill_ins_ix"
    t.index ["levelid"], name: "gradrubrfill_lev_ix"
  end

  create_table "gradingform_rubric_levels", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Stores the columns of the rubric grid.", force: :cascade do |t|
    t.bigint "criterionid", null: false
    t.decimal "score", precision: 10, scale: 5, null: false
    t.text "definition", limit: 4294967295
    t.bigint "definitionformat"
    t.index ["criterionid"], name: "gradrubrleve_cri_ix"
  end

  create_table "groupings", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "A grouping is a collection of groups. WAS: groups_groupings", force: :cascade do |t|
    t.bigint "courseid", default: 0, null: false
    t.string "name", default: "", null: false
    t.string "idnumber", limit: 100, default: "", null: false
    t.text "description", limit: 4294967295
    t.integer "descriptionformat", limit: 1, default: 0, null: false
    t.text "configdata", limit: 4294967295
    t.bigint "timecreated", default: 0, null: false
    t.bigint "timemodified", default: 0, null: false
    t.index ["courseid"], name: "grou_cou2_ix"
    t.index ["idnumber"], name: "grou_idn2_ix"
  end

  create_table "groupings_groups", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Link a grouping to a group (note, groups can be in multiple ", force: :cascade do |t|
    t.bigint "groupingid", default: 0, null: false
    t.bigint "groupid", default: 0, null: false
    t.bigint "timeadded", default: 0, null: false
    t.index ["groupid"], name: "grougrou_gro2_ix"
    t.index ["groupingid"], name: "grougrou_gro_ix"
  end

  create_table "groups", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Each record represents a group.", force: :cascade do |t|
    t.bigint "courseid", null: false
    t.string "idnumber", limit: 100, default: "", null: false
    t.string "name", limit: 254, default: "", null: false
    t.text "description", limit: 4294967295
    t.integer "descriptionformat", limit: 1, default: 0, null: false
    t.string "enrolmentkey", limit: 50
    t.bigint "picture", default: 0, null: false
    t.boolean "hidepicture", default: false, null: false
    t.bigint "timecreated", default: 0, null: false
    t.bigint "timemodified", default: 0, null: false
    t.index ["courseid"], name: "grou_cou_ix"
    t.index ["idnumber"], name: "grou_idn_ix"
  end

  create_table "groups_members", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Link a user to a group.", force: :cascade do |t|
    t.bigint "groupid", default: 0, null: false
    t.bigint "userid", default: 0, null: false
    t.bigint "timeadded", default: 0, null: false
    t.string "component", limit: 100, default: "", null: false
    t.bigint "itemid", default: 0, null: false
    t.index ["groupid"], name: "groumemb_gro_ix"
    t.index ["userid"], name: "groumemb_use_ix"
  end

  create_table "imscp", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "each record is one imscp resource", force: :cascade do |t|
    t.bigint "course", default: 0, null: false
    t.string "name", default: "", null: false
    t.text "intro", limit: 4294967295
    t.integer "introformat", limit: 2, default: 0, null: false
    t.bigint "revision", default: 0, null: false
    t.bigint "keepold", default: -1, null: false
    t.text "structure", limit: 4294967295
    t.bigint "timemodified", default: 0, null: false
    t.index ["course"], name: "imsc_cou_ix"
  end

  create_table "installs", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_installs_on_email", unique: true
    t.index ["reset_password_token"], name: "index_installs_on_reset_password_token", unique: true
  end

  create_table "label", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Defines labels", force: :cascade do |t|
    t.bigint "course", default: 0, null: false
    t.string "name", default: "", null: false
    t.text "intro", limit: 4294967295, null: false
    t.integer "introformat", limit: 2, default: 0
    t.bigint "timemodified", default: 0, null: false
    t.index ["course"], name: "labe_cou_ix"
  end

  create_table "lesson", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Defines lesson", force: :cascade do |t|
    t.bigint "course", default: 0, null: false
    t.string "name", default: "", null: false
    t.integer "practice", limit: 2, default: 0, null: false
    t.integer "modattempts", limit: 2, default: 0, null: false
    t.integer "usepassword", limit: 2, default: 0, null: false
    t.string "password", limit: 32, default: "", null: false
    t.bigint "dependency", default: 0, null: false
    t.text "conditions", limit: 4294967295, null: false
    t.integer "grade", limit: 2, default: 0, null: false
    t.integer "custom", limit: 2, default: 0, null: false
    t.integer "ongoing", limit: 2, default: 0, null: false
    t.integer "usemaxgrade", limit: 2, default: 0, null: false
    t.integer "maxanswers", limit: 2, default: 4, null: false
    t.integer "maxattempts", limit: 2, default: 5, null: false
    t.integer "review", limit: 2, default: 0, null: false
    t.integer "nextpagedefault", limit: 2, default: 0, null: false
    t.integer "feedback", limit: 2, default: 1, null: false
    t.integer "minquestions", limit: 2, default: 0, null: false
    t.integer "maxpages", limit: 2, default: 0, null: false
    t.integer "timed", limit: 2, default: 0, null: false
    t.bigint "maxtime", default: 0, null: false
    t.integer "retake", limit: 2, default: 1, null: false
    t.bigint "activitylink", default: 0, null: false
    t.string "mediafile", default: "", null: false
    t.bigint "mediaheight", default: 100, null: false
    t.bigint "mediawidth", default: 650, null: false
    t.integer "mediaclose", limit: 2, default: 0, null: false
    t.integer "slideshow", limit: 2, default: 0, null: false
    t.bigint "width", default: 640, null: false
    t.bigint "height", default: 480, null: false
    t.string "bgcolor", limit: 7, default: "#FFFFFF", null: false
    t.integer "displayleft", limit: 2, default: 0, null: false
    t.integer "displayleftif", limit: 2, default: 0, null: false
    t.integer "progressbar", limit: 2, default: 0, null: false
    t.integer "highscores", limit: 2, default: 0, null: false
    t.bigint "maxhighscores", default: 0, null: false
    t.bigint "available", default: 0, null: false
    t.bigint "deadline", default: 0, null: false
    t.bigint "timemodified", default: 0, null: false
    t.index ["course"], name: "less_cou_ix"
  end

  create_table "lesson_answers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Defines lesson_answers", force: :cascade do |t|
    t.bigint "lessonid", default: 0, null: false
    t.bigint "pageid", default: 0, null: false
    t.bigint "jumpto", default: 0, null: false
    t.integer "grade", limit: 2, default: 0, null: false
    t.bigint "score", default: 0, null: false
    t.integer "flags", limit: 2, default: 0, null: false
    t.bigint "timecreated", default: 0, null: false
    t.bigint "timemodified", default: 0, null: false
    t.text "answer", limit: 4294967295
    t.integer "answerformat", limit: 1, default: 0, null: false
    t.text "response", limit: 4294967295
    t.integer "responseformat", limit: 1, default: 0, null: false
    t.index ["lessonid"], name: "lessansw_les_ix"
    t.index ["pageid"], name: "lessansw_pag_ix"
  end

  create_table "lesson_attempts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Defines lesson_attempts", force: :cascade do |t|
    t.bigint "lessonid", default: 0, null: false
    t.bigint "pageid", default: 0, null: false
    t.bigint "userid", default: 0, null: false
    t.bigint "answerid", default: 0, null: false
    t.integer "retry", limit: 2, default: 0, null: false
    t.bigint "correct", default: 0, null: false
    t.text "useranswer", limit: 4294967295
    t.bigint "timeseen", default: 0, null: false
    t.index ["answerid"], name: "lessatte_ans_ix"
    t.index ["lessonid"], name: "lessatte_les_ix"
    t.index ["pageid"], name: "lessatte_pag_ix"
    t.index ["userid"], name: "lessatte_use_ix"
  end

  create_table "lesson_branch", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "branches for each lesson/user", force: :cascade do |t|
    t.bigint "lessonid", default: 0, null: false
    t.bigint "userid", default: 0, null: false
    t.bigint "pageid", default: 0, null: false
    t.bigint "retry", default: 0, null: false
    t.integer "flag", limit: 2, default: 0, null: false
    t.bigint "timeseen", default: 0, null: false
    t.index ["lessonid"], name: "lessbran_les_ix"
    t.index ["pageid"], name: "lessbran_pag_ix"
    t.index ["userid"], name: "lessbran_use_ix"
  end

  create_table "lesson_grades", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Defines lesson_grades", force: :cascade do |t|
    t.bigint "lessonid", default: 0, null: false
    t.bigint "userid", default: 0, null: false
    t.float "grade", limit: 53, default: 0.0, null: false
    t.integer "late", limit: 2, default: 0, null: false
    t.bigint "completed", default: 0, null: false
    t.index ["lessonid"], name: "lessgrad_les_ix"
    t.index ["userid"], name: "lessgrad_use_ix"
  end

  create_table "lesson_high_scores", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "high scores for each lesson", force: :cascade do |t|
    t.bigint "lessonid", default: 0, null: false
    t.bigint "userid", default: 0, null: false
    t.bigint "gradeid", default: 0, null: false
    t.string "nickname", limit: 5, default: "", null: false
    t.index ["lessonid"], name: "lesshighscor_les_ix"
    t.index ["userid"], name: "lesshighscor_use_ix"
  end

  create_table "lesson_pages", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Defines lesson_pages", force: :cascade do |t|
    t.bigint "lessonid", default: 0, null: false
    t.bigint "prevpageid", default: 0, null: false
    t.bigint "nextpageid", default: 0, null: false
    t.integer "qtype", limit: 2, default: 0, null: false
    t.integer "qoption", limit: 2, default: 0, null: false
    t.integer "layout", limit: 2, default: 1, null: false
    t.integer "display", limit: 2, default: 1, null: false
    t.bigint "timecreated", default: 0, null: false
    t.bigint "timemodified", default: 0, null: false
    t.string "title", default: "", null: false
    t.text "contents", limit: 4294967295, null: false
    t.integer "contentsformat", limit: 1, default: 0, null: false
    t.index ["lessonid"], name: "lesspage_les_ix"
  end

  create_table "lesson_timer", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "lesson timer for each lesson", force: :cascade do |t|
    t.bigint "lessonid", default: 0, null: false
    t.bigint "userid", default: 0, null: false
    t.bigint "starttime", default: 0, null: false
    t.bigint "lessontime", default: 0, null: false
    t.index ["lessonid"], name: "lesstime_les_ix"
    t.index ["userid"], name: "lesstime_use_ix"
  end

  create_table "license", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "store licenses used by moodle", force: :cascade do |t|
    t.string "shortname"
    t.text "fullname", limit: 4294967295
    t.string "source"
    t.boolean "enabled", default: true, null: false
    t.bigint "version", default: 0, null: false
  end

  create_table "lock_db", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Stores active and inactive lock types for db locking method.", force: :cascade do |t|
    t.string "resourcekey", default: "", null: false
    t.bigint "expires"
    t.string "owner", limit: 36
    t.index ["expires"], name: "lockdb_exp_ix"
    t.index ["owner"], name: "lockdb_own_ix"
    t.index ["resourcekey"], name: "lockdb_res_uix", unique: true
  end

  create_table "log", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Every action is logged as far as possible", force: :cascade do |t|
    t.bigint "time", default: 0, null: false
    t.bigint "userid", default: 0, null: false
    t.string "ip", limit: 45, default: "", null: false
    t.bigint "course", default: 0, null: false
    t.string "module", limit: 20, default: "", null: false
    t.bigint "cmid", default: 0, null: false
    t.string "action", limit: 40, default: "", null: false
    t.string "url", limit: 100, default: "", null: false
    t.string "info", default: "", null: false
    t.index ["action"], name: "log_act_ix"
    t.index ["cmid"], name: "log_cmi_ix"
    t.index ["course", "module", "action"], name: "log_coumodact_ix"
    t.index ["time"], name: "log_tim_ix"
    t.index ["userid", "course"], name: "log_usecou_ix"
  end

  create_table "log_display", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "For a particular module/action, specifies a moodle table/fie", force: :cascade do |t|
    t.string "module", limit: 20, default: "", null: false
    t.string "action", limit: 40, default: "", null: false
    t.string "mtable", limit: 30, default: "", null: false
    t.string "field", limit: 200, default: "", null: false
    t.string "component", limit: 100, default: "", null: false
    t.index ["module", "action"], name: "logdisp_modact_uix", unique: true
  end

  create_table "log_queries", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Logged database queries.", force: :cascade do |t|
    t.integer "qtype", limit: 3, null: false
    t.text "sqltext", limit: 4294967295, null: false
    t.text "sqlparams", limit: 4294967295
    t.integer "error", limit: 3, default: 0, null: false
    t.text "info", limit: 4294967295
    t.text "backtrace", limit: 4294967295
    t.decimal "exectime", precision: 10, scale: 5, null: false
    t.bigint "timelogged", null: false
  end

  create_table "logstore_standard_log", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Standard log table", force: :cascade do |t|
    t.string "eventname", default: "", null: false
    t.string "component", limit: 100, default: "", null: false
    t.string "action", limit: 100, default: "", null: false
    t.string "target", limit: 100, default: "", null: false
    t.string "objecttable", limit: 50
    t.bigint "objectid"
    t.string "crud", limit: 1, default: "", null: false
    t.boolean "edulevel", null: false
    t.bigint "contextid", null: false
    t.bigint "contextlevel", null: false
    t.bigint "contextinstanceid", null: false
    t.bigint "userid", null: false
    t.bigint "courseid"
    t.bigint "relateduserid"
    t.boolean "anonymous", default: false, null: false
    t.text "other", limit: 4294967295
    t.bigint "timecreated", null: false
    t.string "origin", limit: 10
    t.string "ip", limit: 45
    t.bigint "realuserid"
    t.index ["courseid", "anonymous", "timecreated"], name: "logsstanlog_couanotim_ix"
    t.index ["timecreated"], name: "logsstanlog_tim_ix"
    t.index ["userid", "contextlevel", "contextinstanceid", "crud", "edulevel", "timecreated"], name: "logsstanlog_useconconcruedu_ix"
  end

  create_table "lti", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "This table contains Basic LTI activities instances", force: :cascade do |t|
    t.bigint "course", default: 0, null: false
    t.string "name", default: "", null: false
    t.text "intro", limit: 4294967295
    t.integer "introformat", limit: 2, default: 0
    t.bigint "timecreated", default: 0, null: false
    t.bigint "timemodified", default: 0, null: false
    t.bigint "typeid"
    t.text "toolurl", limit: 4294967295, null: false
    t.text "securetoolurl", limit: 4294967295
    t.boolean "instructorchoicesendname"
    t.boolean "instructorchoicesendemailaddr"
    t.boolean "instructorchoiceallowroster"
    t.boolean "instructorchoiceallowsetting"
    t.string "instructorcustomparameters"
    t.boolean "instructorchoiceacceptgrades"
    t.decimal "grade", precision: 10, scale: 5, default: "100.0", null: false
    t.integer "launchcontainer", limit: 1, default: 1, null: false
    t.string "resourcekey"
    t.string "password"
    t.boolean "debuglaunch", default: false, null: false
    t.boolean "showtitlelaunch", default: false, null: false
    t.boolean "showdescriptionlaunch", default: false, null: false
    t.string "servicesalt", limit: 40
    t.text "icon", limit: 4294967295
    t.text "secureicon", limit: 4294967295
    t.index ["course"], name: "lti_cou_ix"
  end

  create_table "lti_submission", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Keeps track of individual submissions for LTI activities.", force: :cascade do |t|
    t.bigint "ltiid", null: false
    t.bigint "userid", null: false
    t.bigint "datesubmitted", null: false
    t.bigint "dateupdated", null: false
    t.decimal "gradepercent", precision: 10, scale: 5, null: false
    t.decimal "originalgrade", precision: 10, scale: 5, null: false
    t.bigint "launchid", null: false
    t.integer "state", limit: 1, null: false
    t.index ["ltiid"], name: "ltisubm_lti_ix"
  end

  create_table "lti_types", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Basic LTI pre-configured activities", force: :cascade do |t|
    t.string "name", default: "basiclti Activity", null: false
    t.text "baseurl", limit: 4294967295, null: false
    t.string "tooldomain", default: "", null: false
    t.integer "state", limit: 1, default: 2, null: false
    t.bigint "course", null: false
    t.boolean "coursevisible", default: false, null: false
    t.bigint "createdby", null: false
    t.bigint "timecreated", null: false
    t.bigint "timemodified", null: false
    t.index ["course"], name: "ltitype_cou_ix"
    t.index ["tooldomain"], name: "ltitype_too_ix"
  end

  create_table "lti_types_config", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Basic LTI types configuration", force: :cascade do |t|
    t.bigint "typeid", null: false
    t.string "name", limit: 100, default: "", null: false
    t.string "value", default: "", null: false
    t.index ["typeid"], name: "ltitypeconf_typ_ix"
  end

  create_table "message", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Stores all unread messages", force: :cascade do |t|
    t.bigint "useridfrom", default: 0, null: false
    t.bigint "useridto", default: 0, null: false
    t.text "subject", limit: 4294967295
    t.text "fullmessage", limit: 4294967295
    t.integer "fullmessageformat", limit: 2, default: 0
    t.text "fullmessagehtml", limit: 4294967295
    t.text "smallmessage", limit: 4294967295
    t.boolean "notification", default: false
    t.text "contexturl", limit: 4294967295
    t.text "contexturlname", limit: 4294967295
    t.bigint "timecreated", default: 0, null: false
    t.index ["useridfrom"], name: "mess_use_ix"
    t.index ["useridto"], name: "mess_use2_ix"
  end

  create_table "message_airnotifier_devices", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Store information about the devices registered in Airnotifie", force: :cascade do |t|
    t.bigint "userdeviceid", null: false
    t.boolean "enable", default: true, null: false
    t.index ["userdeviceid"], name: "messairndevi_use_uix", unique: true
  end

  create_table "message_contacts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Maintains lists of relationships between users", force: :cascade do |t|
    t.bigint "userid", default: 0, null: false
    t.bigint "contactid", default: 0, null: false
    t.boolean "blocked", default: false, null: false
    t.index ["userid", "contactid"], name: "messcont_usecon_uix", unique: true
  end

  create_table "message_processors", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "List of message output plugins", force: :cascade do |t|
    t.string "name", limit: 166, default: "", null: false
    t.boolean "enabled", default: true, null: false
  end

  create_table "message_providers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "This table stores the message providers (modules and core sy", force: :cascade do |t|
    t.string "name", limit: 100, default: "", null: false
    t.string "component", limit: 200, default: "", null: false
    t.string "capability"
    t.index ["component", "name"], name: "messprov_comnam_uix", unique: true
  end

  create_table "message_read", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Stores all messages that have been read", force: :cascade do |t|
    t.bigint "useridfrom", default: 0, null: false
    t.bigint "useridto", default: 0, null: false
    t.text "subject", limit: 4294967295
    t.text "fullmessage", limit: 4294967295
    t.integer "fullmessageformat", limit: 2, default: 0
    t.text "fullmessagehtml", limit: 4294967295
    t.text "smallmessage", limit: 4294967295
    t.boolean "notification", default: false
    t.text "contexturl", limit: 4294967295
    t.text "contexturlname", limit: 4294967295
    t.bigint "timecreated", default: 0, null: false
    t.bigint "timeread", default: 0, null: false
    t.index ["useridfrom"], name: "messread_use_ix"
    t.index ["useridto"], name: "messread_use2_ix"
  end

  create_table "message_working", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Lists all the messages and processors that need to be proces", force: :cascade do |t|
    t.bigint "unreadmessageid", null: false
    t.bigint "processorid", null: false
    t.index ["unreadmessageid"], name: "messwork_unr_ix"
  end

  create_table "mnet_application", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Information about applications on remote hosts", force: :cascade do |t|
    t.string "name", limit: 50, default: "", null: false
    t.string "display_name", limit: 50, default: "", null: false
    t.string "xmlrpc_server_url", default: "", null: false
    t.string "sso_land_url", default: "", null: false
    t.string "sso_jump_url", default: "", null: false
  end

  create_table "mnet_host", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Information about the local and remote hosts for RPC", force: :cascade do |t|
    t.boolean "deleted", default: false, null: false
    t.string "wwwroot", default: "", null: false
    t.string "ip_address", limit: 45, default: "", null: false
    t.string "name", limit: 80, default: "", null: false
    t.text "public_key", limit: 4294967295, null: false
    t.bigint "public_key_expires", default: 0, null: false
    t.integer "transport", limit: 1, default: 0, null: false
    t.integer "portno", limit: 3, default: 0, null: false
    t.bigint "last_connect_time", default: 0, null: false
    t.bigint "last_log_id", default: 0, null: false
    t.boolean "force_theme", default: false, null: false
    t.string "theme", limit: 100
    t.bigint "applicationid", default: 1, null: false
    t.index ["applicationid"], name: "mnethost_app_ix"
  end

  create_table "mnet_host2service", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Information about the services for a given host", force: :cascade do |t|
    t.bigint "hostid", default: 0, null: false
    t.bigint "serviceid", default: 0, null: false
    t.boolean "publish", default: false, null: false
    t.boolean "subscribe", default: false, null: false
    t.index ["hostid", "serviceid"], name: "mnethost_hosser_uix", unique: true
  end

  create_table "mnet_log", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Store session data from users migrating to other sites", force: :cascade do |t|
    t.bigint "hostid", default: 0, null: false
    t.bigint "remoteid", default: 0, null: false
    t.bigint "time", default: 0, null: false
    t.bigint "userid", default: 0, null: false
    t.string "ip", limit: 45, default: "", null: false
    t.bigint "course", default: 0, null: false
    t.string "coursename", limit: 40, default: "", null: false
    t.string "module", limit: 20, default: "", null: false
    t.bigint "cmid", default: 0, null: false
    t.string "action", limit: 40, default: "", null: false
    t.string "url", limit: 100, default: "", null: false
    t.string "info", default: "", null: false
    t.index ["hostid", "userid", "course"], name: "mnetlog_hosusecou_ix"
  end

  create_table "mnet_remote_rpc", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "This table describes functions that might be called remotely", force: :cascade do |t|
    t.string "functionname", limit: 40, default: "", null: false
    t.string "xmlrpcpath", limit: 80, default: "", null: false
    t.string "plugintype", limit: 20, default: "", null: false
    t.string "pluginname", limit: 20, default: "", null: false
    t.boolean "enabled", null: false
  end

  create_table "mnet_remote_service2rpc", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Group functions or methods under a service", force: :cascade do |t|
    t.bigint "serviceid", default: 0, null: false
    t.bigint "rpcid", default: 0, null: false
    t.index ["rpcid", "serviceid"], name: "mnetremoserv_rpcser_uix", unique: true
  end

  create_table "mnet_rpc", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Functions or methods that we may publish or subscribe to", force: :cascade do |t|
    t.string "functionname", limit: 40, default: "", null: false
    t.string "xmlrpcpath", limit: 80, default: "", null: false
    t.string "plugintype", limit: 20, default: "", null: false
    t.string "pluginname", limit: 20, default: "", null: false
    t.boolean "enabled", default: false, null: false
    t.text "help", limit: 4294967295, null: false
    t.text "profile", limit: 4294967295, null: false
    t.string "filename", limit: 100, default: "", null: false
    t.string "classname", limit: 150
    t.boolean "static"
    t.index ["enabled", "xmlrpcpath"], name: "mnetrpc_enaxml_ix"
  end

  create_table "mnet_service", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "A service is a group of functions", force: :cascade do |t|
    t.string "name", limit: 40, default: "", null: false
    t.string "description", limit: 40, default: "", null: false
    t.string "apiversion", limit: 10, default: "", null: false
    t.boolean "offer", default: false, null: false
  end

  create_table "mnet_service2rpc", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Group functions or methods under a service", force: :cascade do |t|
    t.bigint "serviceid", default: 0, null: false
    t.bigint "rpcid", default: 0, null: false
    t.index ["rpcid", "serviceid"], name: "mnetserv_rpcser_uix", unique: true
  end

  create_table "mnet_session", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Store session data from users migrating to other sites", force: :cascade do |t|
    t.bigint "userid", default: 0, null: false
    t.string "username", limit: 100, default: "", null: false
    t.string "token", limit: 40, default: "", null: false
    t.bigint "mnethostid", default: 0, null: false
    t.string "useragent", limit: 40, default: "", null: false
    t.bigint "confirm_timeout", default: 0, null: false
    t.string "session_id", limit: 40, default: "", null: false
    t.bigint "expires", default: 0, null: false
    t.index ["token"], name: "mnetsess_tok_uix", unique: true
  end

  create_table "mnet_sso_access_control", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Users by host permitted (or not) to login from a remote prov", force: :cascade do |t|
    t.string "username", limit: 100, default: "", null: false
    t.bigint "mnet_host_id", default: 0, null: false
    t.string "accessctrl", limit: 20, default: "allow", null: false
    t.index ["mnet_host_id", "username"], name: "mnetssoaccecont_mneuse_uix", unique: true
  end

  create_table "mnetservice_enrol_courses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Caches the information fetched via XML-RPC about courses on ", force: :cascade do |t|
    t.bigint "hostid", null: false
    t.bigint "remoteid", null: false
    t.bigint "categoryid", null: false
    t.string "categoryname", default: "", null: false
    t.bigint "sortorder", default: 0, null: false
    t.string "fullname", limit: 254, default: "", null: false
    t.string "shortname", limit: 100, default: "", null: false
    t.string "idnumber", limit: 100, default: "", null: false
    t.text "summary", limit: 4294967295, null: false
    t.integer "summaryformat", limit: 2, default: 0
    t.bigint "startdate", null: false
    t.bigint "roleid", null: false
    t.string "rolename", default: "", null: false
    t.index ["hostid", "remoteid"], name: "mnetenrocour_hosrem_uix", unique: true
  end

  create_table "mnetservice_enrol_enrolments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Caches the information about enrolments of our local users i", force: :cascade do |t|
    t.bigint "hostid", null: false
    t.bigint "userid", null: false
    t.bigint "remotecourseid", null: false
    t.string "rolename", default: "", null: false
    t.bigint "enroltime", default: 0, null: false
    t.string "enroltype", limit: 20, default: "", null: false
    t.index ["hostid"], name: "mnetenroenro_hos_ix"
    t.index ["userid"], name: "mnetenroenro_use_ix"
  end

  create_table "modules", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "modules available in the site", force: :cascade do |t|
    t.string "name", limit: 20, default: "", null: false
    t.bigint "cron", default: 0, null: false
    t.bigint "lastcron", default: 0, null: false
    t.string "search", default: "", null: false
    t.boolean "visible", default: true, null: false
    t.index ["name"], name: "modu_nam_ix"
  end

  create_table "my_pages", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Extra user pages for the My Moodle system", force: :cascade do |t|
    t.bigint "userid", default: 0
    t.string "name", limit: 200, default: "", null: false
    t.boolean "private", default: true, null: false
    t.integer "sortorder", limit: 3, default: 0, null: false
    t.index ["userid", "private"], name: "mypage_usepri_ix"
  end

  create_table "page", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Each record is one page and its config data", force: :cascade do |t|
    t.bigint "course", default: 0, null: false
    t.string "name", default: "", null: false
    t.text "intro", limit: 4294967295
    t.integer "introformat", limit: 2, default: 0, null: false
    t.text "content", limit: 4294967295
    t.integer "contentformat", limit: 2, default: 0, null: false
    t.integer "legacyfiles", limit: 2, default: 0, null: false
    t.bigint "legacyfileslast"
    t.integer "display", limit: 2, default: 0, null: false
    t.text "displayoptions", limit: 4294967295
    t.bigint "revision", default: 0, null: false
    t.bigint "timemodified", default: 0, null: false
    t.index ["course"], name: "page_cou_ix"
  end

  create_table "portfolio_instance", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "base table (not including config data) for instances of port", force: :cascade do |t|
    t.string "plugin", limit: 50, default: "", null: false
    t.string "name", default: "", null: false
    t.boolean "visible", default: true, null: false
  end

  create_table "portfolio_instance_config", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "config for portfolio plugin instances", force: :cascade do |t|
    t.bigint "instance", null: false
    t.string "name", default: "", null: false
    t.text "value", limit: 4294967295
    t.index ["instance"], name: "portinstconf_ins_ix"
    t.index ["name"], name: "portinstconf_nam_ix"
  end

  create_table "portfolio_instance_user", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "user data for portfolio instances.", force: :cascade do |t|
    t.bigint "instance", null: false
    t.bigint "userid", null: false
    t.string "name", default: "", null: false
    t.text "value", limit: 4294967295
    t.index ["instance"], name: "portinstuser_ins_ix"
    t.index ["userid"], name: "portinstuser_use_ix"
  end

  create_table "portfolio_log", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "log of portfolio transfers (used to later check for duplicat", force: :cascade do |t|
    t.bigint "userid", null: false
    t.bigint "time", null: false
    t.bigint "portfolio", null: false
    t.string "caller_class", limit: 150, default: "", null: false
    t.string "caller_file", default: "", null: false
    t.string "caller_component"
    t.string "caller_sha1", default: "", null: false
    t.bigint "tempdataid", default: 0, null: false
    t.string "returnurl", default: "", null: false
    t.string "continueurl", default: "", null: false
    t.index ["portfolio"], name: "portlog_por_ix"
    t.index ["userid"], name: "portlog_use_ix"
  end

  create_table "portfolio_mahara_queue", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "maps mahara tokens to transfer ids", force: :cascade do |t|
    t.bigint "transferid", null: false
    t.string "token", limit: 50, default: "", null: false
    t.index ["token"], name: "portmahaqueu_tok_ix"
    t.index ["transferid"], name: "portmahaqueu_tra_ix"
  end

  create_table "portfolio_tempdata", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "stores temporary data for portfolio exports. the id of this ", force: :cascade do |t|
    t.text "data", limit: 4294967295
    t.bigint "expirytime", null: false
    t.bigint "userid", null: false
    t.bigint "instance", default: 0
    t.boolean "queued", default: false, null: false
    t.index ["instance"], name: "porttemp_ins_ix"
    t.index ["userid"], name: "porttemp_use_ix"
  end

  create_table "post", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Generic post table to hold data blog entries etc in differen", force: :cascade do |t|
    t.string "module", limit: 20, default: "", null: false
    t.bigint "userid", default: 0, null: false
    t.bigint "courseid", default: 0, null: false
    t.bigint "groupid", default: 0, null: false
    t.bigint "moduleid", default: 0, null: false
    t.bigint "coursemoduleid", default: 0, null: false
    t.string "subject", limit: 128, default: "", null: false
    t.text "summary", limit: 4294967295
    t.text "content", limit: 4294967295
    t.string "uniquehash", default: "", null: false
    t.bigint "rating", default: 0, null: false
    t.bigint "format", default: 0, null: false
    t.integer "summaryformat", limit: 1, default: 0, null: false
    t.string "attachment", limit: 100
    t.string "publishstate", limit: 20, default: "draft", null: false
    t.bigint "lastmodified", default: 0, null: false
    t.bigint "created", default: 0, null: false
    t.bigint "usermodified"
    t.index ["id", "userid"], name: "post_iduse_uix", unique: true
    t.index ["lastmodified"], name: "post_las_ix"
    t.index ["module"], name: "post_mod_ix"
    t.index ["subject"], name: "post_sub_ix"
    t.index ["usermodified"], name: "post_use_ix"
  end

  create_table "profiling", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Stores the results of all the profiling runs", force: :cascade do |t|
    t.string "runid", limit: 32, default: "", null: false
    t.string "url", default: "", null: false
    t.text "data", limit: 4294967295, null: false
    t.bigint "totalexecutiontime", null: false
    t.bigint "totalcputime", null: false
    t.bigint "totalcalls", null: false
    t.bigint "totalmemory", null: false
    t.integer "runreference", limit: 1, default: 0, null: false
    t.string "runcomment", default: "", null: false
    t.bigint "timecreated", null: false
    t.index ["runid"], name: "prof_run_uix", unique: true
    t.index ["timecreated", "runreference"], name: "prof_timrun_ix"
    t.index ["url", "runreference"], name: "prof_urlrun_ix"
  end

  create_table "qtype_essay_options", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Extra options for essay questions.", force: :cascade do |t|
    t.bigint "questionid", null: false
    t.string "responseformat", limit: 16, default: "editor", null: false
    t.integer "responserequired", limit: 1, default: 1, null: false
    t.integer "responsefieldlines", limit: 2, default: 15, null: false
    t.integer "attachments", limit: 2, default: 0, null: false
    t.integer "attachmentsrequired", limit: 2, default: 0, null: false
    t.text "graderinfo", limit: 4294967295
    t.integer "graderinfoformat", limit: 2, default: 0, null: false
    t.text "responsetemplate", limit: 4294967295
    t.integer "responsetemplateformat", limit: 2, default: 0, null: false
    t.index ["questionid"], name: "qtypessaopti_que_uix", unique: true
  end

  create_table "qtype_match_options", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Defines the question-type specific options for matching ques", force: :cascade do |t|
    t.bigint "questionid", default: 0, null: false
    t.integer "shuffleanswers", limit: 2, default: 1, null: false
    t.text "correctfeedback", limit: 4294967295, null: false
    t.integer "correctfeedbackformat", limit: 1, default: 0, null: false
    t.text "partiallycorrectfeedback", limit: 4294967295, null: false
    t.integer "partiallycorrectfeedbackformat", limit: 1, default: 0, null: false
    t.text "incorrectfeedback", limit: 4294967295, null: false
    t.integer "incorrectfeedbackformat", limit: 1, default: 0, null: false
    t.integer "shownumcorrect", limit: 1, default: 0, null: false
    t.index ["questionid"], name: "qtypmatcopti_que_uix", unique: true
  end

  create_table "qtype_match_subquestions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "The subquestions that make up a matching question", force: :cascade do |t|
    t.bigint "questionid", default: 0, null: false
    t.text "questiontext", limit: 4294967295, null: false
    t.integer "questiontextformat", limit: 1, default: 0, null: false
    t.string "answertext", default: "", null: false
    t.index ["questionid"], name: "qtypmatcsubq_que_ix"
  end

  create_table "qtype_multichoice_options", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Options for multiple choice questions", force: :cascade do |t|
    t.bigint "questionid", default: 0, null: false
    t.integer "layout", limit: 2, default: 0, null: false
    t.integer "single", limit: 2, default: 0, null: false
    t.integer "shuffleanswers", limit: 2, default: 1, null: false
    t.text "correctfeedback", limit: 4294967295, null: false
    t.integer "correctfeedbackformat", limit: 1, default: 0, null: false
    t.text "partiallycorrectfeedback", limit: 4294967295, null: false
    t.integer "partiallycorrectfeedbackformat", limit: 1, default: 0, null: false
    t.text "incorrectfeedback", limit: 4294967295, null: false
    t.integer "incorrectfeedbackformat", limit: 1, default: 0, null: false
    t.string "answernumbering", limit: 10, default: "abc", null: false
    t.integer "shownumcorrect", limit: 1, default: 0, null: false
    t.index ["questionid"], name: "qtypmultopti_que_uix", unique: true
  end

  create_table "qtype_randomsamatch_options", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Info about a random short-answer matching question", force: :cascade do |t|
    t.bigint "questionid", default: 0, null: false
    t.bigint "choose", default: 4, null: false
    t.integer "subcats", limit: 1, default: 1, null: false
    t.text "correctfeedback", limit: 4294967295, null: false
    t.integer "correctfeedbackformat", limit: 1, default: 0, null: false
    t.text "partiallycorrectfeedback", limit: 4294967295, null: false
    t.integer "partiallycorrectfeedbackformat", limit: 1, default: 0, null: false
    t.text "incorrectfeedback", limit: 4294967295, null: false
    t.integer "incorrectfeedbackformat", limit: 1, default: 0, null: false
    t.integer "shownumcorrect", limit: 1, default: 0, null: false
    t.index ["questionid"], name: "qtyprandopti_que_uix", unique: true
  end

  create_table "qtype_shortanswer_options", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Options for short answer questions", force: :cascade do |t|
    t.bigint "questionid", default: 0, null: false
    t.integer "usecase", limit: 1, default: 0, null: false
    t.index ["questionid"], name: "qtypshoropti_que_uix", unique: true
  end

  create_table "question", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "The questions themselves", force: :cascade do |t|
    t.bigint "category", default: 0, null: false
    t.bigint "parent", default: 0, null: false
    t.string "name", default: "", null: false
    t.text "questiontext", limit: 4294967295, null: false
    t.integer "questiontextformat", limit: 1, default: 0, null: false
    t.text "generalfeedback", limit: 4294967295, null: false
    t.integer "generalfeedbackformat", limit: 1, default: 0, null: false
    t.decimal "defaultmark", precision: 12, scale: 7, default: "1.0", null: false
    t.decimal "penalty", precision: 12, scale: 7, default: "0.3333333", null: false
    t.string "qtype", limit: 20, default: "", null: false
    t.bigint "length", default: 1, null: false
    t.string "stamp", default: "", null: false
    t.string "version", default: "", null: false
    t.boolean "hidden", default: false, null: false
    t.bigint "timecreated", default: 0, null: false
    t.bigint "timemodified", default: 0, null: false
    t.bigint "createdby"
    t.bigint "modifiedby"
    t.index ["category"], name: "ques_cat_ix"
    t.index ["createdby"], name: "ques_cre_ix"
    t.index ["modifiedby"], name: "ques_mod_ix"
    t.index ["parent"], name: "ques_par_ix"
  end

  create_table "question_answers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Answers, with a fractional grade (0-1) and feedback", force: :cascade do |t|
    t.bigint "question", default: 0, null: false
    t.text "answer", limit: 4294967295, null: false
    t.integer "answerformat", limit: 1, default: 0, null: false
    t.decimal "fraction", precision: 12, scale: 7, default: "0.0", null: false
    t.text "feedback", limit: 4294967295, null: false
    t.integer "feedbackformat", limit: 1, default: 0, null: false
    t.index ["question"], name: "quesansw_que_ix"
  end

  create_table "question_attempt_step_data", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Each question_attempt_step has an associative array of the d", force: :cascade do |t|
    t.bigint "attemptstepid", null: false
    t.string "name", limit: 32, default: "", null: false
    t.text "value", limit: 4294967295
    t.index ["attemptstepid", "name"], name: "quesattestepdata_attnam_uix", unique: true
    t.index ["attemptstepid"], name: "quesattestepdata_att_ix"
  end

  create_table "question_attempt_steps", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Stores one step in in a question attempt. As well as the dat", force: :cascade do |t|
    t.bigint "questionattemptid", null: false
    t.bigint "sequencenumber", null: false
    t.string "state", limit: 13, default: "", null: false
    t.decimal "fraction", precision: 12, scale: 7
    t.bigint "timecreated", null: false
    t.bigint "userid"
    t.index ["questionattemptid", "sequencenumber"], name: "quesattestep_queseq_uix", unique: true
    t.index ["questionattemptid"], name: "quesattestep_que_ix"
    t.index ["userid"], name: "quesattestep_use_ix"
  end

  create_table "question_attempts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Each row here corresponds to an attempt at one question, as ", force: :cascade do |t|
    t.bigint "questionusageid", null: false
    t.bigint "slot", null: false
    t.string "behaviour", limit: 32, default: "", null: false
    t.bigint "questionid", null: false
    t.bigint "variant", default: 1, null: false
    t.decimal "maxmark", precision: 12, scale: 7, null: false
    t.decimal "minfraction", precision: 12, scale: 7, null: false
    t.decimal "maxfraction", precision: 12, scale: 7, default: "1.0", null: false
    t.boolean "flagged", default: false, null: false
    t.text "questionsummary", limit: 4294967295
    t.text "rightanswer", limit: 4294967295
    t.text "responsesummary", limit: 4294967295
    t.bigint "timemodified", null: false
    t.index ["questionid"], name: "quesatte_que_ix"
    t.index ["questionusageid", "slot"], name: "quesatte_queslo_uix", unique: true
    t.index ["questionusageid"], name: "quesatte_que2_ix"
  end

  create_table "question_calculated", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Options for questions of type calculated", force: :cascade do |t|
    t.bigint "question", default: 0, null: false
    t.bigint "answer", default: 0, null: false
    t.string "tolerance", limit: 20, default: "0.0", null: false
    t.bigint "tolerancetype", default: 1, null: false
    t.bigint "correctanswerlength", default: 2, null: false
    t.bigint "correctanswerformat", default: 2, null: false
    t.index ["answer"], name: "quescalc_ans_ix"
    t.index ["question"], name: "quescalc_que_ix"
  end

  create_table "question_calculated_options", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Options for questions of type calculated", force: :cascade do |t|
    t.bigint "question", default: 0, null: false
    t.integer "synchronize", limit: 1, default: 0, null: false
    t.integer "single", limit: 2, default: 0, null: false
    t.integer "shuffleanswers", limit: 2, default: 0, null: false
    t.text "correctfeedback", limit: 4294967295
    t.integer "correctfeedbackformat", limit: 1, default: 0, null: false
    t.text "partiallycorrectfeedback", limit: 4294967295
    t.integer "partiallycorrectfeedbackformat", limit: 1, default: 0, null: false
    t.text "incorrectfeedback", limit: 4294967295
    t.integer "incorrectfeedbackformat", limit: 1, default: 0, null: false
    t.string "answernumbering", limit: 10, default: "abc", null: false
    t.integer "shownumcorrect", limit: 1, default: 0, null: false
    t.index ["question"], name: "quescalcopti_que_ix"
  end

  create_table "question_categories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Categories are for grouping questions", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.bigint "contextid", default: 0, null: false
    t.text "info", limit: 4294967295, null: false
    t.integer "infoformat", limit: 1, default: 0, null: false
    t.string "stamp", default: "", null: false
    t.bigint "parent", default: 0, null: false
    t.bigint "sortorder", default: 999, null: false
    t.index ["contextid"], name: "quescate_con_ix"
    t.index ["parent"], name: "quescate_par_ix"
  end

  create_table "question_dataset_definitions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Organises and stores properties for dataset items", force: :cascade do |t|
    t.bigint "category", default: 0, null: false
    t.string "name", default: "", null: false
    t.bigint "type", default: 0, null: false
    t.string "options", default: "", null: false
    t.bigint "itemcount", default: 0, null: false
    t.index ["category"], name: "quesdatadefi_cat_ix"
  end

  create_table "question_dataset_items", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Individual dataset items", force: :cascade do |t|
    t.bigint "definition", default: 0, null: false
    t.bigint "itemnumber", default: 0, null: false
    t.string "value", default: "", null: false
    t.index ["definition"], name: "quesdataitem_def_ix"
  end

  create_table "question_datasets", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Many-many relation between questions and dataset definitions", force: :cascade do |t|
    t.bigint "question", default: 0, null: false
    t.bigint "datasetdefinition", default: 0, null: false
    t.index ["datasetdefinition"], name: "quesdata_dat_ix"
    t.index ["question", "datasetdefinition"], name: "quesdata_quedat_ix"
    t.index ["question"], name: "quesdata_que_ix"
  end

  create_table "question_hints", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Stores the the part of the question definition that gives di", force: :cascade do |t|
    t.bigint "questionid", null: false
    t.text "hint", limit: 4294967295, null: false
    t.integer "hintformat", limit: 2, default: 0, null: false
    t.boolean "shownumcorrect"
    t.boolean "clearwrong"
    t.string "options"
    t.index ["questionid"], name: "queshint_que_ix"
  end

  create_table "question_multianswer", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Options for multianswer questions", force: :cascade do |t|
    t.bigint "question", default: 0, null: false
    t.text "sequence", limit: 4294967295, null: false
    t.index ["question"], name: "quesmult_que_ix"
  end

  create_table "question_numerical", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Options for numerical questions.", force: :cascade do |t|
    t.bigint "question", default: 0, null: false
    t.bigint "answer", default: 0, null: false
    t.string "tolerance", default: "0.0", null: false
    t.index ["answer"], name: "quesnume_ans_ix"
    t.index ["question"], name: "quesnume_que_ix"
  end

  create_table "question_numerical_options", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Options for questions of type numerical This table is also u", force: :cascade do |t|
    t.bigint "question", default: 0, null: false
    t.integer "showunits", limit: 2, default: 0, null: false
    t.integer "unitsleft", limit: 2, default: 0, null: false
    t.integer "unitgradingtype", limit: 2, default: 0, null: false
    t.decimal "unitpenalty", precision: 12, scale: 7, default: "0.1", null: false
    t.index ["question"], name: "quesnumeopti_que_ix"
  end

  create_table "question_numerical_units", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Optional unit options for numerical questions. This table is", force: :cascade do |t|
    t.bigint "question", default: 0, null: false
    t.decimal "multiplier", precision: 40, scale: 20, default: "1.0", null: false
    t.string "unit", limit: 50, default: "", null: false
    t.index ["question", "unit"], name: "quesnumeunit_queuni_uix", unique: true
    t.index ["question"], name: "quesnumeunit_que_ix"
  end

  create_table "question_response_analysis", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Analysis of student responses given to questions.", force: :cascade do |t|
    t.string "hashcode", limit: 40, default: "", null: false
    t.string "whichtries", default: "", null: false
    t.bigint "timemodified", null: false
    t.bigint "questionid", null: false
    t.bigint "variant"
    t.string "subqid", limit: 100, default: "", null: false
    t.string "aid", limit: 100
    t.text "response", limit: 4294967295
    t.decimal "credit", precision: 15, scale: 5, null: false
  end

  create_table "question_response_count", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Count for each responses for each try at a question.", force: :cascade do |t|
    t.bigint "analysisid", null: false
    t.bigint "try", null: false
    t.bigint "rcount", null: false
    t.index ["analysisid"], name: "quesrespcoun_ana_ix"
  end

  create_table "question_statistics", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Statistics for individual questions used in an activity.", force: :cascade do |t|
    t.string "hashcode", limit: 40, default: "", null: false
    t.bigint "timemodified", null: false
    t.bigint "questionid", null: false
    t.bigint "slot"
    t.integer "subquestion", limit: 2, null: false
    t.bigint "variant"
    t.bigint "s", default: 0, null: false
    t.decimal "effectiveweight", precision: 15, scale: 5
    t.integer "negcovar", limit: 1, default: 0, null: false
    t.decimal "discriminationindex", precision: 15, scale: 5
    t.decimal "discriminativeefficiency", precision: 15, scale: 5
    t.decimal "sd", precision: 15, scale: 10
    t.decimal "facility", precision: 15, scale: 10
    t.text "subquestions", limit: 4294967295
    t.decimal "maxmark", precision: 12, scale: 7
    t.text "positions", limit: 4294967295
    t.decimal "randomguessscore", precision: 12, scale: 7
  end

  create_table "question_truefalse", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Options for True-False questions", force: :cascade do |t|
    t.bigint "question", default: 0, null: false
    t.bigint "trueanswer", default: 0, null: false
    t.bigint "falseanswer", default: 0, null: false
    t.index ["question"], name: "questrue_que_ix"
  end

  create_table "question_usages", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "This table's main purpose it to assign a unique id to each a", force: :cascade do |t|
    t.bigint "contextid", null: false
    t.string "component", default: "", null: false
    t.string "preferredbehaviour", limit: 32, default: "", null: false
    t.index ["contextid"], name: "quesusag_con_ix"
  end

  create_table "quiz", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "The settings for each quiz.", force: :cascade do |t|
    t.bigint "course", default: 0, null: false
    t.string "name", default: "", null: false
    t.text "intro", limit: 4294967295, null: false
    t.integer "introformat", limit: 2, default: 0, null: false
    t.bigint "timeopen", default: 0, null: false
    t.bigint "timeclose", default: 0, null: false
    t.bigint "timelimit", default: 0, null: false
    t.string "overduehandling", limit: 16, default: "autoabandon", null: false
    t.bigint "graceperiod", default: 0, null: false
    t.string "preferredbehaviour", limit: 32, default: "", null: false
    t.integer "attempts", limit: 3, default: 0, null: false
    t.integer "attemptonlast", limit: 2, default: 0, null: false
    t.integer "grademethod", limit: 2, default: 1, null: false
    t.integer "decimalpoints", limit: 2, default: 2, null: false
    t.integer "questiondecimalpoints", limit: 2, default: -1, null: false
    t.integer "reviewattempt", limit: 3, default: 0, null: false
    t.integer "reviewcorrectness", limit: 3, default: 0, null: false
    t.integer "reviewmarks", limit: 3, default: 0, null: false
    t.integer "reviewspecificfeedback", limit: 3, default: 0, null: false
    t.integer "reviewgeneralfeedback", limit: 3, default: 0, null: false
    t.integer "reviewrightanswer", limit: 3, default: 0, null: false
    t.integer "reviewoverallfeedback", limit: 3, default: 0, null: false
    t.bigint "questionsperpage", default: 0, null: false
    t.string "navmethod", limit: 16, default: "free", null: false
    t.integer "shufflequestions", limit: 2, default: 0, null: false
    t.integer "shuffleanswers", limit: 2, default: 0, null: false
    t.decimal "sumgrades", precision: 10, scale: 5, default: "0.0", null: false
    t.decimal "grade", precision: 10, scale: 5, default: "0.0", null: false
    t.bigint "timecreated", default: 0, null: false
    t.bigint "timemodified", default: 0, null: false
    t.string "password", default: "", null: false
    t.string "subnet", default: "", null: false
    t.string "browsersecurity", limit: 32, default: "", null: false
    t.bigint "delay1", default: 0, null: false
    t.bigint "delay2", default: 0, null: false
    t.integer "showuserpicture", limit: 2, default: 0, null: false
    t.integer "showblocks", limit: 2, default: 0, null: false
    t.index ["course"], name: "quiz_cou_ix"
  end

  create_table "quiz_attempts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Stores users attempts at quizzes.", force: :cascade do |t|
    t.bigint "quiz", default: 0, null: false
    t.bigint "userid", default: 0, null: false
    t.integer "attempt", limit: 3, default: 0, null: false
    t.bigint "uniqueid", default: 0, null: false
    t.text "layout", limit: 4294967295, null: false
    t.bigint "currentpage", default: 0, null: false
    t.integer "preview", limit: 2, default: 0, null: false
    t.string "state", limit: 16, default: "inprogress", null: false
    t.bigint "timestart", default: 0, null: false
    t.bigint "timefinish", default: 0, null: false
    t.bigint "timemodified", default: 0, null: false
    t.bigint "timecheckstate", default: 0
    t.decimal "sumgrades", precision: 10, scale: 5
    t.index ["quiz", "userid", "attempt"], name: "quizatte_quiuseatt_uix", unique: true
    t.index ["quiz"], name: "quizatte_qui_ix"
    t.index ["state", "timecheckstate"], name: "quizatte_statim_ix"
    t.index ["uniqueid"], name: "quizatte_uni_uix", unique: true
    t.index ["userid"], name: "quizatte_use_ix"
  end

  create_table "quiz_feedback", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Feedback given to students based on which grade band their o", force: :cascade do |t|
    t.bigint "quizid", default: 0, null: false
    t.text "feedbacktext", limit: 4294967295, null: false
    t.integer "feedbacktextformat", limit: 1, default: 0, null: false
    t.decimal "mingrade", precision: 10, scale: 5, default: "0.0", null: false
    t.decimal "maxgrade", precision: 10, scale: 5, default: "0.0", null: false
    t.index ["quizid"], name: "quizfeed_qui_ix"
  end

  create_table "quiz_grades", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Stores the overall grade for each user on the quiz, based on", force: :cascade do |t|
    t.bigint "quiz", default: 0, null: false
    t.bigint "userid", default: 0, null: false
    t.decimal "grade", precision: 10, scale: 5, default: "0.0", null: false
    t.bigint "timemodified", default: 0, null: false
    t.index ["quiz"], name: "quizgrad_qui_ix"
    t.index ["userid"], name: "quizgrad_use_ix"
  end

  create_table "quiz_overrides", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "The overrides to quiz settings on a per-user and per-group b", force: :cascade do |t|
    t.bigint "quiz", default: 0, null: false
    t.bigint "groupid"
    t.bigint "userid"
    t.bigint "timeopen"
    t.bigint "timeclose"
    t.bigint "timelimit"
    t.integer "attempts", limit: 3
    t.string "password"
    t.index ["groupid"], name: "quizover_gro_ix"
    t.index ["quiz"], name: "quizover_qui_ix"
    t.index ["userid"], name: "quizover_use_ix"
  end

  create_table "quiz_overview_regrades", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "This table records which question attempts need regrading an", force: :cascade do |t|
    t.bigint "questionusageid", null: false
    t.bigint "slot", null: false
    t.decimal "newfraction", precision: 12, scale: 7
    t.decimal "oldfraction", precision: 12, scale: 7
    t.integer "regraded", limit: 2, null: false
    t.bigint "timemodified", null: false
  end

  create_table "quiz_reports", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Lists all the installed quiz reports and their display order", force: :cascade do |t|
    t.string "name"
    t.bigint "displayorder", null: false
    t.string "capability"
    t.index ["name"], name: "quizrepo_nam_uix", unique: true
  end

  create_table "quiz_slots", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Stores the question used in a quiz, with the order, and for ", force: :cascade do |t|
    t.bigint "slot", null: false
    t.bigint "quizid", default: 0, null: false
    t.bigint "page", null: false
    t.bigint "questionid", default: 0, null: false
    t.decimal "maxmark", precision: 12, scale: 7, default: "0.0", null: false
    t.index ["questionid"], name: "quizslot_que_ix"
    t.index ["quizid", "slot"], name: "quizslot_quislo_uix", unique: true
    t.index ["quizid"], name: "quizslot_qui_ix"
  end

  create_table "quiz_statistics", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "table to cache results from analysis done in statistics repo", force: :cascade do |t|
    t.string "hashcode", limit: 40, default: "", null: false
    t.integer "whichattempts", limit: 2, null: false
    t.bigint "timemodified", null: false
    t.bigint "firstattemptscount", null: false
    t.bigint "highestattemptscount", null: false
    t.bigint "lastattemptscount", null: false
    t.bigint "allattemptscount", null: false
    t.decimal "firstattemptsavg", precision: 15, scale: 5
    t.decimal "highestattemptsavg", precision: 15, scale: 5
    t.decimal "lastattemptsavg", precision: 15, scale: 5
    t.decimal "allattemptsavg", precision: 15, scale: 5
    t.decimal "median", precision: 15, scale: 5
    t.decimal "standarddeviation", precision: 15, scale: 5
    t.decimal "skewness", precision: 15, scale: 10
    t.decimal "kurtosis", precision: 15, scale: 5
    t.decimal "cic", precision: 15, scale: 10
    t.decimal "errorratio", precision: 15, scale: 10
    t.decimal "standarderror", precision: 15, scale: 10
  end

  create_table "rating", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "moodle ratings", force: :cascade do |t|
    t.bigint "contextid", null: false
    t.string "component", limit: 100, default: "", null: false
    t.string "ratingarea", limit: 50, default: "", null: false
    t.bigint "itemid", null: false
    t.bigint "scaleid", null: false
    t.bigint "rating", null: false
    t.bigint "userid", null: false
    t.bigint "timecreated", null: false
    t.bigint "timemodified", null: false
    t.index ["component", "ratingarea", "contextid", "itemid"], name: "rati_comratconite_ix"
    t.index ["contextid"], name: "rati_con_ix"
    t.index ["userid"], name: "rati_use_ix"
  end

  create_table "registration_hubs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "hub where the site is registered on with their associated to", force: :cascade do |t|
    t.string "token", default: "", null: false
    t.string "hubname", default: "", null: false
    t.string "huburl", default: "", null: false
    t.boolean "confirmed", default: false, null: false
    t.string "secret"
  end

  create_table "repository", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "This table contains one entry for every configured external ", force: :cascade do |t|
    t.string "type", default: "", null: false
    t.boolean "visible", default: true
    t.bigint "sortorder", default: 0, null: false
  end

  create_table "repository_instance_config", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "The config for intances", force: :cascade do |t|
    t.bigint "instanceid", null: false
    t.string "name", default: "", null: false
    t.text "value", limit: 4294967295
  end

  create_table "repository_instances", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "This table contains one entry for every configured external ", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.bigint "typeid", null: false
    t.bigint "userid", default: 0, null: false
    t.bigint "contextid", null: false
    t.string "username"
    t.string "password"
    t.bigint "timecreated"
    t.bigint "timemodified"
    t.boolean "readonly", default: false, null: false
  end

  create_table "resource", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Each record is one resource and its config data", force: :cascade do |t|
    t.bigint "course", default: 0, null: false
    t.string "name", default: "", null: false
    t.text "intro", limit: 4294967295
    t.integer "introformat", limit: 2, default: 0, null: false
    t.integer "tobemigrated", limit: 2, default: 0, null: false
    t.integer "legacyfiles", limit: 2, default: 0, null: false
    t.bigint "legacyfileslast"
    t.integer "display", limit: 2, default: 0, null: false
    t.text "displayoptions", limit: 4294967295
    t.integer "filterfiles", limit: 2, default: 0, null: false
    t.bigint "revision", default: 0, null: false
    t.bigint "timemodified", default: 0, null: false
    t.index ["course"], name: "reso_cou_ix"
  end

  create_table "resource_old", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "backup of all old resource instances from 1.9", force: :cascade do |t|
    t.bigint "course", default: 0, null: false
    t.string "name", default: "", null: false
    t.string "type", limit: 30, default: "", null: false
    t.string "reference", default: "", null: false
    t.text "intro", limit: 4294967295
    t.integer "introformat", limit: 2, default: 0, null: false
    t.text "alltext", limit: 4294967295, null: false
    t.text "popup", limit: 4294967295, null: false
    t.string "options", default: "", null: false
    t.bigint "timemodified", default: 0, null: false
    t.bigint "oldid", null: false
    t.bigint "cmid"
    t.string "newmodule", limit: 50
    t.bigint "newid"
    t.bigint "migrated", default: 0, null: false
    t.index ["cmid"], name: "resoold_cmi_ix"
    t.index ["oldid"], name: "resoold_old_uix", unique: true
  end

  create_table "role", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "moodle roles", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "shortname", limit: 100, default: "", null: false
    t.text "description", limit: 4294967295, null: false
    t.bigint "sortorder", default: 0, null: false
    t.string "archetype", limit: 30, default: "", null: false
    t.index ["shortname"], name: "role_sho_uix", unique: true
    t.index ["sortorder"], name: "role_sor_uix", unique: true
  end

  create_table "role_allow_assign", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "this defines what role can assign what role", force: :cascade do |t|
    t.bigint "roleid", default: 0, null: false
    t.bigint "allowassign", default: 0, null: false
    t.index ["allowassign"], name: "rolealloassi_all_ix"
    t.index ["roleid", "allowassign"], name: "rolealloassi_rolall_uix", unique: true
    t.index ["roleid"], name: "rolealloassi_rol_ix"
  end

  create_table "role_allow_override", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "this defines what role can override what role", force: :cascade do |t|
    t.bigint "roleid", default: 0, null: false
    t.bigint "allowoverride", default: 0, null: false
    t.index ["allowoverride"], name: "rolealloover_all_ix"
    t.index ["roleid", "allowoverride"], name: "rolealloover_rolall_uix", unique: true
    t.index ["roleid"], name: "rolealloover_rol_ix"
  end

  create_table "role_allow_switch", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "This table stores which which other roles a user is allowed ", force: :cascade do |t|
    t.bigint "roleid", null: false
    t.bigint "allowswitch", null: false
    t.index ["allowswitch"], name: "rolealloswit_all_ix"
    t.index ["roleid", "allowswitch"], name: "rolealloswit_rolall_uix", unique: true
    t.index ["roleid"], name: "rolealloswit_rol_ix"
  end

  create_table "role_assignments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "assigning roles in different context", force: :cascade do |t|
    t.bigint "roleid", default: 0, null: false
    t.bigint "contextid", default: 0, null: false
    t.bigint "userid", default: 0, null: false
    t.bigint "timemodified", default: 0, null: false
    t.bigint "modifierid", default: 0, null: false
    t.string "component", limit: 100, default: "", null: false
    t.bigint "itemid", default: 0, null: false
    t.bigint "sortorder", default: 0, null: false
    t.index ["component", "itemid", "userid"], name: "roleassi_comiteuse_ix"
    t.index ["contextid"], name: "roleassi_con_ix"
    t.index ["roleid", "contextid"], name: "roleassi_rolcon_ix"
    t.index ["roleid"], name: "roleassi_rol_ix"
    t.index ["sortorder"], name: "roleassi_sor_ix"
    t.index ["userid", "contextid", "roleid"], name: "roleassi_useconrol_ix"
    t.index ["userid"], name: "roleassi_use_ix"
  end

  create_table "role_capabilities", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "permission has to be signed, overriding a capability for a p", force: :cascade do |t|
    t.bigint "contextid", default: 0, null: false
    t.bigint "roleid", default: 0, null: false
    t.string "capability", default: "", null: false
    t.bigint "permission", default: 0, null: false
    t.bigint "timemodified", default: 0, null: false
    t.bigint "modifierid", default: 0, null: false
    t.index ["capability"], name: "rolecapa_cap_ix"
    t.index ["contextid"], name: "rolecapa_con_ix"
    t.index ["modifierid"], name: "rolecapa_mod_ix"
    t.index ["roleid", "contextid", "capability"], name: "rolecapa_rolconcap_uix", unique: true
    t.index ["roleid"], name: "rolecapa_rol_ix"
  end

  create_table "role_context_levels", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Lists which roles can be assigned at which context levels. T", force: :cascade do |t|
    t.bigint "roleid", null: false
    t.bigint "contextlevel", null: false
    t.index ["contextlevel", "roleid"], name: "rolecontleve_conrol_uix", unique: true
    t.index ["roleid"], name: "rolecontleve_rol_ix"
  end

  create_table "role_names", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "role names in native strings", force: :cascade do |t|
    t.bigint "roleid", default: 0, null: false
    t.bigint "contextid", default: 0, null: false
    t.string "name", default: "", null: false
    t.index ["contextid"], name: "rolename_con_ix"
    t.index ["roleid", "contextid"], name: "rolename_rolcon_uix", unique: true
    t.index ["roleid"], name: "rolename_rol_ix"
  end

  create_table "role_sortorder", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "sort order of course managers in a course", force: :cascade do |t|
    t.bigint "userid", null: false
    t.bigint "roleid", null: false
    t.bigint "contextid", null: false
    t.bigint "sortoder", null: false
    t.index ["contextid"], name: "rolesort_con_ix"
    t.index ["roleid"], name: "rolesort_rol_ix"
    t.index ["userid", "roleid", "contextid"], name: "rolesort_userolcon_uix", unique: true
    t.index ["userid"], name: "rolesort_use_ix"
  end

  create_table "scale", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Defines grading scales", force: :cascade do |t|
    t.bigint "courseid", default: 0, null: false
    t.bigint "userid", default: 0, null: false
    t.string "name", default: "", null: false
    t.text "scale", limit: 4294967295, null: false
    t.text "description", limit: 4294967295, null: false
    t.integer "descriptionformat", limit: 1, default: 0, null: false
    t.bigint "timemodified", default: 0, null: false
    t.index ["courseid"], name: "scal_cou_ix"
  end

  create_table "scale_history", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "History table", force: :cascade do |t|
    t.bigint "action", default: 0, null: false
    t.bigint "oldid", null: false
    t.string "source"
    t.bigint "timemodified"
    t.bigint "loggeduser"
    t.bigint "courseid", default: 0, null: false
    t.bigint "userid", default: 0, null: false
    t.string "name", default: "", null: false
    t.text "scale", limit: 4294967295, null: false
    t.text "description", limit: 4294967295, null: false
    t.index ["action"], name: "scalhist_act_ix"
    t.index ["courseid"], name: "scalhist_cou_ix"
    t.index ["loggeduser"], name: "scalhist_log_ix"
    t.index ["oldid"], name: "scalhist_old_ix"
  end

  create_table "scorm", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "each table is one SCORM module and its configuration", force: :cascade do |t|
    t.bigint "course", default: 0, null: false
    t.string "name", default: "", null: false
    t.string "scormtype", limit: 50, default: "local", null: false
    t.string "reference", default: "", null: false
    t.text "intro", limit: 4294967295, null: false
    t.integer "introformat", limit: 2, default: 0, null: false
    t.string "version", limit: 9, default: "", null: false
    t.float "maxgrade", limit: 53, default: 0.0, null: false
    t.integer "grademethod", limit: 1, default: 0, null: false
    t.bigint "whatgrade", default: 0, null: false
    t.bigint "maxattempt", default: 1, null: false
    t.boolean "forcecompleted", default: true, null: false
    t.boolean "forcenewattempt", default: false, null: false
    t.boolean "lastattemptlock", default: false, null: false
    t.boolean "displayattemptstatus", default: true, null: false
    t.boolean "displaycoursestructure", default: true, null: false
    t.boolean "updatefreq", default: false, null: false
    t.string "sha1hash", limit: 40
    t.string "md5hash", limit: 32, default: "", null: false
    t.bigint "revision", default: 0, null: false
    t.bigint "launch", default: 0, null: false
    t.boolean "skipview", default: true, null: false
    t.boolean "hidebrowse", default: false, null: false
    t.boolean "hidetoc", default: false, null: false
    t.boolean "nav", default: true, null: false
    t.bigint "navpositionleft", default: -100
    t.bigint "navpositiontop", default: -100
    t.boolean "auto", default: false, null: false
    t.boolean "popup", default: false, null: false
    t.string "options", default: "", null: false
    t.bigint "width", default: 100, null: false
    t.bigint "height", default: 600, null: false
    t.bigint "timeopen", default: 0, null: false
    t.bigint "timeclose", default: 0, null: false
    t.bigint "timemodified", default: 0, null: false
    t.boolean "completionstatusrequired"
    t.integer "completionscorerequired", limit: 1
    t.integer "displayactivityname", limit: 2, default: 1, null: false
    t.index ["course"], name: "scor_cou_ix"
  end

  create_table "scorm_aicc_session", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Used by AICC HACP to store session information", force: :cascade do |t|
    t.bigint "userid", default: 0, null: false
    t.bigint "scormid", default: 0, null: false
    t.string "hacpsession", default: "", null: false
    t.bigint "scoid", default: 0
    t.string "scormmode", limit: 50
    t.string "scormstatus"
    t.bigint "attempt"
    t.string "lessonstatus"
    t.string "sessiontime"
    t.bigint "timecreated", default: 0, null: false
    t.bigint "timemodified", default: 0, null: false
    t.index ["scormid"], name: "scoraiccsess_sco_ix"
    t.index ["userid"], name: "scoraiccsess_use_ix"
  end

  create_table "scorm_scoes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "each SCO part of the SCORM module", force: :cascade do |t|
    t.bigint "scorm", default: 0, null: false
    t.string "manifest", default: "", null: false
    t.string "organization", default: "", null: false
    t.string "parent", default: "", null: false
    t.string "identifier", default: "", null: false
    t.text "launch", limit: 4294967295, null: false
    t.string "scormtype", limit: 5, default: "", null: false
    t.string "title", default: "", null: false
    t.bigint "sortorder", default: 0, null: false
    t.index ["scorm"], name: "scorscoe_sco_ix"
  end

  create_table "scorm_scoes_data", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Contains variable data get from packages", force: :cascade do |t|
    t.bigint "scoid", default: 0, null: false
    t.string "name", default: "", null: false
    t.text "value", limit: 4294967295, null: false
    t.index ["scoid"], name: "scorscoedata_sco_ix"
  end

  create_table "scorm_scoes_track", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "to track SCOes", force: :cascade do |t|
    t.bigint "userid", default: 0, null: false
    t.bigint "scormid", default: 0, null: false
    t.bigint "scoid", default: 0, null: false
    t.bigint "attempt", default: 1, null: false
    t.string "element", default: "", null: false
    t.text "value", limit: 4294967295, null: false
    t.bigint "timemodified", default: 0, null: false
    t.index ["element"], name: "scorscoetrac_ele_ix"
    t.index ["scoid"], name: "scorscoetrac_sco2_ix"
    t.index ["scormid"], name: "scorscoetrac_sco_ix"
    t.index ["userid", "scormid", "scoid", "attempt", "element"], name: "scorscoetrac_usescoscoatte_uix", unique: true
    t.index ["userid"], name: "scorscoetrac_use_ix"
  end

  create_table "scorm_seq_mapinfo", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "SCORM2004 objective mapinfo description", force: :cascade do |t|
    t.bigint "scoid", default: 0, null: false
    t.bigint "objectiveid", default: 0, null: false
    t.bigint "targetobjectiveid", default: 0, null: false
    t.boolean "readsatisfiedstatus", default: true, null: false
    t.boolean "readnormalizedmeasure", default: true, null: false
    t.boolean "writesatisfiedstatus", default: false, null: false
    t.boolean "writenormalizedmeasure", default: false, null: false
    t.index ["objectiveid"], name: "scorseqmapi_obj_ix"
    t.index ["scoid", "id", "objectiveid"], name: "scorseqmapi_scoidobj_uix", unique: true
    t.index ["scoid"], name: "scorseqmapi_sco_ix"
  end

  create_table "scorm_seq_objective", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "SCORM2004 objective description", force: :cascade do |t|
    t.bigint "scoid", default: 0, null: false
    t.boolean "primaryobj", default: false, null: false
    t.string "objectiveid", default: "", null: false
    t.boolean "satisfiedbymeasure", default: true, null: false
    t.float "minnormalizedmeasure", default: 0.0, null: false
    t.index ["scoid", "id"], name: "scorseqobje_scoid_uix", unique: true
    t.index ["scoid"], name: "scorseqobje_sco_ix"
  end

  create_table "scorm_seq_rolluprule", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "SCORM2004 sequencing rule", force: :cascade do |t|
    t.bigint "scoid", default: 0, null: false
    t.string "childactivityset", limit: 15, default: "", null: false
    t.bigint "minimumcount", default: 0, null: false
    t.float "minimumpercent", default: 0.0, null: false
    t.string "conditioncombination", limit: 3, default: "all", null: false
    t.string "action", limit: 15, default: "", null: false
    t.index ["scoid", "id"], name: "scorseqroll_scoid_uix", unique: true
    t.index ["scoid"], name: "scorseqroll_sco_ix"
  end

  create_table "scorm_seq_rolluprulecond", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "SCORM2004 sequencing rule", force: :cascade do |t|
    t.bigint "scoid", default: 0, null: false
    t.bigint "rollupruleid", default: 0, null: false
    t.string "operator", limit: 5, default: "noOp", null: false
    t.string "cond", limit: 25, default: "", null: false
    t.index ["rollupruleid"], name: "scorseqroll_rol_ix"
    t.index ["scoid", "rollupruleid", "id"], name: "scorseqroll_scorolid_uix", unique: true
    t.index ["scoid"], name: "scorseqroll_sco2_ix"
  end

  create_table "scorm_seq_rulecond", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "SCORM2004 rule condition", force: :cascade do |t|
    t.bigint "scoid", default: 0, null: false
    t.bigint "ruleconditionsid", default: 0, null: false
    t.string "refrencedobjective", default: "", null: false
    t.float "measurethreshold", default: 0.0, null: false
    t.string "operator", limit: 5, default: "noOp", null: false
    t.string "cond", limit: 30, default: "always", null: false
    t.index ["id", "scoid", "ruleconditionsid"], name: "scorseqrule_idscorul_uix", unique: true
    t.index ["ruleconditionsid"], name: "scorseqrule_rul_ix"
    t.index ["scoid"], name: "scorseqrule_sco2_ix"
  end

  create_table "scorm_seq_ruleconds", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "SCORM2004 rule conditions", force: :cascade do |t|
    t.bigint "scoid", default: 0, null: false
    t.string "conditioncombination", limit: 3, default: "all", null: false
    t.integer "ruletype", limit: 1, default: 0, null: false
    t.string "action", limit: 25, default: "", null: false
    t.index ["scoid", "id"], name: "scorseqrule_scoid_uix", unique: true
    t.index ["scoid"], name: "scorseqrule_sco_ix"
  end

  create_table "sessions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Database based session storage - now recommended", force: :cascade do |t|
    t.bigint "state", default: 0, null: false
    t.string "sid", limit: 128, default: "", null: false
    t.bigint "userid", null: false
    t.text "sessdata", limit: 4294967295
    t.bigint "timecreated", null: false
    t.bigint "timemodified", null: false
    t.string "firstip", limit: 45
    t.string "lastip", limit: 45
    t.index ["sid"], name: "sess_sid_uix", unique: true
    t.index ["state"], name: "sess_sta_ix"
    t.index ["timecreated"], name: "sess_tim_ix"
    t.index ["timemodified"], name: "sess_tim2_ix"
    t.index ["userid"], name: "sess_use_ix"
  end

  create_table "stats_daily", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "to accumulate daily stats", force: :cascade do |t|
    t.bigint "courseid", default: 0, null: false
    t.bigint "timeend", default: 0, null: false
    t.bigint "roleid", default: 0, null: false
    t.string "stattype", limit: 20, default: "activity", null: false
    t.bigint "stat1", default: 0, null: false
    t.bigint "stat2", default: 0, null: false
    t.index ["courseid"], name: "statdail_cou_ix"
    t.index ["roleid"], name: "statdail_rol_ix"
    t.index ["timeend"], name: "statdail_tim_ix"
  end

  create_table "stats_monthly", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "To accumulate monthly stats", force: :cascade do |t|
    t.bigint "courseid", default: 0, null: false
    t.bigint "timeend", default: 0, null: false
    t.bigint "roleid", default: 0, null: false
    t.string "stattype", limit: 20, default: "activity", null: false
    t.bigint "stat1", default: 0, null: false
    t.bigint "stat2", default: 0, null: false
    t.index ["courseid"], name: "statmont_cou_ix"
    t.index ["roleid"], name: "statmont_rol_ix"
    t.index ["timeend"], name: "statmont_tim_ix"
  end

  create_table "stats_user_daily", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "To accumulate daily stats per course/user", force: :cascade do |t|
    t.bigint "courseid", default: 0, null: false
    t.bigint "userid", default: 0, null: false
    t.bigint "roleid", default: 0, null: false
    t.bigint "timeend", default: 0, null: false
    t.bigint "statsreads", default: 0, null: false
    t.bigint "statswrites", default: 0, null: false
    t.string "stattype", limit: 30, default: "", null: false
    t.index ["courseid"], name: "statuserdail_cou_ix"
    t.index ["roleid"], name: "statuserdail_rol_ix"
    t.index ["timeend"], name: "statuserdail_tim_ix"
    t.index ["userid"], name: "statuserdail_use_ix"
  end

  create_table "stats_user_monthly", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "To accumulate monthly stats per course/user", force: :cascade do |t|
    t.bigint "courseid", default: 0, null: false
    t.bigint "userid", default: 0, null: false
    t.bigint "roleid", default: 0, null: false
    t.bigint "timeend", default: 0, null: false
    t.bigint "statsreads", default: 0, null: false
    t.bigint "statswrites", default: 0, null: false
    t.string "stattype", limit: 30, default: "", null: false
    t.index ["courseid"], name: "statusermont_cou_ix"
    t.index ["roleid"], name: "statusermont_rol_ix"
    t.index ["timeend"], name: "statusermont_tim_ix"
    t.index ["userid"], name: "statusermont_use_ix"
  end

  create_table "stats_user_weekly", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "To accumulate weekly stats per course/user", force: :cascade do |t|
    t.bigint "courseid", default: 0, null: false
    t.bigint "userid", default: 0, null: false
    t.bigint "roleid", default: 0, null: false
    t.bigint "timeend", default: 0, null: false
    t.bigint "statsreads", default: 0, null: false
    t.bigint "statswrites", default: 0, null: false
    t.string "stattype", limit: 30, default: "", null: false
    t.index ["courseid"], name: "statuserweek_cou_ix"
    t.index ["roleid"], name: "statuserweek_rol_ix"
    t.index ["timeend"], name: "statuserweek_tim_ix"
    t.index ["userid"], name: "statuserweek_use_ix"
  end

  create_table "stats_weekly", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "To accumulate weekly stats", force: :cascade do |t|
    t.bigint "courseid", default: 0, null: false
    t.bigint "timeend", default: 0, null: false
    t.bigint "roleid", default: 0, null: false
    t.string "stattype", limit: 20, default: "activity", null: false
    t.bigint "stat1", default: 0, null: false
    t.bigint "stat2", default: 0, null: false
    t.index ["courseid"], name: "statweek_cou_ix"
    t.index ["roleid"], name: "statweek_rol_ix"
    t.index ["timeend"], name: "statweek_tim_ix"
  end

  create_table "survey", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Each record is one SURVEY module with its configuration", force: :cascade do |t|
    t.bigint "course", default: 0, null: false
    t.bigint "template", default: 0, null: false
    t.integer "days", limit: 3, default: 0, null: false
    t.bigint "timecreated", default: 0, null: false
    t.bigint "timemodified", default: 0, null: false
    t.string "name", default: "", null: false
    t.text "intro", limit: 4294967295, null: false
    t.integer "introformat", limit: 2, default: 0, null: false
    t.string "questions", default: "", null: false
    t.index ["course"], name: "surv_cou_ix"
  end

  create_table "survey_analysis", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "text about each survey submission", force: :cascade do |t|
    t.bigint "survey", default: 0, null: false
    t.bigint "userid", default: 0, null: false
    t.text "notes", limit: 4294967295, null: false
    t.index ["survey"], name: "survanal_sur_ix"
    t.index ["userid"], name: "survanal_use_ix"
  end

  create_table "survey_answers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "the answers to each questions filled by the users", force: :cascade do |t|
    t.bigint "userid", default: 0, null: false
    t.bigint "survey", default: 0, null: false
    t.bigint "question", default: 0, null: false
    t.bigint "time", default: 0, null: false
    t.text "answer1", limit: 4294967295, null: false
    t.text "answer2", limit: 4294967295, null: false
    t.index ["question"], name: "survansw_que_ix"
    t.index ["survey"], name: "survansw_sur_ix"
    t.index ["userid"], name: "survansw_use_ix"
  end

  create_table "survey_questions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "the questions conforming one survey", force: :cascade do |t|
    t.string "text", default: "", null: false
    t.string "shorttext", limit: 30, default: "", null: false
    t.string "multi", limit: 100, default: "", null: false
    t.string "intro", limit: 50, default: "", null: false
    t.integer "type", limit: 2, default: 0, null: false
    t.text "options", limit: 4294967295
  end

  create_table "tag", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Tag table - this generic table will replace the old \"tags\" t", force: :cascade do |t|
    t.bigint "userid", null: false
    t.string "name", default: "", null: false
    t.string "rawname", default: "", null: false
    t.string "tagtype"
    t.text "description", limit: 4294967295
    t.integer "descriptionformat", limit: 1, default: 0, null: false
    t.integer "flag", limit: 2, default: 0
    t.bigint "timemodified"
    t.index ["id", "name"], name: "tag_idnam_uix", unique: true
    t.index ["name"], name: "tag_nam_uix", unique: true
    t.index ["userid"], name: "tag_use_ix"
  end

  create_table "tag_correlation", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "The rationale for the 'tag_correlation' table is performance", force: :cascade do |t|
    t.bigint "tagid", null: false
    t.text "correlatedtags", limit: 4294967295, null: false
    t.index ["tagid"], name: "tagcorr_tag_ix"
  end

  create_table "tag_instance", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "tag_instance table holds the information of associations bet", force: :cascade do |t|
    t.bigint "tagid", null: false
    t.string "component", limit: 100
    t.string "itemtype", default: "", null: false
    t.bigint "itemid", null: false
    t.bigint "contextid"
    t.bigint "tiuserid", default: 0, null: false
    t.bigint "ordering"
    t.bigint "timecreated", default: 0, null: false
    t.bigint "timemodified", default: 0, null: false
    t.index ["contextid"], name: "taginst_con_ix"
    t.index ["itemtype", "itemid", "tagid", "tiuserid"], name: "taginst_iteitetagtiu_uix", unique: true
    t.index ["tagid"], name: "taginst_tag_ix"
  end

  create_table "task_adhoc", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "List of adhoc tasks waiting to run.", force: :cascade do |t|
    t.string "component", default: "", null: false
    t.string "classname", default: "", null: false
    t.bigint "nextruntime", null: false
    t.bigint "faildelay"
    t.text "customdata", limit: 4294967295
    t.integer "blocking", limit: 1, default: 0, null: false
    t.index ["nextruntime"], name: "taskadho_nex_ix"
  end

  create_table "task_scheduled", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "List of scheduled tasks to be run by cron.", force: :cascade do |t|
    t.string "component", default: "", null: false
    t.string "classname", default: "", null: false
    t.bigint "lastruntime"
    t.bigint "nextruntime"
    t.integer "blocking", limit: 1, default: 0, null: false
    t.string "minute", limit: 25, default: "", null: false
    t.string "hour", limit: 25, default: "", null: false
    t.string "day", limit: 25, default: "", null: false
    t.string "month", limit: 25, default: "", null: false
    t.string "dayofweek", limit: 25, default: "", null: false
    t.bigint "faildelay"
    t.integer "customised", limit: 1, default: 0, null: false
    t.boolean "disabled", default: false, null: false
    t.index ["classname"], name: "tasksche_cla_uix", unique: true
  end

  create_table "timezone", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Rules for calculating local wall clock time for users", force: :cascade do |t|
    t.string "name", limit: 100, default: "", null: false
    t.bigint "year", default: 0, null: false
    t.string "tzrule", limit: 20, default: "", null: false
    t.bigint "gmtoff", default: 0, null: false
    t.bigint "dstoff", default: 0, null: false
    t.integer "dst_month", limit: 1, default: 0, null: false
    t.integer "dst_startday", limit: 2, default: 0, null: false
    t.integer "dst_weekday", limit: 2, default: 0, null: false
    t.integer "dst_skipweeks", limit: 2, default: 0, null: false
    t.string "dst_time", limit: 6, default: "00:00", null: false
    t.integer "std_month", limit: 1, default: 0, null: false
    t.integer "std_startday", limit: 2, default: 0, null: false
    t.integer "std_weekday", limit: 2, default: 0, null: false
    t.integer "std_skipweeks", limit: 2, default: 0, null: false
    t.string "std_time", limit: 6, default: "00:00", null: false
  end

  create_table "tool_customlang", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Contains the working checkout of all strings and their custo", force: :cascade do |t|
    t.string "lang", limit: 20, default: "", null: false
    t.bigint "componentid", null: false
    t.string "stringid", default: "", null: false
    t.text "original", limit: 4294967295, null: false
    t.text "master", limit: 4294967295
    t.text "local", limit: 4294967295
    t.bigint "timemodified", null: false
    t.bigint "timecustomized"
    t.integer "outdated", limit: 2, default: 0
    t.integer "modified", limit: 2, default: 0
    t.index ["componentid"], name: "toolcust_com_ix"
    t.index ["lang", "componentid", "stringid"], name: "toolcust_lancomstr_uix", unique: true
  end

  create_table "tool_customlang_components", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Contains the list of all installed plugins that provide thei", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "version"
  end

  create_table "upgrade_log", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Upgrade logging", force: :cascade do |t|
    t.bigint "type", null: false
    t.string "plugin", limit: 100
    t.string "version", limit: 100
    t.string "targetversion", limit: 100
    t.string "info", default: "", null: false
    t.text "details", limit: 4294967295
    t.text "backtrace", limit: 4294967295
    t.bigint "userid", null: false
    t.bigint "timemodified", null: false
    t.index ["timemodified"], name: "upgrlog_tim_ix"
    t.index ["type", "timemodified"], name: "upgrlog_typtim_ix"
    t.index ["userid"], name: "upgrlog_use_ix"
  end

  create_table "url", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "each record is one url resource", force: :cascade do |t|
    t.bigint "course", default: 0, null: false
    t.string "name", default: "", null: false
    t.text "intro", limit: 4294967295
    t.integer "introformat", limit: 2, default: 0, null: false
    t.text "externalurl", limit: 4294967295, null: false
    t.integer "display", limit: 2, default: 0, null: false
    t.text "displayoptions", limit: 4294967295
    t.text "parameters", limit: 4294967295
    t.bigint "timemodified", default: 0, null: false
    t.index ["course"], name: "url_cou_ix"
  end

  create_table "user", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "One record for each person", force: :cascade do |t|
    t.string "auth", limit: 20, default: "manual", null: false
    t.boolean "confirmed", default: false, null: false
    t.boolean "policyagreed", default: false, null: false
    t.boolean "deleted", default: false, null: false
    t.boolean "suspended", default: false, null: false
    t.bigint "mnethostid", default: 0, null: false
    t.string "username", limit: 100, default: "", null: false
    t.string "password", default: "", null: false
    t.string "idnumber", default: "", null: false
    t.string "firstname", limit: 100, default: "", null: false
    t.string "lastname", limit: 100, default: "", null: false
    t.string "email", limit: 100, default: "", null: false
    t.boolean "emailstop", default: false, null: false
    t.string "icq", limit: 15, default: "", null: false
    t.string "skype", limit: 50, default: "", null: false
    t.string "yahoo", limit: 50, default: "", null: false
    t.string "aim", limit: 50, default: "", null: false
    t.string "msn", limit: 50, default: "", null: false
    t.string "phone1", limit: 20, default: "", null: false
    t.string "phone2", limit: 20, default: "", null: false
    t.string "institution", default: "", null: false
    t.string "department", default: "", null: false
    t.string "address", default: "", null: false
    t.string "city", limit: 120, default: "", null: false
    t.string "country", limit: 2, default: "", null: false
    t.string "lang", limit: 30, default: "en", null: false
    t.string "calendartype", limit: 30, default: "gregorian", null: false
    t.string "theme", limit: 50, default: "", null: false
    t.string "timezone", limit: 100, default: "99", null: false
    t.bigint "firstaccess", default: 0, null: false
    t.bigint "lastaccess", default: 0, null: false
    t.bigint "lastlogin", default: 0, null: false
    t.bigint "currentlogin", default: 0, null: false
    t.string "lastip", limit: 45, default: "", null: false
    t.string "secret", limit: 15, default: "", null: false
    t.bigint "picture", default: 0, null: false
    t.string "url", default: "", null: false
    t.text "description", limit: 4294967295
    t.integer "descriptionformat", limit: 1, default: 1, null: false
    t.boolean "mailformat", default: true, null: false
    t.boolean "maildigest", default: false, null: false
    t.integer "maildisplay", limit: 1, default: 2, null: false
    t.boolean "autosubscribe", default: true, null: false
    t.boolean "trackforums", default: false, null: false
    t.bigint "timecreated", default: 0, null: false
    t.bigint "timemodified", default: 0, null: false
    t.bigint "trustbitmask", default: 0, null: false
    t.string "imagealt"
    t.string "lastnamephonetic"
    t.string "firstnamephonetic"
    t.string "middlename"
    t.string "alternatename"
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.index ["alternatename"], name: "user_alt_ix"
    t.index ["auth"], name: "user_aut_ix"
    t.index ["city"], name: "user_cit_ix"
    t.index ["confirmed"], name: "user_con_ix"
    t.index ["country"], name: "user_cou_ix"
    t.index ["deleted"], name: "user_del_ix"
    t.index ["email"], name: "index_user_on_email", unique: true
    t.index ["email"], name: "user_ema_ix"
    t.index ["firstname"], name: "user_fir_ix"
    t.index ["firstnamephonetic"], name: "user_fir2_ix"
    t.index ["idnumber"], name: "user_idn_ix"
    t.index ["lastaccess"], name: "user_las2_ix"
    t.index ["lastname"], name: "user_las_ix"
    t.index ["lastnamephonetic"], name: "user_las3_ix"
    t.index ["middlename"], name: "user_mid_ix"
    t.index ["mnethostid", "username"], name: "user_mneuse_uix", unique: true
    t.index ["reset_password_token"], name: "index_user_on_reset_password_token", unique: true
  end

  create_table "user_devices", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "This table stores user's mobile devices information in order", force: :cascade do |t|
    t.bigint "userid", default: 0, null: false
    t.string "appid", limit: 128, default: "", null: false
    t.string "name", limit: 32, default: "", null: false
    t.string "model", limit: 32, default: "", null: false
    t.string "platform", limit: 32, default: "", null: false
    t.string "version", limit: 32, default: "", null: false
    t.string "pushid", default: "", null: false
    t.string "uuid", default: "", null: false
    t.bigint "timecreated", null: false
    t.bigint "timemodified", null: false
    t.index ["pushid", "platform"], name: "userdevi_puspla_uix", unique: true
    t.index ["pushid", "userid"], name: "userdevi_pususe_uix", unique: true
    t.index ["userid"], name: "userdevi_use_ix"
  end

  create_table "user_enrolments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Users participating in courses (aka enrolled users) - everyb", force: :cascade do |t|
    t.bigint "status", default: 0, null: false
    t.bigint "enrolid", null: false
    t.bigint "userid", null: false
    t.bigint "timestart", default: 0, null: false
    t.bigint "timeend", default: 2147483647, null: false
    t.bigint "modifierid", default: 0, null: false
    t.bigint "timecreated", default: 0, null: false
    t.bigint "timemodified", default: 0, null: false
    t.index ["enrolid", "userid"], name: "userenro_enruse_uix", unique: true
    t.index ["enrolid"], name: "userenro_enr_ix"
    t.index ["modifierid"], name: "userenro_mod_ix"
    t.index ["userid"], name: "userenro_use_ix"
  end

  create_table "user_info_category", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Customisable fields categories", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.bigint "sortorder", default: 0, null: false
  end

  create_table "user_info_data", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Data for the customisable user fields", force: :cascade do |t|
    t.bigint "userid", default: 0, null: false
    t.bigint "fieldid", default: 0, null: false
    t.text "data", limit: 4294967295, null: false
    t.integer "dataformat", limit: 1, default: 0, null: false
    t.index ["userid", "fieldid"], name: "userinfodata_usefie_uix", unique: true
  end

  create_table "user_info_field", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Customisable user profile fields", force: :cascade do |t|
    t.string "shortname", default: "shortname", null: false
    t.text "name", limit: 4294967295, null: false
    t.string "datatype", default: "", null: false
    t.text "description", limit: 4294967295
    t.integer "descriptionformat", limit: 1, default: 0, null: false
    t.bigint "categoryid", default: 0, null: false
    t.bigint "sortorder", default: 0, null: false
    t.integer "required", limit: 1, default: 0, null: false
    t.integer "locked", limit: 1, default: 0, null: false
    t.integer "visible", limit: 2, default: 0, null: false
    t.integer "forceunique", limit: 1, default: 0, null: false
    t.integer "signup", limit: 1, default: 0, null: false
    t.text "defaultdata", limit: 4294967295
    t.integer "defaultdataformat", limit: 1, default: 0, null: false
    t.text "param1", limit: 4294967295
    t.text "param2", limit: 4294967295
    t.text "param3", limit: 4294967295
    t.text "param4", limit: 4294967295
    t.text "param5", limit: 4294967295
  end

  create_table "user_lastaccess", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "To keep track of course page access times, used in online pa", force: :cascade do |t|
    t.bigint "userid", default: 0, null: false
    t.bigint "courseid", default: 0, null: false
    t.bigint "timeaccess", default: 0, null: false
    t.index ["courseid"], name: "userlast_cou_ix"
    t.index ["userid", "courseid"], name: "userlast_usecou_uix", unique: true
    t.index ["userid"], name: "userlast_use_ix"
  end

  create_table "user_password_resets", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "table tracking password reset confirmation tokens", force: :cascade do |t|
    t.bigint "userid", null: false
    t.bigint "timerequested", null: false
    t.bigint "timererequested", default: 0, null: false
    t.string "token", limit: 32, default: "", null: false
    t.index ["userid"], name: "userpassrese_use_ix"
  end

  create_table "user_preferences", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Allows modules to store arbitrary user preferences", force: :cascade do |t|
    t.bigint "userid", default: 0, null: false
    t.string "name", default: "", null: false
    t.string "value", limit: 1333, default: "", null: false
    t.index ["userid", "name"], name: "userpref_usenam_uix", unique: true
  end

  create_table "user_private_key", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "access keys used in cookieless scripts - rss, etc.", force: :cascade do |t|
    t.string "script", limit: 128, default: "", null: false
    t.string "value", limit: 128, default: "", null: false
    t.bigint "userid", null: false
    t.bigint "instance"
    t.string "iprestriction"
    t.bigint "validuntil"
    t.bigint "timecreated"
    t.index ["script", "value"], name: "userprivkey_scrval_ix"
    t.index ["userid"], name: "userprivkey_use_ix"
  end

  create_table "webdav_locks", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Resource locks for WebDAV users", force: :cascade do |t|
    t.string "token", default: "", null: false
    t.string "path", default: "", null: false
    t.bigint "expiry", default: 0, null: false
    t.bigint "userid", default: 0, null: false
    t.boolean "recursive", default: false, null: false
    t.boolean "exclusivelock", default: false, null: false
    t.bigint "created", default: 0, null: false
    t.bigint "modified", default: 0, null: false
    t.string "owner"
    t.index ["expiry"], name: "webdlock_exp_ix"
    t.index ["path"], name: "webdlock_pat_ix"
    t.index ["token"], name: "webdlock_tok_uix", unique: true
  end

  create_table "wiki", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Stores Wiki activity configuration", force: :cascade do |t|
    t.bigint "course", default: 0, null: false
    t.string "name", default: "Wiki", null: false
    t.text "intro", limit: 4294967295
    t.integer "introformat", limit: 2, default: 0, null: false
    t.bigint "timecreated", default: 0, null: false
    t.bigint "timemodified", default: 0, null: false
    t.string "firstpagetitle", default: "First Page", null: false
    t.string "wikimode", limit: 20, default: "collaborative", null: false
    t.string "defaultformat", limit: 20, default: "creole", null: false
    t.boolean "forceformat", default: true, null: false
    t.bigint "editbegin", default: 0, null: false
    t.bigint "editend", default: 0
    t.index ["course"], name: "wiki_cou_ix"
  end

  create_table "wiki_links", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Page wiki links", force: :cascade do |t|
    t.bigint "subwikiid", default: 0, null: false
    t.bigint "frompageid", default: 0, null: false
    t.bigint "topageid", default: 0, null: false
    t.string "tomissingpage"
    t.index ["frompageid"], name: "wikilink_fro_ix"
    t.index ["subwikiid"], name: "wikilink_sub_ix"
  end

  create_table "wiki_locks", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Manages page locks", force: :cascade do |t|
    t.bigint "pageid", default: 0, null: false
    t.string "sectionname"
    t.bigint "userid", default: 0, null: false
    t.bigint "lockedat", default: 0, null: false
  end

  create_table "wiki_pages", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Stores wiki pages", force: :cascade do |t|
    t.bigint "subwikiid", default: 0, null: false
    t.string "title", default: "title", null: false
    t.text "cachedcontent", limit: 4294967295, null: false
    t.bigint "timecreated", default: 0, null: false
    t.bigint "timemodified", default: 0, null: false
    t.bigint "timerendered", default: 0, null: false
    t.bigint "userid", default: 0, null: false
    t.bigint "pageviews", default: 0, null: false
    t.boolean "readonly", default: false, null: false
    t.index ["subwikiid", "title", "userid"], name: "wikipage_subtituse_uix", unique: true
    t.index ["subwikiid"], name: "wikipage_sub_ix"
  end

  create_table "wiki_subwikis", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Stores subwiki instances", force: :cascade do |t|
    t.bigint "wikiid", default: 0, null: false
    t.bigint "groupid", default: 0, null: false
    t.bigint "userid", default: 0, null: false
    t.index ["wikiid", "groupid", "userid"], name: "wikisubw_wikgrouse_uix", unique: true
    t.index ["wikiid"], name: "wikisubw_wik_ix"
  end

  create_table "wiki_synonyms", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Stores wiki pages synonyms", force: :cascade do |t|
    t.bigint "subwikiid", default: 0, null: false
    t.bigint "pageid", default: 0, null: false
    t.string "pagesynonym", default: "Pagesynonym", null: false
    t.index ["pageid", "pagesynonym"], name: "wikisyno_pagpag_uix", unique: true
  end

  create_table "wiki_versions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Stores wiki page history", force: :cascade do |t|
    t.bigint "pageid", default: 0, null: false
    t.text "content", limit: 4294967295, null: false
    t.string "contentformat", limit: 20, default: "creole", null: false
    t.integer "version", limit: 3, default: 0, null: false
    t.bigint "timecreated", default: 0, null: false
    t.bigint "userid", default: 0, null: false
    t.index ["pageid"], name: "wikivers_pag_ix"
  end

  create_table "workshop", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "This table keeps information about the module instances and ", force: :cascade do |t|
    t.bigint "course", null: false
    t.string "name", default: "", null: false
    t.text "intro", limit: 4294967295
    t.integer "introformat", limit: 2, default: 0, null: false
    t.text "instructauthors", limit: 4294967295
    t.integer "instructauthorsformat", limit: 2, default: 0, null: false
    t.text "instructreviewers", limit: 4294967295
    t.integer "instructreviewersformat", limit: 2, default: 0, null: false
    t.bigint "timemodified", null: false
    t.integer "phase", limit: 2, default: 0
    t.integer "useexamples", limit: 1, default: 0
    t.integer "usepeerassessment", limit: 1, default: 0
    t.integer "useselfassessment", limit: 1, default: 0
    t.decimal "grade", precision: 10, scale: 5, default: "80.0"
    t.decimal "gradinggrade", precision: 10, scale: 5, default: "20.0"
    t.string "strategy", limit: 30, default: "", null: false
    t.string "evaluation", limit: 30, default: "", null: false
    t.integer "gradedecimals", limit: 2, default: 0
    t.integer "nattachments", limit: 2, default: 0
    t.integer "latesubmissions", limit: 1, default: 0
    t.bigint "maxbytes", default: 100000
    t.integer "examplesmode", limit: 2, default: 0
    t.bigint "submissionstart", default: 0
    t.bigint "submissionend", default: 0
    t.bigint "assessmentstart", default: 0
    t.bigint "assessmentend", default: 0
    t.integer "phaseswitchassessment", limit: 1, default: 0, null: false
    t.text "conclusion", limit: 4294967295
    t.integer "conclusionformat", limit: 2, default: 1, null: false
    t.integer "overallfeedbackmode", limit: 2, default: 1
    t.integer "overallfeedbackfiles", limit: 2, default: 0
    t.bigint "overallfeedbackmaxbytes", default: 100000
    t.index ["course"], name: "work_cou_ix"
  end

  create_table "workshop_aggregations", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Aggregated grades for assessment are stored here. The aggreg", force: :cascade do |t|
    t.bigint "workshopid", null: false
    t.bigint "userid", null: false
    t.decimal "gradinggrade", precision: 10, scale: 5
    t.bigint "timegraded"
    t.index ["userid"], name: "workaggr_use_ix"
    t.index ["workshopid", "userid"], name: "workaggr_woruse_uix", unique: true
    t.index ["workshopid"], name: "workaggr_wor_ix"
  end

  create_table "workshop_assessments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Info about the made assessment and automatically calculated ", force: :cascade do |t|
    t.bigint "submissionid", null: false
    t.bigint "reviewerid", null: false
    t.bigint "weight", default: 1, null: false
    t.bigint "timecreated", default: 0
    t.bigint "timemodified", default: 0
    t.decimal "grade", precision: 10, scale: 5
    t.decimal "gradinggrade", precision: 10, scale: 5
    t.decimal "gradinggradeover", precision: 10, scale: 5
    t.bigint "gradinggradeoverby"
    t.text "feedbackauthor", limit: 4294967295
    t.integer "feedbackauthorformat", limit: 2, default: 0
    t.integer "feedbackauthorattachment", limit: 2, default: 0
    t.text "feedbackreviewer", limit: 4294967295
    t.integer "feedbackreviewerformat", limit: 2, default: 0
    t.index ["gradinggradeoverby"], name: "workasse_gra_ix"
    t.index ["reviewerid"], name: "workasse_rev_ix"
    t.index ["submissionid"], name: "workasse_sub_ix"
  end

  create_table "workshop_assessments_old", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Legacy workshop_assessments table to be dropped later in Moo", force: :cascade do |t|
    t.bigint "workshopid", default: 0, null: false
    t.bigint "submissionid", default: 0, null: false
    t.bigint "userid", default: 0, null: false
    t.bigint "timecreated", default: 0, null: false
    t.bigint "timegraded", default: 0, null: false
    t.bigint "timeagreed", default: 0, null: false
    t.float "grade", limit: 53, default: 0.0, null: false
    t.integer "gradinggrade", limit: 2, default: 0, null: false
    t.integer "teachergraded", limit: 2, default: 0, null: false
    t.integer "mailed", limit: 2, default: 0, null: false
    t.integer "resubmission", limit: 2, default: 0, null: false
    t.integer "donotuse", limit: 2, default: 0, null: false
    t.text "generalcomment", limit: 4294967295
    t.text "teachercomment", limit: 4294967295
    t.string "newplugin", limit: 28
    t.bigint "newid"
    t.index ["mailed"], name: "workasseold_mai_ix"
    t.index ["submissionid"], name: "workasseold_sub_ix"
    t.index ["userid"], name: "workasseold_use_ix"
    t.index ["workshopid"], name: "workasseold_wor_ix"
  end

  create_table "workshop_comments_old", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Legacy workshop_comments table to be dropped later in Moodle", force: :cascade do |t|
    t.bigint "workshopid", default: 0, null: false
    t.bigint "assessmentid", default: 0, null: false
    t.bigint "userid", default: 0, null: false
    t.bigint "timecreated", default: 0, null: false
    t.integer "mailed", limit: 1, default: 0, null: false
    t.text "comments", limit: 4294967295, null: false
    t.string "newplugin", limit: 28
    t.bigint "newid"
    t.index ["assessmentid"], name: "workcommold_ass_ix"
    t.index ["mailed"], name: "workcommold_mai_ix"
    t.index ["userid"], name: "workcommold_use_ix"
    t.index ["workshopid"], name: "workcommold_wor_ix"
  end

  create_table "workshop_elements_old", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Legacy workshop_elements table to be dropped later in Moodle", force: :cascade do |t|
    t.bigint "workshopid", default: 0, null: false
    t.integer "elementno", limit: 2, default: 0, null: false
    t.text "description", limit: 4294967295, null: false
    t.integer "scale", limit: 2, default: 0, null: false
    t.integer "maxscore", limit: 2, default: 1, null: false
    t.integer "weight", limit: 2, default: 11, null: false
    t.float "stddev", limit: 53, default: 0.0, null: false
    t.bigint "totalassessments", default: 0, null: false
    t.string "newplugin", limit: 28
    t.bigint "newid"
    t.index ["workshopid"], name: "workelemold_wor_ix"
  end

  create_table "workshop_grades", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "How the reviewers filled-up the grading forms, given grades ", force: :cascade do |t|
    t.bigint "assessmentid", null: false
    t.string "strategy", limit: 30, default: "", null: false
    t.bigint "dimensionid", null: false
    t.decimal "grade", precision: 10, scale: 5, null: false
    t.text "peercomment", limit: 4294967295
    t.integer "peercommentformat", limit: 2, default: 0
    t.index ["assessmentid", "strategy", "dimensionid"], name: "workgrad_assstrdim_uix", unique: true
    t.index ["assessmentid"], name: "workgrad_ass_ix"
  end

  create_table "workshop_grades_old", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Legacy workshop_grades table to be dropped later in Moodle 2", force: :cascade do |t|
    t.bigint "workshopid", default: 0, null: false
    t.bigint "assessmentid", default: 0, null: false
    t.bigint "elementno", default: 0, null: false
    t.text "feedback", limit: 4294967295, null: false
    t.integer "grade", limit: 2, default: 0, null: false
    t.string "newplugin", limit: 28
    t.bigint "newid"
    t.index ["assessmentid"], name: "workgradold_ass_ix"
    t.index ["workshopid"], name: "workgradold_wor_ix"
  end

  create_table "workshop_old", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Legacy workshop table to be dropped later in Moodle 2.x", force: :cascade do |t|
    t.bigint "course", default: 0, null: false
    t.string "name", default: "", null: false
    t.text "description", limit: 4294967295, null: false
    t.integer "wtype", limit: 2, default: 0, null: false
    t.integer "nelements", limit: 2, default: 1, null: false
    t.integer "nattachments", limit: 2, default: 0, null: false
    t.integer "phase", limit: 1, default: 0, null: false
    t.integer "format", limit: 1, default: 0, null: false
    t.integer "gradingstrategy", limit: 1, default: 1, null: false
    t.integer "resubmit", limit: 1, default: 0, null: false
    t.integer "agreeassessments", limit: 1, default: 0, null: false
    t.integer "hidegrades", limit: 1, default: 0, null: false
    t.integer "anonymous", limit: 1, default: 0, null: false
    t.integer "includeself", limit: 1, default: 0, null: false
    t.bigint "maxbytes", default: 100000, null: false
    t.bigint "submissionstart", default: 0, null: false
    t.bigint "assessmentstart", default: 0, null: false
    t.bigint "submissionend", default: 0, null: false
    t.bigint "assessmentend", default: 0, null: false
    t.bigint "releasegrades", default: 0, null: false
    t.integer "grade", limit: 2, default: 0, null: false
    t.integer "gradinggrade", limit: 2, default: 0, null: false
    t.integer "ntassessments", limit: 2, default: 0, null: false
    t.integer "assessmentcomps", limit: 2, default: 2, null: false
    t.integer "nsassessments", limit: 2, default: 0, null: false
    t.integer "overallocation", limit: 2, default: 0, null: false
    t.bigint "timemodified", default: 0, null: false
    t.integer "teacherweight", limit: 2, default: 1, null: false
    t.integer "showleaguetable", limit: 2, default: 0, null: false
    t.integer "usepassword", limit: 2, default: 0, null: false
    t.string "password", limit: 32, default: "", null: false
    t.string "newplugin", limit: 28
    t.bigint "newid"
    t.index ["course"], name: "workold_cou_ix"
  end

  create_table "workshop_rubrics_old", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Legacy workshop_rubrics table to be dropped later in Moodle ", force: :cascade do |t|
    t.bigint "workshopid", default: 0, null: false
    t.bigint "elementno", default: 0, null: false
    t.integer "rubricno", limit: 2, default: 0, null: false
    t.text "description", limit: 4294967295, null: false
    t.string "newplugin", limit: 28
    t.bigint "newid"
    t.index ["workshopid"], name: "workrubrold_wor_ix"
  end

  create_table "workshop_stockcomments_old", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Legacy workshop_stockcomments table to be dropped later in M", force: :cascade do |t|
    t.bigint "workshopid", default: 0, null: false
    t.bigint "elementno", default: 0, null: false
    t.text "comments", limit: 4294967295, null: false
    t.string "newplugin", limit: 28
    t.bigint "newid"
    t.index ["workshopid"], name: "workstocold_wor_ix"
  end

  create_table "workshop_submissions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Info about the submission and the aggregation of the grade f", force: :cascade do |t|
    t.bigint "workshopid", null: false
    t.integer "example", limit: 1, default: 0
    t.bigint "authorid", null: false
    t.bigint "timecreated", null: false
    t.bigint "timemodified", null: false
    t.string "title", default: "", null: false
    t.text "content", limit: 4294967295
    t.integer "contentformat", limit: 2, default: 0, null: false
    t.integer "contenttrust", limit: 2, default: 0, null: false
    t.integer "attachment", limit: 1, default: 0
    t.decimal "grade", precision: 10, scale: 5
    t.decimal "gradeover", precision: 10, scale: 5
    t.bigint "gradeoverby"
    t.text "feedbackauthor", limit: 4294967295
    t.integer "feedbackauthorformat", limit: 2, default: 0
    t.bigint "timegraded"
    t.integer "published", limit: 1, default: 0
    t.integer "late", limit: 1, default: 0, null: false
    t.index ["authorid"], name: "worksubm_aut_ix"
    t.index ["gradeoverby"], name: "worksubm_gra_ix"
    t.index ["workshopid"], name: "worksubm_wor_ix"
  end

  create_table "workshop_submissions_old", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Legacy workshop_submissions table to be dropped later in Moo", force: :cascade do |t|
    t.bigint "workshopid", default: 0, null: false
    t.bigint "userid", default: 0, null: false
    t.string "title", limit: 100, default: "", null: false
    t.bigint "timecreated", default: 0, null: false
    t.integer "mailed", limit: 1, default: 0, null: false
    t.text "description", limit: 4294967295, null: false
    t.integer "gradinggrade", limit: 2, default: 0, null: false
    t.integer "finalgrade", limit: 2, default: 0, null: false
    t.integer "late", limit: 2, default: 0, null: false
    t.bigint "nassessments", default: 0, null: false
    t.string "newplugin", limit: 28
    t.bigint "newid"
    t.index ["mailed"], name: "worksubmold_mai_ix"
    t.index ["userid"], name: "worksubmold_use_ix"
    t.index ["workshopid"], name: "worksubmold_wor_ix"
  end

  create_table "workshopallocation_scheduled", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Stores the allocation settings for the scheduled allocator", force: :cascade do |t|
    t.bigint "workshopid", null: false
    t.integer "enabled", limit: 1, default: 0, null: false
    t.bigint "submissionend", null: false
    t.bigint "timeallocated"
    t.text "settings", limit: 4294967295
    t.bigint "resultstatus"
    t.string "resultmessage", limit: 1333
    t.text "resultlog", limit: 4294967295
    t.index ["workshopid"], name: "worksche_wor_uix", unique: true
  end

  create_table "workshopeval_best_settings", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Settings for the grading evaluation subplugin Comparison wit", force: :cascade do |t|
    t.bigint "workshopid", null: false
    t.integer "comparison", limit: 2, default: 5
    t.index ["workshopid"], name: "workbestsett_wor_uix", unique: true
  end

  create_table "workshopform_accumulative", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "The assessment dimensions definitions of Accumulative gradin", force: :cascade do |t|
    t.bigint "workshopid", null: false
    t.bigint "sort", default: 0
    t.text "description", limit: 4294967295
    t.integer "descriptionformat", limit: 2, default: 0
    t.bigint "grade", null: false
    t.integer "weight", limit: 3, default: 1
    t.index ["workshopid"], name: "workaccu_wor_ix"
  end

  create_table "workshopform_comments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "The assessment dimensions definitions of Comments strategy f", force: :cascade do |t|
    t.bigint "workshopid", null: false
    t.bigint "sort", default: 0
    t.text "description", limit: 4294967295
    t.integer "descriptionformat", limit: 2, default: 0
    t.index ["workshopid"], name: "workcomm_wor_ix"
  end

  create_table "workshopform_numerrors", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "The assessment dimensions definitions of Number of errors gr", force: :cascade do |t|
    t.bigint "workshopid", null: false
    t.bigint "sort", default: 0
    t.text "description", limit: 4294967295
    t.integer "descriptionformat", limit: 2, default: 0
    t.bigint "descriptiontrust"
    t.string "grade0", limit: 50
    t.string "grade1", limit: 50
    t.integer "weight", limit: 3, default: 1
    t.index ["workshopid"], name: "worknume_wor_ix"
  end

  create_table "workshopform_numerrors_map", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "This maps the number of errors to a percentual grade for sub", force: :cascade do |t|
    t.bigint "workshopid", null: false
    t.bigint "nonegative", null: false
    t.decimal "grade", precision: 10, scale: 5, null: false
    t.index ["workshopid", "nonegative"], name: "worknumemap_wornon_uix", unique: true
    t.index ["workshopid"], name: "worknumemap_wor_ix"
  end

  create_table "workshopform_rubric", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "The assessment dimensions definitions of Rubric grading stra", force: :cascade do |t|
    t.bigint "workshopid", null: false
    t.bigint "sort", default: 0
    t.text "description", limit: 4294967295
    t.integer "descriptionformat", limit: 2, default: 0
    t.index ["workshopid"], name: "workrubr_wor_ix"
  end

  create_table "workshopform_rubric_config", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Configuration table for the Rubric grading strategy", force: :cascade do |t|
    t.bigint "workshopid", null: false
    t.string "layout", limit: 30, default: "list"
    t.index ["workshopid"], name: "workrubrconf_wor_uix", unique: true
  end

  create_table "workshopform_rubric_levels", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "The definition of rubric rating scales", force: :cascade do |t|
    t.bigint "dimensionid", null: false
    t.decimal "grade", precision: 10, scale: 5, null: false
    t.text "definition", limit: 4294967295
    t.integer "definitionformat", limit: 2, default: 0
    t.index ["dimensionid"], name: "workrubrleve_dim_ix"
  end

end
