# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 20231009112613590) do
  create_table "allergy", primary_key: "allergy_id", id: :bigint, default: nil, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "patient_id", null: false
    t.bigint "severity_concept_id"
    t.bigint "coded_allergen", null: false
    t.string "non_coded_allergen"
    t.string "allergen_type", limit: 50, null: false
    t.string "comment", limit: 1024
    t.bigint "creator", null: false
    t.datetime "date_created", precision: nil, null: false
    t.bigint "changed_by"
    t.datetime "date_changed", precision: nil
    t.boolean "voided", default: false, null: false
    t.bigint "voided_by"
    t.datetime "date_voided", precision: nil
    t.string "void_reason"
    t.string "uuid", limit: 38
    t.index ["changed_by"], name: "fk_rails_8fbfc86cc1"
    t.index ["coded_allergen"], name: "fk_rails_3e4c2e112e"
    t.index ["creator"], name: "fk_rails_d5285f0102"
    t.index ["patient_id"], name: "fk_rails_b3ed7bfbcf"
    t.index ["severity_concept_id"], name: "fk_rails_5422675d03"
    t.index ["voided_by"], name: "fk_rails_d33f44d21b"
  end

  create_table "allergy_reaction", primary_key: "allergy_reaction_id", id: :bigint, default: nil, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "allergy_id", null: false
    t.bigint "reaction_concept_id", null: false
    t.string "reaction_non_coded"
    t.string "uuid", limit: 38
    t.index ["allergy_id"], name: "fk_rails_5f108144a7"
    t.index ["reaction_concept_id"], name: "fk_rails_459f757afb"
  end

  create_table "care_setting", primary_key: "care_setting_id", id: :bigint, default: nil, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.string "description"
    t.string "care_setting_type", limit: 50, null: false
    t.bigint "creator", null: false
    t.datetime "date_created", precision: nil, null: false
    t.boolean "retired", default: false, null: false
    t.bigint "retired_by"
    t.datetime "date_retired", precision: nil
    t.string "retire_reason"
    t.bigint "changed_by"
    t.datetime "date_changed", precision: nil
    t.string "uuid", limit: 38, null: false
    t.index ["changed_by"], name: "fk_rails_d1bf9e7191"
    t.index ["creator"], name: "fk_rails_a68c9e4f11"
    t.index ["retired_by"], name: "fk_rails_7b942ec168"
  end

  create_table "clob_datatype_storage", id: :bigint, default: nil, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "uuid", limit: 38, null: false
    t.text "value", size: :long, null: false
  end

  create_table "cohort", primary_key: "cohort_id", id: :bigint, default: nil, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.string "description", limit: 1000
    t.bigint "creator", null: false
    t.datetime "date_created", precision: nil, null: false
    t.boolean "voided", default: false, null: false
    t.bigint "voided_by"
    t.datetime "date_voided", precision: nil
    t.string "void_reason"
    t.bigint "changed_by"
    t.datetime "date_changed", precision: nil
    t.string "uuid", limit: 38, null: false
    t.index ["changed_by"], name: "fk_rails_a52d391f13"
    t.index ["creator"], name: "fk_rails_e4a8f35867"
    t.index ["voided_by"], name: "fk_rails_a955a1f418"
  end

  create_table "cohort_member", primary_key: "cohort_member_id", id: :bigint, default: nil, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "cohort_id", null: false
    t.bigint "patient_id", null: false
    t.datetime "start_date", precision: nil, null: false
    t.datetime "end_date", precision: nil
    t.bigint "creator", null: false
    t.datetime "date_created", precision: nil, null: false
    t.boolean "voided", default: false, null: false
    t.bigint "voided_by"
    t.datetime "date_voided", precision: nil
    t.string "void_reason"
    t.string "uuid", limit: 38, null: false
    t.index ["cohort_id"], name: "fk_rails_d490342214"
    t.index ["creator"], name: "fk_rails_b8ed28c3ca"
    t.index ["patient_id"], name: "fk_rails_25fa4256a2"
  end

  create_table "concept", primary_key: "concept_id", id: :bigint, default: nil, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.boolean "retired", default: false, null: false
    t.string "short_name"
    t.text "description"
    t.text "form_text"
    t.bigint "datatype_id", default: 0, null: false
    t.bigint "class_id", default: 0, null: false
    t.boolean "is_set", default: false, null: false
    t.bigint "creator", default: 0, null: false
    t.datetime "date_created", precision: nil, default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string "version", limit: 50
    t.bigint "changed_by"
    t.datetime "date_changed", precision: nil
    t.bigint "retired_by"
    t.datetime "date_retired", precision: nil
    t.string "retire_reason"
    t.string "uuid", limit: 38, null: false
    t.index ["changed_by"], name: "fk_rails_260701a3c7"
    t.index ["class_id"], name: "fk_rails_70755d8c9b"
    t.index ["creator"], name: "fk_rails_f28ec50ac4"
    t.index ["datatype_id"], name: "fk_rails_dc70aea426"
    t.index ["retired_by"], name: "fk_rails_deb6403020"
  end

  create_table "concept_answer", primary_key: "concept_answer_id", id: :bigint, default: nil, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "concept_id", default: 0, null: false
    t.bigint "answer_concept"
    t.bigint "answer_drug"
    t.bigint "creator", default: 0, null: false
    t.datetime "date_created", precision: nil, default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string "uuid", limit: 38, null: false
    t.float "sort_weight", limit: 53
    t.index ["answer_concept"], name: "fk_rails_cc7e0dafa4"
    t.index ["answer_drug"], name: "fk_rails_f574a036e4"
    t.index ["concept_id"], name: "fk_rails_6b5ee0c65b"
    t.index ["creator"], name: "fk_rails_eb2d1c4c0f"
  end

  create_table "concept_attribute", primary_key: "concept_attribute_id", id: :bigint, default: nil, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "concept_id", null: false
    t.bigint "attribute_type_id", null: false
    t.text "value_reference", null: false
    t.string "uuid", limit: 38, null: false
    t.bigint "creator", null: false
    t.datetime "date_created", precision: nil, null: false
    t.bigint "changed_by"
    t.datetime "date_changed", precision: nil
    t.boolean "voided", default: false, null: false
    t.bigint "voided_by"
    t.datetime "date_voided", precision: nil
    t.string "void_reason"
    t.index ["attribute_type_id"], name: "fk_rails_de8b0e7c3f"
    t.index ["changed_by"], name: "fk_rails_b117d4eccc"
    t.index ["concept_id"], name: "fk_rails_9f1b0e3de2"
    t.index ["creator"], name: "fk_rails_efdf512074"
    t.index ["voided_by"], name: "fk_rails_3e253396e5"
  end

  create_table "concept_attribute_type", primary_key: "concept_attribute_type_id", id: :bigint, default: nil, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.string "description", limit: 1024
    t.string "datatype"
    t.text "datatype_config"
    t.string "preferred_handler"
    t.text "handler_config"
    t.bigint "min_occurs", null: false
    t.bigint "max_occurs"
    t.bigint "creator", null: false
    t.datetime "date_created", precision: nil, null: false
    t.bigint "changed_by"
    t.datetime "date_changed", precision: nil
    t.boolean "retired", default: false, null: false
    t.bigint "retired_by"
    t.datetime "date_retired", precision: nil
    t.string "retire_reason"
    t.string "uuid", limit: 38, null: false
    t.index ["changed_by"], name: "fk_rails_a399877c48"
    t.index ["creator"], name: "fk_rails_3d76e004f2"
    t.index ["retired_by"], name: "fk_rails_8ebbebfcab"
  end

  create_table "concept_class", primary_key: "concept_class_id", id: :bigint, default: nil, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "description"
    t.bigint "creator", default: 0, null: false
    t.datetime "date_created", precision: nil, default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.boolean "retired", default: false, null: false
    t.bigint "retired_by"
    t.datetime "date_retired", precision: nil
    t.string "retire_reason"
    t.string "uuid", limit: 38, null: false
    t.datetime "date_changed", precision: nil
    t.bigint "changed_by"
    t.index ["changed_by"], name: "fk_rails_b1bd00ae15"
    t.index ["creator"], name: "fk_rails_2e1472fc2c"
    t.index ["retired_by"], name: "fk_rails_76ba91566e"
  end

  create_table "concept_complex", primary_key: "concept_id", id: :bigint, default: nil, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "handler"
  end

  create_table "concept_datatype", primary_key: "concept_datatype_id", id: :bigint, default: nil, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "hl7_abbreviation", limit: 3
    t.string "description"
    t.bigint "creator", default: 0, null: false
    t.datetime "date_created", precision: nil, default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.boolean "retired", default: false, null: false
    t.bigint "retired_by"
    t.datetime "date_retired", precision: nil
    t.string "retire_reason"
    t.string "uuid", limit: 38, null: false
    t.index ["creator"], name: "fk_rails_8e7a3b29cf"
    t.index ["retired_by"], name: "fk_rails_12663768b3"
  end

  create_table "concept_description", primary_key: "concept_description_id", id: :bigint, default: nil, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "concept_id", default: 0, null: false
    t.text "description", null: false
    t.string "locale", limit: 50, default: "", null: false
    t.bigint "creator", default: 0, null: false
    t.datetime "date_created", precision: nil, default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.bigint "changed_by"
    t.datetime "date_changed", precision: nil
    t.string "uuid", limit: 38, null: false
    t.index ["changed_by"], name: "fk_rails_23ad9dab28"
    t.index ["concept_id"], name: "fk_rails_e36b29134f"
    t.index ["creator"], name: "fk_rails_97a508ae28"
  end

  create_table "concept_map_type", primary_key: "concept_map_type_id", id: :bigint, default: nil, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.string "description"
    t.bigint "creator", null: false
    t.datetime "date_created", precision: nil, null: false
    t.bigint "changed_by"
    t.datetime "date_changed", precision: nil
    t.boolean "is_hidden"
    t.boolean "retired", default: false, null: false
    t.bigint "retired_by"
    t.datetime "date_retired", precision: nil
    t.string "retire_reason"
    t.string "uuid", limit: 38, null: false
    t.index ["changed_by"], name: "fk_rails_13f0eaca8c"
    t.index ["creator"], name: "fk_rails_3c1d70f62a"
    t.index ["retired_by"], name: "fk_rails_3c097812ed"
  end

  create_table "concept_name", primary_key: "concept_name_id", id: :bigint, default: nil, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "concept_id"
    t.string "name", default: "", null: false
    t.string "locale", limit: 50, default: "", null: false
    t.bigint "creator", default: 0, null: false
    t.datetime "date_created", precision: nil, default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.boolean "voided", default: false, null: false
    t.bigint "voided_by"
    t.datetime "date_voided", precision: nil
    t.string "void_reason"
    t.string "uuid", limit: 38, null: false
    t.string "concept_name_type", limit: 50
    t.boolean "locale_preferred", default: false
    t.datetime "date_changed", precision: nil
    t.bigint "changed_by"
    t.index ["changed_by"], name: "fk_rails_a1d3f51af6"
    t.index ["concept_id"], name: "fk_rails_c2956df48e"
    t.index ["creator"], name: "fk_rails_a41261efc6"
    t.index ["voided_by"], name: "fk_rails_10fd179534"
  end

  create_table "concept_name_tag", primary_key: "concept_name_tag_id", id: :bigint, default: nil, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "tag", limit: 50, null: false
    t.text "description"
    t.bigint "creator", default: 0, null: false
    t.datetime "date_created", precision: nil, default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.boolean "voided", default: false, null: false
    t.bigint "voided_by"
    t.datetime "date_voided", precision: nil
    t.string "void_reason"
    t.string "uuid", limit: 38, null: false
    t.datetime "date_changed", precision: nil
    t.bigint "changed_by"
    t.index ["changed_by"], name: "fk_rails_26fbc7d214"
  end

  create_table "concept_name_tag_map", id: false, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "concept_name_id", null: false
    t.bigint "concept_name_tag_id", null: false
    t.index ["concept_name_id"], name: "fk_rails_40608dbdc2"
    t.index ["concept_name_tag_id"], name: "fk_rails_13133d2567"
  end

  create_table "concept_numeric", primary_key: "concept_id", id: :bigint, default: 0, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.float "hi_absolute", limit: 53
    t.float "hi_critical", limit: 53
    t.float "hi_normal", limit: 53
    t.float "low_absolute", limit: 53
    t.float "low_critical", limit: 53
    t.float "low_normal", limit: 53
    t.string "units", limit: 50
    t.boolean "allow_decimal"
    t.bigint "display_precision"
  end

  create_table "concept_proposal", primary_key: "concept_proposal_id", id: :bigint, default: nil, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "concept_id"
    t.bigint "encounter_id"
    t.string "original_text", default: "", null: false
    t.string "final_text"
    t.bigint "obs_id"
    t.bigint "obs_concept_id"
    t.string "state", limit: 32, default: "", null: false
    t.string "comments"
    t.bigint "creator", default: 0, null: false
    t.datetime "date_created", precision: nil, default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.bigint "changed_by"
    t.datetime "date_changed", precision: nil
    t.string "locale", limit: 50, default: "", null: false
    t.string "uuid", limit: 38, null: false
    t.index ["changed_by"], name: "fk_rails_53d6fd12aa"
    t.index ["concept_id"], name: "fk_rails_17a4f638f4"
    t.index ["creator"], name: "fk_rails_82d934e600"
    t.index ["encounter_id"], name: "fk_rails_bc3fbdb76d"
    t.index ["obs_concept_id"], name: "fk_rails_41c52981bf"
    t.index ["obs_id"], name: "fk_rails_a320168ee1"
  end

  create_table "concept_proposal_tag_map", id: false, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "concept_proposal_id", null: false
    t.bigint "concept_name_tag_id", null: false
    t.index ["concept_name_tag_id"], name: "fk_rails_b243514417"
    t.index ["concept_proposal_id"], name: "fk_rails_da6b1082b5"
  end

  create_table "concept_reference_map", primary_key: "concept_map_id", id: :bigint, default: nil, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "creator", default: 0, null: false
    t.datetime "date_created", precision: nil, default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.bigint "concept_id", default: 0, null: false
    t.string "uuid", limit: 38, null: false
    t.bigint "concept_reference_term_id", null: false
    t.bigint "concept_map_type_id", default: 0, null: false
    t.bigint "changed_by"
    t.datetime "date_changed", precision: nil
    t.index ["changed_by"], name: "fk_rails_292bac4351"
    t.index ["concept_id"], name: "fk_rails_bff7fad711"
    t.index ["concept_map_type_id"], name: "fk_rails_2f5e64a9c0"
    t.index ["concept_reference_term_id"], name: "fk_rails_0badfa7ed9"
    t.index ["creator"], name: "fk_rails_4f8bc368e5"
  end

  create_table "concept_reference_source", primary_key: "concept_source_id", id: :bigint, default: nil, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", limit: 50, default: "", null: false
    t.text "description", null: false
    t.string "hl7_code", limit: 50
    t.bigint "creator", default: 0, null: false
    t.datetime "date_created", precision: nil, default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.boolean "retired", default: false, null: false
    t.bigint "retired_by"
    t.datetime "date_retired", precision: nil
    t.string "retire_reason"
    t.string "uuid", limit: 38, null: false
    t.string "unique_id", limit: 250
    t.datetime "date_changed", precision: nil
    t.bigint "changed_by"
    t.index ["changed_by"], name: "fk_rails_1dc041c405"
    t.index ["creator"], name: "fk_rails_bca1281b0b"
    t.index ["retired_by"], name: "fk_rails_65566f32fb"
  end

  create_table "concept_reference_term", primary_key: "concept_reference_term_id", id: :bigint, default: nil, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "concept_source_id", null: false
    t.string "name"
    t.string "code", null: false
    t.string "version"
    t.string "description"
    t.bigint "creator", null: false
    t.datetime "date_created", precision: nil, null: false
    t.datetime "date_changed", precision: nil
    t.bigint "changed_by"
    t.boolean "retired", default: false, null: false
    t.bigint "retired_by"
    t.datetime "date_retired", precision: nil
    t.string "retire_reason"
    t.string "uuid", limit: 38, null: false
    t.index ["changed_by"], name: "fk_rails_bd0a267be2"
    t.index ["concept_source_id"], name: "fk_rails_dadfb16f58"
    t.index ["creator"], name: "fk_rails_dae6a30cad"
    t.index ["retired_by"], name: "fk_rails_55a6fc88a7"
  end

  create_table "concept_reference_term_map", primary_key: "concept_reference_term_map_id", id: :bigint, default: nil, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "term_a_id", null: false
    t.bigint "term_b_id", null: false
    t.bigint "a_is_to_b_id", null: false
    t.bigint "creator", null: false
    t.datetime "date_created", precision: nil, null: false
    t.bigint "changed_by"
    t.datetime "date_changed", precision: nil
    t.string "uuid", limit: 38, null: false
    t.index ["a_is_to_b_id"], name: "fk_rails_f2810b3b99"
    t.index ["changed_by"], name: "fk_rails_90cfdd824c"
    t.index ["creator"], name: "fk_rails_d2592240ee"
    t.index ["term_a_id"], name: "fk_rails_ff2b4d8a7b"
    t.index ["term_b_id"], name: "fk_rails_8510d11098"
  end

  create_table "concept_set", primary_key: "concept_set_id", id: :bigint, default: nil, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "concept_id", default: 0, null: false
    t.bigint "concept_set", default: 0, null: false
    t.float "sort_weight", limit: 53
    t.bigint "creator", default: 0, null: false
    t.datetime "date_created", precision: nil, default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string "uuid", limit: 38, null: false
    t.index ["concept_id"], name: "fk_rails_72fff446a5"
    t.index ["concept_set"], name: "fk_rails_41c1cd8160"
    t.index ["creator"], name: "fk_rails_d6debd0159"
  end

  create_table "concept_set_derived", id: false, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "concept_id", default: 0, null: false
    t.bigint "concept_set", default: 0, null: false
    t.float "sort_weight", limit: 53
    t.string "uuid", limit: 38
    t.index ["concept_id", "concept_set"], name: "index_concept_set_derived_on_concept_id_and_concept_set", unique: true
  end

  create_table "concept_state_conversion", primary_key: "concept_state_conversion_id", id: :bigint, default: nil, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "concept_id", default: 0
    t.bigint "program_workflow_id", default: 0
    t.bigint "program_workflow_state_id", default: 0
    t.string "uuid", limit: 38, null: false
    t.index ["concept_id"], name: "fk_rails_b9cc2cfb29"
    t.index ["program_workflow_id"], name: "fk_rails_98181d219d"
    t.index ["program_workflow_state_id"], name: "fk_rails_1c1b87c6a2"
  end

  create_table "concept_stop_word", primary_key: "concept_stop_word_id", id: :bigint, default: nil, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "word", limit: 50, null: false
    t.string "locale", limit: 50
    t.string "uuid", limit: 38, null: false
  end

  create_table "concept_word", primary_key: "concept_word_id", id: :bigint, default: nil, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "concept_id", default: 0, null: false
    t.string "word", limit: 50, default: "", null: false
    t.string "locale", limit: 20, default: "", null: false
    t.bigint "concept_name_id", null: false
    t.float "weight", limit: 53
    t.index ["concept_id"], name: "fk_rails_bd82c5b0be"
    t.index ["concept_name_id"], name: "fk_rails_d65ffd7537"
  end

  create_table "conditions", primary_key: "condition_id", id: :bigint, default: nil, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "additional_detail"
    t.bigint "previous_version"
    t.bigint "condition_coded"
    t.string "condition_non_coded"
    t.bigint "condition_coded_name"
    t.string "clinical_status", limit: 50, null: false
    t.string "verification_status", limit: 50
    t.datetime "onset_date", precision: nil
    t.datetime "date_created", precision: nil, null: false
    t.boolean "voided", default: false, null: false
    t.datetime "date_voided", precision: nil
    t.string "void_reason"
    t.string "uuid", limit: 38
    t.bigint "creator", null: false
    t.bigint "voided_by"
    t.bigint "changed_by"
    t.bigint "patient_id", null: false
    t.datetime "end_date", precision: nil
    t.index ["changed_by"], name: "fk_rails_5e1023bb14"
    t.index ["condition_coded"], name: "fk_rails_b55ae99446"
    t.index ["condition_coded_name"], name: "fk_rails_a6dc792ee3"
    t.index ["creator"], name: "fk_rails_d37da8cac8"
    t.index ["patient_id"], name: "fk_rails_d1e8033368"
    t.index ["previous_version"], name: "fk_rails_0385627bd2"
    t.index ["voided_by"], name: "fk_rails_4b14f39a01"
  end

  create_table "dataintegrity_integrity_checks", primary_key: "dataintegrity_integrity_check_id", id: :bigint, default: nil, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "check_name", limit: 100, null: false
    t.string "check_type", limit: 45, null: false
    t.string "check_code", limit: 1000, null: false
    t.string "check_result_type", limit: 45, null: false
    t.string "check_fail", limit: 100, null: false
    t.string "check_fail_operator", limit: 45, null: false
    t.string "check_repair_type", limit: 45
    t.string "check_repair", limit: 1000
    t.string "check_parameters", limit: 500
  end

  create_table "drug", primary_key: "drug_id", id: :bigint, default: nil, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "concept_id", default: 0, null: false
    t.string "name"
    t.boolean "combination", default: false, null: false
    t.bigint "dosage_form"
    t.float "maximum_daily_dose", limit: 53
    t.float "minimum_daily_dose", limit: 53
    t.bigint "route"
    t.bigint "creator", default: 0, null: false
    t.datetime "date_created", precision: nil, default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.boolean "retired", default: false, null: false
    t.bigint "retired_by"
    t.datetime "date_retired", precision: nil
    t.string "retire_reason"
    t.string "uuid", limit: 38, null: false
    t.datetime "date_changed", precision: nil
    t.bigint "changed_by"
    t.string "strength"
    t.index ["changed_by"], name: "fk_rails_22262b5d35"
    t.index ["concept_id"], name: "fk_rails_34b2e3c546"
    t.index ["creator"], name: "fk_rails_4383d11afd"
    t.index ["dosage_form"], name: "fk_rails_e4521f7314"
    t.index ["retired_by"], name: "fk_rails_077bc8e538"
    t.index ["route"], name: "fk_rails_c6e968b5d9"
  end

  create_table "drug_ingredient", id: false, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "drug_id", null: false
    t.bigint "ingredient_id", null: false
    t.string "uuid", limit: 38, null: false
    t.float "strength", limit: 53
    t.bigint "units"
    t.index ["drug_id", "ingredient_id"], name: "index_drug_ingredient_on_drug_id_and_ingredient_id", unique: true
    t.index ["ingredient_id"], name: "fk_rails_ffae3e2396"
    t.index ["units"], name: "fk_rails_c0c09db9bd"
  end

  create_table "drug_order", primary_key: "order_id", id: :bigint, default: 0, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "drug_inventory_id"
    t.float "dose", limit: 53
    t.boolean "as_needed"
    t.string "dosing_type"
    t.float "quantity", limit: 53
    t.string "as_needed_condition"
    t.bigint "num_refills"
    t.text "dosing_instructions"
    t.bigint "duration"
    t.bigint "duration_units"
    t.bigint "quantity_units"
    t.bigint "route"
    t.bigint "dose_units"
    t.bigint "frequency"
    t.string "brand_name"
    t.boolean "dispense_as_written", default: false, null: false
    t.string "drug_non_coded"
    t.index ["dose_units"], name: "fk_rails_84c512448b"
    t.index ["drug_inventory_id"], name: "fk_rails_939cf7e6a7"
    t.index ["duration_units"], name: "fk_rails_a112734d59"
    t.index ["frequency"], name: "fk_rails_c132557bce"
    t.index ["quantity_units"], name: "fk_rails_375aec56af"
    t.index ["route"], name: "fk_rails_21875f9246"
  end

  create_table "drug_reference_map", primary_key: "drug_reference_map_id", id: :bigint, default: nil, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "drug_id", null: false
    t.bigint "term_id", null: false
    t.bigint "concept_map_type", null: false
    t.bigint "creator", null: false
    t.datetime "date_created", precision: nil, null: false
    t.boolean "retired", default: false, null: false
    t.bigint "retired_by"
    t.datetime "date_retired", precision: nil
    t.string "retire_reason"
    t.bigint "changed_by"
    t.datetime "date_changed", precision: nil
    t.string "uuid", limit: 38, null: false
    t.index ["changed_by"], name: "fk_rails_f12223d857"
    t.index ["concept_map_type"], name: "fk_rails_ac8836902b"
    t.index ["creator"], name: "fk_rails_09eb4d835d"
    t.index ["drug_id"], name: "fk_rails_e6ace15670"
    t.index ["retired_by"], name: "fk_rails_1920f5f646"
    t.index ["term_id"], name: "fk_rails_20df0663f9"
  end

  create_table "encounter", primary_key: "encounter_id", id: :bigint, default: nil, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "encounter_type", null: false
    t.bigint "patient_id", default: 0, null: false
    t.bigint "location_id"
    t.bigint "form_id"
    t.datetime "encounter_datetime", precision: nil, default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.bigint "creator", default: 0, null: false
    t.datetime "date_created", precision: nil, default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.boolean "voided", default: false, null: false
    t.bigint "voided_by"
    t.datetime "date_voided", precision: nil
    t.string "void_reason"
    t.string "uuid", limit: 38, null: false
    t.bigint "changed_by"
    t.datetime "date_changed", precision: nil
    t.bigint "visit_id"
    t.index ["changed_by"], name: "fk_rails_cf8b1c5c97"
    t.index ["creator"], name: "fk_rails_a2bb0d6281"
    t.index ["encounter_type"], name: "fk_rails_302b88a03b"
    t.index ["form_id"], name: "fk_rails_abd4662979"
    t.index ["location_id"], name: "fk_rails_a32c5ae8fa"
    t.index ["patient_id"], name: "fk_rails_653751c6c6"
    t.index ["visit_id"], name: "fk_rails_618a1e853c"
    t.index ["voided_by"], name: "fk_rails_af8248dd57"
  end

  create_table "encounter_diagnosis", primary_key: "diagnosis_id", id: :bigint, default: nil, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "diagnosis_coded"
    t.string "diagnosis_non_coded"
    t.bigint "diagnosis_coded_name"
    t.bigint "encounter_id", null: false
    t.bigint "patient_id", null: false
    t.bigint "condition_id"
    t.string "certainty", null: false
    t.bigint "rank", null: false
    t.string "uuid", limit: 38, null: false
    t.bigint "creator", null: false
    t.datetime "date_created", precision: nil, null: false
    t.bigint "changed_by"
    t.datetime "date_changed", precision: nil
    t.boolean "voided", default: false, null: false
    t.bigint "voided_by"
    t.datetime "date_voided", precision: nil
    t.string "void_reason"
    t.index ["changed_by"], name: "fk_rails_b4f9c70773"
    t.index ["condition_id"], name: "fk_rails_7ae49713c8"
    t.index ["creator"], name: "fk_rails_9b0d5994a1"
    t.index ["diagnosis_coded"], name: "fk_rails_fb183900a5"
    t.index ["diagnosis_coded_name"], name: "fk_rails_a87a24fd36"
    t.index ["encounter_id"], name: "fk_rails_8f25d2c934"
    t.index ["patient_id"], name: "fk_rails_89cac110ec"
    t.index ["voided_by"], name: "fk_rails_2843606f30"
  end

  create_table "encounter_provider", primary_key: "encounter_provider_id", id: :bigint, default: nil, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "encounter_id", null: false
    t.bigint "provider_id", null: false
    t.bigint "encounter_role_id", null: false
    t.bigint "creator", default: 0, null: false
    t.datetime "date_created", precision: nil, null: false
    t.bigint "changed_by"
    t.datetime "date_changed", precision: nil
    t.boolean "voided", default: false, null: false
    t.datetime "date_voided", precision: nil
    t.bigint "voided_by"
    t.string "void_reason"
    t.string "uuid", limit: 38, null: false
    t.index ["changed_by"], name: "fk_rails_e79adc4d68"
    t.index ["creator"], name: "fk_rails_80de08b619"
    t.index ["encounter_id"], name: "fk_rails_7c67e23cce"
    t.index ["encounter_role_id"], name: "fk_rails_c0f5b47653"
    t.index ["provider_id"], name: "fk_rails_48c18f70d4"
    t.index ["voided_by"], name: "fk_rails_0cfc638e27"
  end

  create_table "encounter_role", primary_key: "encounter_role_id", id: :bigint, default: nil, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.string "description", limit: 1024
    t.bigint "creator", null: false
    t.datetime "date_created", precision: nil, null: false
    t.bigint "changed_by"
    t.datetime "date_changed", precision: nil
    t.boolean "retired", default: false, null: false
    t.bigint "retired_by"
    t.datetime "date_retired", precision: nil
    t.string "retire_reason"
    t.string "uuid", limit: 38, null: false
    t.index ["changed_by"], name: "fk_rails_6e20a23635"
    t.index ["creator"], name: "fk_rails_19ca5af229"
    t.index ["retired_by"], name: "fk_rails_f88eef4c31"
  end

  create_table "encounter_type", primary_key: "encounter_type_id", id: :bigint, default: nil, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", limit: 50, default: "", null: false
    t.text "description"
    t.bigint "creator", default: 0, null: false
    t.datetime "date_created", precision: nil, default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.boolean "retired", default: false, null: false
    t.bigint "retired_by"
    t.datetime "date_retired", precision: nil
    t.string "retire_reason"
    t.string "uuid", limit: 38, null: false
    t.string "view_privilege"
    t.string "edit_privilege"
    t.bigint "changed_by"
    t.datetime "date_changed", precision: nil
    t.index ["changed_by"], name: "fk_rails_46c96c021e"
    t.index ["creator"], name: "fk_rails_dc1426b7ba"
    t.index ["edit_privilege"], name: "fk_rails_13f5b607a7"
    t.index ["retired_by"], name: "fk_rails_4eb99f2541"
    t.index ["view_privilege"], name: "fk_rails_7143e13146"
  end

  create_table "field", primary_key: "field_id", id: :bigint, default: nil, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.text "description"
    t.bigint "field_type"
    t.bigint "concept_id"
    t.string "table_name", limit: 50
    t.string "attribute_name", limit: 50
    t.text "default_value"
    t.boolean "select_multiple", default: false, null: false
    t.bigint "creator", default: 0, null: false
    t.datetime "date_created", precision: nil, default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.bigint "changed_by"
    t.datetime "date_changed", precision: nil
    t.boolean "retired", default: false, null: false
    t.bigint "retired_by"
    t.datetime "date_retired", precision: nil
    t.string "retire_reason"
    t.string "uuid", limit: 38, null: false
    t.index ["changed_by"], name: "fk_rails_1acc3c35ba"
    t.index ["concept_id"], name: "fk_rails_b52a96f045"
    t.index ["creator"], name: "fk_rails_2ead793614"
    t.index ["field_type"], name: "fk_rails_f24779e145"
    t.index ["retired_by"], name: "fk_rails_969baeb672"
  end

  create_table "field_answer", id: false, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "field_id", default: 0, null: false
    t.bigint "answer_id", default: 0, null: false
    t.bigint "creator", default: 0, null: false
    t.datetime "date_created", precision: nil, default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string "uuid", limit: 38, null: false
    t.index ["answer_id"], name: "fk_rails_e30f271ccb"
    t.index ["creator"], name: "fk_rails_31518cedf4"
    t.index ["field_id", "answer_id"], name: "index_field_answer_on_field_id_and_answer_id", unique: true
  end

  create_table "field_type", primary_key: "field_type_id", id: :bigint, default: nil, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", limit: 50
    t.text "description", size: :long
    t.boolean "is_set", default: false, null: false
    t.bigint "creator", default: 0, null: false
    t.datetime "date_created", precision: nil, default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string "uuid", limit: 38, null: false
    t.index ["creator"], name: "fk_rails_fb67a16991"
  end

  create_table "form", primary_key: "form_id", id: :bigint, default: nil, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "version", limit: 50, default: "", null: false
    t.bigint "build"
    t.boolean "published", default: false, null: false
    t.text "description"
    t.bigint "encounter_type"
    t.text "template", size: :medium
    t.text "xslt", size: :medium
    t.bigint "creator", default: 0, null: false
    t.datetime "date_created", precision: nil, default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.bigint "changed_by"
    t.datetime "date_changed", precision: nil
    t.boolean "retired", default: false, null: false
    t.bigint "retired_by"
    t.datetime "date_retired", precision: nil
    t.string "retired_reason"
    t.string "uuid", limit: 38, null: false
    t.index ["changed_by"], name: "fk_rails_07b7e57e6b"
    t.index ["creator"], name: "fk_rails_031871073f"
    t.index ["encounter_type"], name: "fk_rails_1766efac77"
    t.index ["retired_by"], name: "fk_rails_8da6f03423"
  end

  create_table "form_field", primary_key: "form_field_id", id: :bigint, default: nil, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "form_id", default: 0, null: false
    t.bigint "field_id", default: 0, null: false
    t.bigint "field_number"
    t.string "field_part", limit: 5
    t.bigint "page_number"
    t.bigint "parent_form_field"
    t.bigint "min_occurs"
    t.bigint "max_occurs"
    t.boolean "required", default: false, null: false
    t.bigint "changed_by"
    t.datetime "date_changed", precision: nil
    t.bigint "creator", default: 0, null: false
    t.datetime "date_created", precision: nil, default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.float "sort_weight"
    t.string "uuid", limit: 38, null: false
    t.index ["changed_by"], name: "fk_rails_daf37e733c"
    t.index ["creator"], name: "fk_rails_3e6a802e18"
    t.index ["field_id"], name: "fk_rails_8de9852479"
    t.index ["form_id"], name: "fk_rails_9f22a5922f"
    t.index ["parent_form_field"], name: "fk_rails_1e3ff32f72"
  end

  create_table "form_resource", primary_key: "form_resource_id", id: :bigint, default: nil, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "form_id", null: false
    t.string "name", null: false
    t.text "value_reference", null: false
    t.string "datatype"
    t.text "datatype_config"
    t.string "preferred_handler"
    t.text "handler_config"
    t.string "uuid", limit: 38, null: false
    t.datetime "date_changed", precision: nil
    t.bigint "changed_by"
    t.index ["changed_by"], name: "fk_rails_9bbb174a6e"
    t.index ["form_id"], name: "fk_rails_143aad8645"
  end

  create_table "formentry_archive", primary_key: "formentry_archive_id", id: :bigint, default: nil, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.text "form_data", size: :medium, null: false
    t.datetime "date_created", precision: nil, default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.bigint "creator", default: 0, null: false
    t.index ["creator"], name: "fk_rails_79c5cd2fe4"
  end

  create_table "formentry_error", primary_key: "formentry_error_id", id: :bigint, default: nil, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.text "form_data", size: :medium, null: false
    t.string "error", default: "", null: false
    t.text "error_details"
    t.bigint "creator", default: 0, null: false
    t.datetime "date_created", precision: nil, default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["creator"], name: "fk_rails_3d05227493"
  end

  create_table "formentry_queue", primary_key: "formentry_queue_id", id: :bigint, default: nil, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.text "form_data", size: :medium, null: false
    t.bigint "creator", default: 0, null: false
    t.datetime "date_created", precision: nil, default: -> { "CURRENT_TIMESTAMP" }, null: false
  end

  create_table "formentry_xsn", primary_key: "formentry_xsn_id", id: :bigint, default: nil, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "form_id", null: false
    t.binary "xsn_data", size: :long, null: false
    t.bigint "creator", default: 0, null: false
    t.datetime "date_created", precision: nil, default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.bigint "archived", default: 0, null: false
    t.bigint "archived_by"
    t.datetime "date_archived", precision: nil
    t.string "uuid", limit: 38, null: false
    t.index ["archived_by"], name: "fk_rails_9913467a77"
    t.index ["creator"], name: "fk_rails_843208fcee"
    t.index ["form_id"], name: "fk_rails_8090bc27ea"
  end

  create_table "global_property", primary_key: "property", id: :string, default: "", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.text "property_value", size: :medium
    t.text "description"
    t.string "uuid", limit: 38, null: false
    t.string "datatype"
    t.text "datatype_config"
    t.string "preferred_handler"
    t.text "handler_config"
    t.datetime "date_changed", precision: nil
    t.bigint "changed_by"
    t.index ["changed_by"], name: "fk_rails_1df8006efa"
  end

  create_table "hl7_in_archive", primary_key: "hl7_in_archive_id", id: :bigint, default: nil, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "hl7_source", default: 0, null: false
    t.string "hl7_source_key"
    t.text "hl7_data", size: :medium, null: false
    t.datetime "date_created", precision: nil, default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.bigint "message_state", default: 0
    t.string "uuid", limit: 38, null: false
  end

  create_table "hl7_in_error", primary_key: "hl7_in_error_id", id: :bigint, default: nil, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "hl7_source", default: 0, null: false
    t.text "hl7_source_key"
    t.text "hl7_data", size: :medium, null: false
    t.string "error", default: "", null: false
    t.text "error_details", size: :medium
    t.datetime "date_created", precision: nil, default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string "uuid", limit: 38, null: false
  end

  create_table "hl7_in_queue", primary_key: "hl7_in_queue_id", id: :bigint, default: nil, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "hl7_source", default: 0, null: false
    t.text "hl7_source_key"
    t.text "hl7_data", size: :medium, null: false
    t.bigint "message_state", default: 0, null: false
    t.datetime "date_processed", precision: nil
    t.text "error_msg"
    t.datetime "date_created", precision: nil
    t.string "uuid", limit: 38, null: false
    t.index ["hl7_source"], name: "fk_rails_1b59d1dd20"
  end

  create_table "hl7_source", primary_key: "hl7_source_id", id: :bigint, default: nil, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.text "description", size: :tiny
    t.bigint "creator", default: 0, null: false
    t.datetime "date_created", precision: nil, default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string "uuid", limit: 38, null: false
    t.index ["creator"], name: "fk_rails_24c77ce8d0"
  end

  create_table "htmlformentry_html_form", id: :bigint, default: nil, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "form_id"
    t.string "name"
    t.text "xml_data", size: :medium, null: false
    t.bigint "creator", default: 0, null: false
    t.datetime "date_created", precision: nil, default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.bigint "changed_by"
    t.datetime "date_changed", precision: nil
    t.boolean "retired", default: false, null: false
    t.string "uuid", limit: 38, null: false
    t.string "description", limit: 1000
    t.bigint "retired_by"
    t.datetime "date_retired", precision: nil
    t.string "retire_reason"
    t.index ["changed_by"], name: "fk_rails_a003d9aa3d"
    t.index ["creator"], name: "fk_rails_5311cf25a7"
    t.index ["form_id"], name: "fk_rails_b9719f7f16"
    t.index ["retired_by"], name: "fk_rails_c259a20dcc"
  end

  create_table "liquibasechangelog", id: false, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "ID", limit: 63, null: false
    t.string "AUTHOR", limit: 63, null: false
    t.string "FILENAME", limit: 200, null: false
    t.datetime "DATEEXECUTED", precision: nil, null: false
    t.string "MD5SUM", limit: 35
    t.string "DESCRIPTION"
    t.string "COMMENTS"
    t.string "TAG"
    t.string "LIQUIBASE", limit: 20
    t.bigint "ORDEREXECUTED", null: false
    t.string "EXECTYPE", limit: 10, null: false
    t.index ["ID", "AUTHOR", "FILENAME"], name: "index_liquibasechangelog_on_ID_and_AUTHOR_and_FILENAME", unique: true
  end

  create_table "liquibasechangeloglock", primary_key: "ID", id: :bigint, default: nil, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.boolean "LOCKED", null: false
    t.datetime "LOCKGRANTED", precision: nil
    t.string "LOCKEDBY"
  end

  create_table "location", primary_key: "location_id", id: :bigint, default: nil, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "description"
    t.string "address1"
    t.string "address2"
    t.string "city_village"
    t.string "state_province"
    t.string "postal_code", limit: 50
    t.string "country", limit: 50
    t.string "latitude", limit: 50
    t.string "longitude", limit: 50
    t.bigint "creator", default: 0, null: false
    t.datetime "date_created", precision: nil, default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string "county_district"
    t.string "address3"
    t.string "address6"
    t.string "address5"
    t.string "address4"
    t.boolean "retired", default: false, null: false
    t.bigint "retired_by"
    t.datetime "date_retired", precision: nil
    t.string "retire_reason"
    t.bigint "parent_location"
    t.string "uuid", limit: 38, null: false
    t.bigint "changed_by"
    t.datetime "date_changed", precision: nil
    t.string "address7"
    t.string "address8"
    t.string "address9"
    t.string "address10"
    t.string "address11"
    t.string "address12"
    t.string "address13"
    t.string "address14"
    t.string "address15"
    t.index ["changed_by"], name: "fk_rails_a2690def67"
    t.index ["creator"], name: "fk_rails_44d885c17a"
    t.index ["parent_location"], name: "fk_rails_c767895ed9"
    t.index ["retired_by"], name: "fk_rails_2e4f6cc095"
  end

  create_table "location_attribute", primary_key: "location_attribute_id", id: :bigint, default: nil, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "location_id", null: false
    t.bigint "attribute_type_id", null: false
    t.text "value_reference", null: false
    t.string "uuid", limit: 38, null: false
    t.bigint "creator", null: false
    t.datetime "date_created", precision: nil, null: false
    t.bigint "changed_by"
    t.datetime "date_changed", precision: nil
    t.boolean "voided", default: false, null: false
    t.bigint "voided_by"
    t.datetime "date_voided", precision: nil
    t.string "void_reason"
    t.index ["attribute_type_id"], name: "fk_rails_f5dd09128d"
    t.index ["changed_by"], name: "fk_rails_144e657945"
    t.index ["creator"], name: "fk_rails_7541369610"
    t.index ["location_id"], name: "fk_rails_eed1c1619a"
    t.index ["voided_by"], name: "fk_rails_b7add2bb00"
  end

  create_table "location_attribute_type", primary_key: "location_attribute_type_id", id: :bigint, default: nil, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.string "description", limit: 1024
    t.string "datatype"
    t.text "datatype_config"
    t.string "preferred_handler"
    t.text "handler_config"
    t.bigint "min_occurs", null: false
    t.bigint "max_occurs"
    t.bigint "creator", null: false
    t.datetime "date_created", precision: nil, null: false
    t.bigint "changed_by"
    t.datetime "date_changed", precision: nil
    t.boolean "retired", default: false, null: false
    t.bigint "retired_by"
    t.datetime "date_retired", precision: nil
    t.string "retire_reason"
    t.string "uuid", limit: 38, null: false
    t.index ["changed_by"], name: "fk_rails_d85fde62d6"
    t.index ["creator"], name: "fk_rails_d0913fad79"
    t.index ["retired_by"], name: "fk_rails_24eacc567e"
  end

  create_table "location_tag", primary_key: "location_tag_id", id: :bigint, default: nil, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", limit: 50
    t.string "description"
    t.bigint "creator", null: false
    t.datetime "date_created", precision: nil, null: false
    t.boolean "retired", default: false, null: false
    t.bigint "retired_by"
    t.datetime "date_retired", precision: nil
    t.string "retire_reason"
    t.string "uuid", limit: 38, null: false
    t.bigint "changed_by"
    t.datetime "date_changed", precision: nil
    t.index ["changed_by"], name: "fk_rails_26fc451563"
    t.index ["creator"], name: "fk_rails_bf4b70121e"
    t.index ["retired_by"], name: "fk_rails_436fcb0816"
  end

  create_table "location_tag_map", id: false, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "location_id", null: false
    t.bigint "location_tag_id", null: false
    t.index ["location_id", "location_tag_id"], name: "index_location_tag_map_on_location_id_and_location_tag_id", unique: true
    t.index ["location_tag_id"], name: "fk_rails_649296214e"
  end

  create_table "logic_rule_definition", id: :bigint, default: nil, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "uuid", limit: 38, null: false
    t.string "name", null: false
    t.string "description", limit: 1000
    t.string "rule_content", limit: 2048, null: false
    t.string "language", null: false
    t.bigint "creator", default: 0, null: false
    t.datetime "date_created", precision: nil, default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.bigint "changed_by"
    t.datetime "date_changed", precision: nil
    t.boolean "retired", default: false, null: false
    t.bigint "retired_by"
    t.datetime "date_retired", precision: nil
    t.string "retire_reason"
    t.index ["changed_by"], name: "fk_rails_87e3968a0f"
    t.index ["creator"], name: "fk_rails_eeea24fa6d"
    t.index ["retired_by"], name: "fk_rails_f4317bb047"
  end

  create_table "logic_rule_token", primary_key: "logic_rule_token_id", id: :bigint, default: nil, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "creator", null: false
    t.datetime "date_created", precision: nil, default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.bigint "changed_by"
    t.datetime "date_changed", precision: nil
    t.string "token", limit: 512, null: false
    t.string "class_name", limit: 512, null: false
    t.string "state", limit: 512
    t.string "uuid", limit: 38, null: false
    t.index ["changed_by"], name: "fk_rails_464b54d9e6"
    t.index ["creator"], name: "fk_rails_319acc68bd"
  end

  create_table "logic_rule_token_tag", id: false, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "logic_rule_token_id", null: false
    t.string "tag", limit: 512, null: false
    t.index ["logic_rule_token_id"], name: "fk_rails_a3f2a6c30d"
  end

  create_table "logic_token_registration", primary_key: "token_registration_id", id: :bigint, default: nil, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "creator", null: false
    t.datetime "date_created", precision: nil, default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.bigint "changed_by"
    t.datetime "date_changed", precision: nil
    t.string "token", limit: 512, null: false
    t.string "provider_class_name", limit: 512, null: false
    t.string "provider_token", limit: 512, null: false
    t.string "configuration", limit: 2000
    t.string "uuid", limit: 38, null: false
    t.index ["changed_by"], name: "fk_rails_82c37a98ca"
    t.index ["creator"], name: "fk_rails_6cddb1a731"
  end

  create_table "logic_token_registration_tag", id: false, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "token_registration_id", null: false
    t.string "tag", limit: 512, null: false
    t.index ["token_registration_id"], name: "fk_rails_d735dadb72"
  end

  create_table "metadatasharing_exported_package", primary_key: "exported_package_id", id: :bigint, default: nil, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "uuid", limit: 38, null: false
    t.datetime "date_created", precision: nil, null: false
    t.string "name", limit: 64, null: false
    t.string "description", limit: 256, null: false
    t.binary "content"
  end

  create_table "metadatasharing_imported_item", primary_key: "imported_item_id", id: :bigint, default: nil, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "uuid", limit: 38, null: false
    t.string "itemUuid", limit: 38, null: false
  end

  create_table "metadatasharing_imported_package", primary_key: "imported_package_id", id: :bigint, default: nil, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "uuid", limit: 38, null: false
    t.string "package_uuid", limit: 38, null: false
    t.datetime "date_created", precision: nil, null: false
    t.string "name", limit: 64, null: false
    t.string "description", limit: 256, null: false
    t.datetime "date_imported", precision: nil, null: false
  end

  create_table "metadatasharing_imported_package_item", id: false, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "imported_package_id", default: 0, null: false
    t.bigint "imported_item_id", default: 0, null: false
    t.index ["imported_package_id", "imported_item_id"], name: "index_imported_package_item", unique: true
  end

  create_table "note", primary_key: "note_id", id: :bigint, default: 0, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "note_type", limit: 50
    t.bigint "patient_id"
    t.bigint "obs_id"
    t.bigint "encounter_id"
    t.text "text", null: false
    t.bigint "priority"
    t.bigint "parent"
    t.bigint "creator", default: 0, null: false
    t.datetime "date_created", precision: nil, default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.bigint "changed_by"
    t.datetime "date_changed", precision: nil
    t.string "uuid", limit: 38, null: false
    t.index ["changed_by"], name: "fk_rails_77a7d3aef0"
    t.index ["creator"], name: "fk_rails_bd2156a638"
    t.index ["encounter_id"], name: "fk_rails_54123c8d5b"
    t.index ["obs_id"], name: "fk_rails_e6696b36aa"
    t.index ["parent"], name: "fk_rails_91f81b9586"
    t.index ["patient_id"], name: "fk_rails_291892be47"
  end

  create_table "notification_alert", primary_key: "alert_id", id: :bigint, default: nil, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "text", limit: 512, null: false
    t.bigint "satisfied_by_any", default: 0, null: false
    t.bigint "alert_read", default: 0, null: false
    t.datetime "date_to_expire", precision: nil
    t.bigint "creator", null: false
    t.datetime "date_created", precision: nil, default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.bigint "changed_by"
    t.datetime "date_changed", precision: nil
    t.string "uuid", limit: 38, null: false
    t.index ["changed_by"], name: "fk_rails_1a0d1ffbc1"
    t.index ["creator"], name: "fk_rails_874ce15ba2"
  end

  create_table "notification_alert_recipient", id: false, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "alert_id", null: false
    t.bigint "user_id", null: false
    t.bigint "alert_read", default: 0, null: false
    t.datetime "date_changed", precision: nil
    t.string "uuid", limit: 38, null: false
    t.index ["alert_id", "user_id"], name: "index_notification_alert_recipient_on_alert_id_and_user_id", unique: true
    t.index ["user_id"], name: "fk_rails_df681fd567"
  end

  create_table "notification_template", primary_key: "template_id", id: :bigint, default: nil, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", limit: 50
    t.text "template"
    t.string "subject", limit: 100
    t.string "sender"
    t.string "recipients", limit: 512
    t.bigint "ordinal", default: 0
    t.string "uuid", limit: 38, null: false
  end

  create_table "obs", primary_key: "obs_id", id: :bigint, default: nil, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "person_id", null: false
    t.bigint "concept_id", default: 0, null: false
    t.bigint "encounter_id"
    t.bigint "order_id"
    t.datetime "obs_datetime", precision: nil, default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.bigint "location_id"
    t.bigint "obs_group_id"
    t.string "accession_number"
    t.bigint "value_group_id"
    t.bigint "value_coded"
    t.bigint "value_coded_name_id"
    t.bigint "value_drug"
    t.datetime "value_datetime", precision: nil
    t.float "value_numeric", limit: 53
    t.string "value_modifier", limit: 2
    t.text "value_text"
    t.string "comments"
    t.bigint "creator", default: 0, null: false
    t.datetime "date_created", precision: nil, default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.boolean "voided", default: false, null: false
    t.bigint "voided_by"
    t.datetime "date_voided", precision: nil
    t.string "void_reason"
    t.string "value_complex", limit: 1000
    t.string "uuid", limit: 38, null: false
    t.bigint "previous_version"
    t.string "form_namespace_and_path"
    t.string "status", limit: 16, default: "", null: false
    t.string "interpretation", limit: 32
    t.index ["concept_id"], name: "fk_rails_426a4f4d30"
    t.index ["creator"], name: "fk_rails_e8785076bd"
    t.index ["encounter_id"], name: "fk_rails_272aa1a48b"
    t.index ["location_id"], name: "fk_rails_ff3354d104"
    t.index ["obs_group_id"], name: "fk_rails_e401938308"
    t.index ["order_id"], name: "fk_rails_31b59b3e1a"
    t.index ["person_id"], name: "fk_rails_cb319f4077"
    t.index ["previous_version"], name: "fk_rails_faec299856"
    t.index ["value_coded"], name: "fk_rails_f660a82060"
    t.index ["value_coded_name_id"], name: "fk_rails_a140fc81b3"
    t.index ["value_drug"], name: "fk_rails_5263a52ac2"
    t.index ["voided_by"], name: "fk_rails_66e672eeeb"
  end

  create_table "order_frequency", primary_key: "order_frequency_id", id: :bigint, default: nil, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "concept_id", null: false
    t.float "frequency_per_day", limit: 53
    t.bigint "creator", null: false
    t.datetime "date_created", precision: nil, null: false
    t.boolean "retired", default: false, null: false
    t.bigint "retired_by"
    t.datetime "date_retired", precision: nil
    t.string "retire_reason"
    t.bigint "changed_by"
    t.datetime "date_changed", precision: nil
    t.string "uuid", limit: 38, null: false
    t.index ["changed_by"], name: "fk_rails_ddff167d68"
    t.index ["concept_id"], name: "fk_rails_a9a7e5a02a"
    t.index ["creator"], name: "fk_rails_5a27577fe5"
    t.index ["retired_by"], name: "fk_rails_21d54a6f16"
  end

  create_table "order_group", primary_key: "order_group_id", id: :bigint, default: nil, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "order_set_id"
    t.bigint "patient_id", null: false
    t.bigint "encounter_id", null: false
    t.bigint "creator", null: false
    t.datetime "date_created", precision: nil, null: false
    t.boolean "voided", default: false, null: false
    t.bigint "voided_by"
    t.datetime "date_voided", precision: nil
    t.string "void_reason"
    t.bigint "changed_by"
    t.datetime "date_changed", precision: nil
    t.string "uuid", limit: 38, null: false
    t.index ["changed_by"], name: "fk_rails_44e40e16ed"
    t.index ["creator"], name: "fk_rails_9f1f71e273"
    t.index ["encounter_id"], name: "fk_rails_dded46f7f9"
    t.index ["order_set_id"], name: "fk_rails_9b673cf0f1"
    t.index ["patient_id"], name: "fk_rails_a5f3b6bf7a"
    t.index ["voided_by"], name: "fk_rails_e14ee6a3a9"
  end

  create_table "order_set", primary_key: "order_set_id", id: :bigint, default: nil, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "operator", limit: 50, null: false
    t.string "name", null: false
    t.string "description", limit: 1000
    t.bigint "creator", null: false
    t.datetime "date_created", precision: nil, null: false
    t.boolean "retired", default: false, null: false
    t.bigint "retired_by"
    t.datetime "date_retired", precision: nil
    t.string "retire_reason"
    t.bigint "changed_by"
    t.datetime "date_changed", precision: nil
    t.string "uuid", limit: 38, null: false
    t.index ["changed_by"], name: "fk_rails_2780dfe5b0"
    t.index ["creator"], name: "fk_rails_8e01030155"
    t.index ["retired_by"], name: "fk_rails_6574e1db8e"
  end

  create_table "order_set_member", primary_key: "order_set_member_id", id: :bigint, default: nil, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "order_type", null: false
    t.text "order_template"
    t.string "order_template_type", limit: 1024
    t.bigint "order_set_id", null: false
    t.bigint "sequence_number", null: false
    t.bigint "concept_id", null: false
    t.bigint "creator", null: false
    t.datetime "date_created", precision: nil, null: false
    t.boolean "retired", default: false, null: false
    t.bigint "retired_by"
    t.datetime "date_retired", precision: nil
    t.string "retire_reason"
    t.bigint "changed_by"
    t.datetime "date_changed", precision: nil
    t.string "uuid", limit: 38, null: false
    t.index ["changed_by"], name: "fk_rails_5f18d672e0"
    t.index ["concept_id"], name: "fk_rails_cff3bcd615"
    t.index ["creator"], name: "fk_rails_e29ba02fda"
    t.index ["order_set_id"], name: "fk_rails_a857681d17"
    t.index ["order_type"], name: "fk_rails_183879a009"
    t.index ["retired_by"], name: "fk_rails_1469d81cb3"
  end

  create_table "order_type", primary_key: "order_type_id", id: :bigint, default: nil, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.text "description"
    t.bigint "creator", default: 0, null: false
    t.datetime "date_created", precision: nil, default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.boolean "retired", default: false, null: false
    t.bigint "retired_by"
    t.datetime "date_retired", precision: nil
    t.string "retire_reason"
    t.string "uuid", limit: 38, null: false
    t.string "java_class_name", null: false
    t.bigint "parent"
    t.bigint "changed_by"
    t.datetime "date_changed", precision: nil
    t.index ["changed_by"], name: "fk_rails_b1828b1b0c"
    t.index ["creator"], name: "fk_rails_b7bdc679df"
    t.index ["parent"], name: "fk_rails_d1f13609b2"
    t.index ["retired_by"], name: "fk_rails_d8e0ccc9a4"
  end

  create_table "order_type_class_map", id: false, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "order_type_id", null: false
    t.bigint "concept_class_id", null: false
    t.index ["concept_class_id"], name: "fk_rails_17aa819c0d"
    t.index ["order_type_id", "concept_class_id"], name: "index_order_type_class_map_on_order_type_id_and_concept_class_id", unique: true
  end

  create_table "orders", primary_key: "order_id", id: :bigint, default: nil, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "order_type_id", default: 0, null: false
    t.bigint "concept_id", default: 0, null: false
    t.bigint "orderer", null: false
    t.bigint "encounter_id", null: false
    t.text "instructions"
    t.datetime "date_activated", precision: nil
    t.datetime "auto_expire_date", precision: nil
    t.datetime "date_stopped", precision: nil
    t.bigint "order_reason"
    t.bigint "creator", default: 0, null: false
    t.datetime "date_created", precision: nil, default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.boolean "voided", default: false, null: false
    t.bigint "voided_by"
    t.datetime "date_voided", precision: nil
    t.string "void_reason"
    t.bigint "patient_id", null: false
    t.string "accession_number"
    t.string "uuid", limit: 38, null: false
    t.string "order_reason_non_coded"
    t.string "urgency", limit: 50, default: "", null: false
    t.string "order_number", limit: 50, null: false
    t.bigint "previous_order_id"
    t.string "order_action", limit: 50, null: false
    t.string "comment_to_fulfiller", limit: 1024
    t.bigint "care_setting", null: false
    t.datetime "scheduled_date", precision: nil
    t.bigint "order_group_id"
    t.float "sort_weight", limit: 53
    t.string "fulfiller_comment", limit: 1024
    t.string "fulfiller_status", limit: 50
    t.index ["care_setting"], name: "fk_rails_880a65d81d"
    t.index ["creator"], name: "fk_rails_58c783a090"
    t.index ["encounter_id"], name: "fk_rails_00212faa5d"
    t.index ["order_group_id"], name: "fk_rails_14e3a5f623"
    t.index ["order_reason"], name: "fk_rails_99cb9c8385"
    t.index ["order_type_id"], name: "fk_rails_aea2044a0b"
    t.index ["orderer"], name: "fk_rails_f395fa9e06"
    t.index ["patient_id"], name: "fk_rails_cf338c8d9e"
    t.index ["previous_order_id"], name: "fk_rails_1ed017fea6"
    t.index ["voided_by"], name: "fk_rails_6891831a3d"
  end

  create_table "patient", primary_key: "patient_id", id: :bigint, default: nil, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "creator", default: 0, null: false
    t.datetime "date_created", precision: nil, default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.bigint "changed_by"
    t.datetime "date_changed", precision: nil
    t.boolean "voided", default: false, null: false
    t.bigint "voided_by"
    t.datetime "date_voided", precision: nil
    t.string "void_reason"
    t.string "allergy_status", limit: 50, default: "", null: false
    t.index ["changed_by"], name: "fk_rails_53ba74c797"
    t.index ["creator"], name: "fk_rails_6aedfaea82"
    t.index ["voided_by"], name: "fk_rails_255f46691d"
  end

  create_table "patient_identifier", primary_key: "patient_identifier_id", id: :bigint, default: nil, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "patient_id", default: 0, null: false
    t.string "identifier", limit: 50, default: "", null: false
    t.bigint "identifier_type", default: 0, null: false
    t.boolean "preferred", default: false, null: false
    t.bigint "location_id"
    t.bigint "creator", default: 0, null: false
    t.datetime "date_created", precision: nil, default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.boolean "voided", default: false, null: false
    t.bigint "voided_by"
    t.datetime "date_voided", precision: nil
    t.string "void_reason"
    t.string "uuid", limit: 38, null: false
    t.datetime "date_changed", precision: nil
    t.bigint "changed_by"
    t.index ["changed_by"], name: "fk_rails_0c6bd89555"
    t.index ["creator"], name: "fk_rails_129de0b797"
    t.index ["identifier_type"], name: "fk_rails_893ae6c8bf"
    t.index ["location_id"], name: "fk_rails_00e2a0f2d2"
    t.index ["patient_id"], name: "fk_rails_696d69e81e"
    t.index ["voided_by"], name: "fk_rails_837c64369a"
  end

  create_table "patient_identifier_type", primary_key: "patient_identifier_type_id", id: :bigint, default: nil, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", limit: 50, default: "", null: false
    t.text "description"
    t.string "format"
    t.boolean "check_digit", default: false, null: false
    t.bigint "creator", default: 0, null: false
    t.datetime "date_created", precision: nil, default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.boolean "required", default: false, null: false
    t.string "format_description"
    t.string "validator", limit: 200
    t.boolean "retired", default: false, null: false
    t.bigint "retired_by"
    t.datetime "date_retired", precision: nil
    t.string "retire_reason"
    t.string "uuid", limit: 38, null: false
    t.string "location_behavior", limit: 50
    t.string "uniqueness_behavior", limit: 50
    t.datetime "date_changed", precision: nil
    t.bigint "changed_by"
    t.index ["changed_by"], name: "fk_rails_822b6ab3a9"
    t.index ["creator"], name: "fk_rails_858419a4f8"
    t.index ["retired_by"], name: "fk_rails_639b8f2dde"
  end

  create_table "patient_program", primary_key: "patient_program_id", id: :bigint, default: nil, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "patient_id", default: 0, null: false
    t.bigint "program_id", default: 0, null: false
    t.datetime "date_enrolled", precision: nil
    t.datetime "date_completed", precision: nil
    t.bigint "creator", default: 0, null: false
    t.datetime "date_created", precision: nil, default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.bigint "changed_by"
    t.datetime "date_changed", precision: nil
    t.boolean "voided", default: false, null: false
    t.bigint "voided_by"
    t.datetime "date_voided", precision: nil
    t.string "void_reason"
    t.string "uuid", limit: 38, null: false
    t.bigint "location_id"
    t.bigint "outcome_concept_id"
    t.index ["changed_by"], name: "fk_rails_e9f82e0708"
    t.index ["creator"], name: "fk_rails_2b734187fc"
    t.index ["location_id"], name: "fk_rails_ea811118c2"
    t.index ["outcome_concept_id"], name: "fk_rails_9093689131"
    t.index ["patient_id"], name: "fk_rails_c69ce747db"
    t.index ["program_id"], name: "fk_rails_cd93370d20"
    t.index ["voided_by"], name: "fk_rails_14c9797d1f"
  end

  create_table "patient_program_attribute", primary_key: "patient_program_attribute_id", id: :bigint, default: nil, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "patient_program_id", null: false
    t.bigint "attribute_type_id", null: false
    t.text "value_reference", null: false
    t.string "uuid", limit: 38, null: false
    t.bigint "creator", null: false
    t.datetime "date_created", precision: nil, null: false
    t.bigint "changed_by"
    t.datetime "date_changed", precision: nil
    t.boolean "voided", default: false, null: false
    t.bigint "voided_by"
    t.datetime "date_voided", precision: nil
    t.string "void_reason"
    t.index ["attribute_type_id"], name: "fk_rails_7310559639"
    t.index ["changed_by"], name: "fk_rails_e9923c9332"
    t.index ["creator"], name: "fk_rails_72eada17c3"
    t.index ["patient_program_id"], name: "fk_rails_75b2078c09"
    t.index ["voided_by"], name: "fk_rails_c1bcf2c8a3"
  end

  create_table "patient_state", primary_key: "patient_state_id", id: :bigint, default: nil, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "patient_program_id", default: 0, null: false
    t.bigint "state", default: 0, null: false
    t.date "start_date"
    t.date "end_date"
    t.bigint "creator", default: 0, null: false
    t.datetime "date_created", precision: nil, default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.bigint "changed_by"
    t.datetime "date_changed", precision: nil
    t.boolean "voided", default: false, null: false
    t.bigint "voided_by"
    t.datetime "date_voided", precision: nil
    t.string "void_reason"
    t.string "uuid", limit: 38, null: false
    t.index ["changed_by"], name: "fk_rails_84f3119a0a"
    t.index ["creator"], name: "fk_rails_0daf19d44c"
    t.index ["patient_program_id"], name: "fk_rails_2911b458b2"
    t.index ["state"], name: "fk_rails_d8d323e1f2"
    t.index ["voided_by"], name: "fk_rails_2751849b8d"
  end

  create_table "person", primary_key: "person_id", id: :bigint, default: nil, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "gender", limit: 50, default: ""
    t.date "birthdate"
    t.boolean "birthdate_estimated", default: false, null: false
    t.boolean "dead", default: false, null: false
    t.datetime "death_date", precision: nil
    t.bigint "cause_of_death"
    t.bigint "creator", default: 0, null: false
    t.datetime "date_created", precision: nil, default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.bigint "changed_by"
    t.datetime "date_changed", precision: nil
    t.boolean "voided", default: false, null: false
    t.bigint "voided_by"
    t.datetime "date_voided", precision: nil
    t.string "void_reason"
    t.string "uuid", limit: 38, null: false
    t.boolean "deathdate_estimated", default: false, null: false
    t.time "birthtime"
    t.string "cause_of_death_non_coded"
    t.index ["cause_of_death"], name: "fk_rails_0e72f811f4"
    t.index ["changed_by"], name: "fk_rails_80dade1053"
    t.index ["creator"], name: "fk_rails_342e14d89c"
    t.index ["voided_by"], name: "fk_rails_91d3b01986"
  end

  create_table "person_address", primary_key: "person_address_id", id: :bigint, default: nil, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "person_id"
    t.boolean "preferred", default: false, null: false
    t.string "address1"
    t.string "address2"
    t.string "city_village"
    t.string "state_province"
    t.string "postal_code", limit: 50
    t.string "country", limit: 50
    t.string "latitude", limit: 50
    t.string "longitude", limit: 50
    t.bigint "creator", default: 0, null: false
    t.datetime "date_created", precision: nil, default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.boolean "voided", default: false, null: false
    t.bigint "voided_by"
    t.datetime "date_voided", precision: nil
    t.string "void_reason"
    t.string "county_district"
    t.string "address3"
    t.string "address6"
    t.string "address5"
    t.string "address4"
    t.string "uuid", limit: 38, null: false
    t.datetime "date_changed", precision: nil
    t.bigint "changed_by"
    t.datetime "start_date", precision: nil
    t.datetime "end_date", precision: nil
    t.string "address7"
    t.string "address8"
    t.string "address9"
    t.string "address10"
    t.string "address11"
    t.string "address12"
    t.string "address13"
    t.string "address14"
    t.string "address15"
    t.index ["changed_by"], name: "fk_rails_81b9b5046c"
    t.index ["creator"], name: "fk_rails_bc5afcab2c"
    t.index ["person_id"], name: "fk_rails_f018c903e8"
    t.index ["voided_by"], name: "fk_rails_7637fbc857"
  end

  create_table "person_attribute", primary_key: "person_attribute_id", id: :bigint, default: nil, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "person_id", default: 0, null: false
    t.string "value", limit: 50, default: "", null: false
    t.bigint "person_attribute_type_id", default: 0, null: false
    t.bigint "creator", default: 0, null: false
    t.datetime "date_created", precision: nil, default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.bigint "changed_by"
    t.datetime "date_changed", precision: nil
    t.boolean "voided", default: false, null: false
    t.bigint "voided_by"
    t.datetime "date_voided", precision: nil
    t.string "void_reason"
    t.string "uuid", limit: 38, null: false
    t.index ["changed_by"], name: "fk_rails_64976c7765"
    t.index ["creator"], name: "fk_rails_28123390c4"
    t.index ["person_attribute_type_id"], name: "fk_rails_77e550699e"
    t.index ["person_id"], name: "fk_rails_f4abb8c16f"
    t.index ["voided_by"], name: "fk_rails_eb39572019"
  end

  create_table "person_attribute_type", primary_key: "person_attribute_type_id", id: :bigint, default: nil, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", limit: 50, default: "", null: false
    t.text "description"
    t.string "format", limit: 50
    t.bigint "foreign_key"
    t.boolean "searchable", default: false, null: false
    t.bigint "creator", default: 0, null: false
    t.datetime "date_created", precision: nil, default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.bigint "changed_by"
    t.datetime "date_changed", precision: nil
    t.boolean "retired", default: false, null: false
    t.bigint "retired_by"
    t.datetime "date_retired", precision: nil
    t.string "retire_reason"
    t.string "edit_privilege"
    t.string "uuid", limit: 38, null: false
    t.float "sort_weight", limit: 53
    t.index ["changed_by"], name: "fk_rails_1d26f8eec5"
    t.index ["creator"], name: "fk_rails_2e7c89c37e"
    t.index ["edit_privilege"], name: "fk_rails_bc5218dd52"
    t.index ["retired_by"], name: "fk_rails_b4f46d919f"
  end

  create_table "person_merge_log", primary_key: "person_merge_log_id", id: :bigint, default: nil, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "winner_person_id", null: false
    t.bigint "loser_person_id", null: false
    t.bigint "creator", null: false
    t.datetime "date_created", precision: nil, null: false
    t.text "merged_data", size: :long, null: false
    t.string "uuid", limit: 38, null: false
    t.bigint "changed_by"
    t.datetime "date_changed", precision: nil
    t.boolean "voided", default: false, null: false
    t.bigint "voided_by"
    t.datetime "date_voided", precision: nil
    t.string "void_reason"
    t.index ["changed_by"], name: "fk_rails_e5615f0634"
    t.index ["creator"], name: "fk_rails_81a9b29b2a"
    t.index ["loser_person_id"], name: "fk_rails_e9e70461e4"
    t.index ["voided_by"], name: "fk_rails_69890d00de"
    t.index ["winner_person_id"], name: "fk_rails_0ca3f3c7ae"
  end

  create_table "person_name", primary_key: "person_name_id", id: :bigint, default: nil, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.boolean "preferred", default: false, null: false
    t.bigint "person_id", null: false
    t.string "prefix", limit: 50
    t.string "given_name", limit: 50
    t.string "middle_name", limit: 50
    t.string "family_name_prefix", limit: 50
    t.string "family_name", limit: 50
    t.string "family_name2", limit: 50
    t.string "family_name_suffix", limit: 50
    t.string "degree", limit: 50
    t.bigint "creator", default: 0, null: false
    t.datetime "date_created", precision: nil, default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.boolean "voided", default: false, null: false
    t.bigint "voided_by"
    t.datetime "date_voided", precision: nil
    t.string "void_reason"
    t.bigint "changed_by"
    t.datetime "date_changed", precision: nil
    t.string "uuid", limit: 38, null: false
    t.index ["creator"], name: "fk_rails_73f530aae0"
    t.index ["person_id"], name: "fk_rails_1ab836ddf4"
    t.index ["voided_by"], name: "fk_rails_c7e603bc4b"
  end

  create_table "privilege", primary_key: "privilege", id: :string, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.text "description"
    t.string "uuid", limit: 38, null: false
  end

  create_table "program", primary_key: "program_id", id: :bigint, default: nil, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "concept_id", default: 0, null: false
    t.bigint "creator", default: 0, null: false
    t.datetime "date_created", precision: nil, default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.bigint "changed_by"
    t.datetime "date_changed", precision: nil
    t.boolean "retired", default: false, null: false
    t.string "name", limit: 50, null: false
    t.text "description"
    t.string "uuid", limit: 38, null: false
    t.bigint "outcomes_concept_id"
    t.index ["changed_by"], name: "fk_rails_4c59e6d352"
    t.index ["concept_id"], name: "fk_rails_26f33988c0"
    t.index ["creator"], name: "fk_rails_4e262a3906"
    t.index ["outcomes_concept_id"], name: "fk_rails_2a2a7645c3"
  end

  create_table "program_attribute_type", primary_key: "program_attribute_type_id", id: :bigint, default: nil, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.string "description", limit: 1024
    t.string "datatype"
    t.text "datatype_config"
    t.string "preferred_handler"
    t.text "handler_config"
    t.bigint "min_occurs", null: false
    t.bigint "max_occurs"
    t.bigint "creator", null: false
    t.datetime "date_created", precision: nil, null: false
    t.bigint "changed_by"
    t.datetime "date_changed", precision: nil
    t.boolean "retired", default: false, null: false
    t.bigint "retired_by"
    t.datetime "date_retired", precision: nil
    t.string "retire_reason"
    t.string "uuid", limit: 38, null: false
    t.index ["changed_by"], name: "fk_rails_fdcbccdea8"
    t.index ["creator"], name: "fk_rails_356a5b887c"
    t.index ["retired_by"], name: "fk_rails_23d3487f36"
  end

  create_table "program_workflow", primary_key: "program_workflow_id", id: :bigint, default: nil, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "program_id", default: 0, null: false
    t.bigint "concept_id", default: 0, null: false
    t.bigint "creator", default: 0, null: false
    t.datetime "date_created", precision: nil, default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.boolean "retired", default: false, null: false
    t.bigint "changed_by"
    t.datetime "date_changed", precision: nil
    t.string "uuid", limit: 38, null: false
    t.index ["changed_by"], name: "fk_rails_276ac0f35c"
    t.index ["concept_id"], name: "fk_rails_827395a831"
    t.index ["creator"], name: "fk_rails_6f7263f556"
    t.index ["program_id"], name: "fk_rails_2a25ae0f9f"
  end

  create_table "program_workflow_state", primary_key: "program_workflow_state_id", id: :bigint, default: nil, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "program_workflow_id", default: 0, null: false
    t.bigint "concept_id", default: 0, null: false
    t.boolean "initial", default: false, null: false
    t.boolean "terminal", default: false, null: false
    t.bigint "creator", default: 0, null: false
    t.datetime "date_created", precision: nil, default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.boolean "retired", default: false, null: false
    t.bigint "changed_by"
    t.datetime "date_changed", precision: nil
    t.string "uuid", limit: 38, null: false
    t.index ["changed_by"], name: "fk_rails_2f1d1c1144"
    t.index ["concept_id"], name: "fk_rails_6317dc570a"
    t.index ["creator"], name: "fk_rails_916df58b8b"
    t.index ["program_workflow_id"], name: "fk_rails_1f136e3a61"
  end

  create_table "provider", primary_key: "provider_id", id: :bigint, default: nil, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "person_id"
    t.string "name"
    t.string "identifier"
    t.bigint "creator", null: false
    t.datetime "date_created", precision: nil, null: false
    t.bigint "changed_by"
    t.datetime "date_changed", precision: nil
    t.boolean "retired", default: false, null: false
    t.bigint "retired_by"
    t.datetime "date_retired", precision: nil
    t.string "retire_reason"
    t.string "uuid", limit: 38, null: false
    t.bigint "role_id"
    t.bigint "speciality_id"
    t.index ["changed_by"], name: "fk_rails_525d98b6d7"
    t.index ["creator"], name: "fk_rails_122a660e9d"
    t.index ["person_id"], name: "fk_rails_f8bfd9b2bf"
    t.index ["retired_by"], name: "fk_rails_d43283236f"
    t.index ["role_id"], name: "fk_rails_afc495e310"
    t.index ["speciality_id"], name: "fk_rails_e8ef66c274"
  end

  create_table "provider_attribute", primary_key: "provider_attribute_id", id: :bigint, default: nil, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "provider_id", null: false
    t.bigint "attribute_type_id", null: false
    t.text "value_reference", null: false
    t.string "uuid", limit: 38, null: false
    t.bigint "creator", null: false
    t.datetime "date_created", precision: nil, null: false
    t.bigint "changed_by"
    t.datetime "date_changed", precision: nil
    t.boolean "voided", default: false, null: false
    t.bigint "voided_by"
    t.datetime "date_voided", precision: nil
    t.string "void_reason"
    t.index ["attribute_type_id"], name: "fk_rails_255f6129b0"
    t.index ["changed_by"], name: "fk_rails_87d12867e2"
    t.index ["creator"], name: "fk_rails_379eb25a7d"
    t.index ["provider_id"], name: "fk_rails_7c0ebea51b"
    t.index ["voided_by"], name: "fk_rails_ea19d95c09"
  end

  create_table "provider_attribute_type", primary_key: "provider_attribute_type_id", id: :bigint, default: nil, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.string "description", limit: 1024
    t.string "datatype"
    t.text "datatype_config"
    t.string "preferred_handler"
    t.text "handler_config"
    t.bigint "min_occurs", null: false
    t.bigint "max_occurs"
    t.bigint "creator", null: false
    t.datetime "date_created", precision: nil, null: false
    t.bigint "changed_by"
    t.datetime "date_changed", precision: nil
    t.boolean "retired", default: false, null: false
    t.bigint "retired_by"
    t.datetime "date_retired", precision: nil
    t.string "retire_reason"
    t.string "uuid", limit: 38, null: false
    t.index ["changed_by"], name: "fk_rails_4fa6adffa7"
    t.index ["creator"], name: "fk_rails_27557119d0"
    t.index ["retired_by"], name: "fk_rails_18828de3ec"
  end

  create_table "relationship", primary_key: "relationship_id", id: :bigint, default: nil, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "person_a", null: false
    t.bigint "relationship", default: 0, null: false
    t.bigint "person_b", null: false
    t.bigint "creator", default: 0, null: false
    t.datetime "date_created", precision: nil, default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.boolean "voided", default: false, null: false
    t.bigint "voided_by"
    t.datetime "date_voided", precision: nil
    t.string "void_reason"
    t.string "uuid", limit: 38, null: false
    t.datetime "date_changed", precision: nil
    t.bigint "changed_by"
    t.datetime "start_date", precision: nil
    t.datetime "end_date", precision: nil
    t.index ["changed_by"], name: "fk_rails_b3f00e2bd5"
    t.index ["creator"], name: "fk_rails_60aab55b8e"
    t.index ["person_a"], name: "fk_rails_986529a426"
    t.index ["person_b"], name: "fk_rails_2c1242bff5"
    t.index ["relationship"], name: "fk_rails_20cdac4cb4"
    t.index ["voided_by"], name: "fk_rails_2c5e68137f"
  end

  create_table "relationship_type", primary_key: "relationship_type_id", id: :bigint, default: nil, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "a_is_to_b", limit: 50, null: false
    t.string "b_is_to_a", limit: 50, null: false
    t.bigint "preferred", default: 0, null: false
    t.bigint "weight", default: 0, null: false
    t.string "description"
    t.bigint "creator", default: 0, null: false
    t.datetime "date_created", precision: nil, default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string "uuid", limit: 38, null: false
    t.boolean "retired", default: false, null: false
    t.bigint "retired_by"
    t.datetime "date_retired", precision: nil
    t.string "retire_reason"
    t.datetime "date_changed", precision: nil
    t.bigint "changed_by"
    t.index ["changed_by"], name: "fk_rails_7c656f0bae"
    t.index ["creator"], name: "fk_rails_766a26d61b"
    t.index ["retired_by"], name: "fk_rails_c9866cb0b8"
  end

  create_table "report_object", primary_key: "report_object_id", id: :bigint, default: nil, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.string "description", limit: 1000
    t.string "report_object_type", null: false
    t.string "report_object_sub_type", null: false
    t.text "xml_data"
    t.bigint "creator", null: false
    t.datetime "date_created", precision: nil, null: false
    t.bigint "changed_by"
    t.datetime "date_changed", precision: nil
    t.boolean "voided", default: false, null: false
    t.bigint "voided_by"
    t.datetime "date_voided", precision: nil
    t.string "void_reason"
    t.string "uuid", limit: 38, null: false
    t.index ["changed_by"], name: "fk_rails_ebff13989d"
    t.index ["creator"], name: "fk_rails_37e6399793"
    t.index ["voided_by"], name: "fk_rails_0b59f25b7e"
  end

  create_table "report_schema_xml", primary_key: "report_schema_id", id: :bigint, default: nil, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.text "description", null: false
    t.text "xml_data", size: :medium, null: false
    t.string "uuid", limit: 38, null: false
  end

  create_table "reporting_report_design", id: :bigint, default: nil, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "uuid", limit: 38, null: false
    t.string "name", null: false
    t.string "description", limit: 1000
    t.bigint "report_definition_id", default: 0, null: false
    t.string "renderer_type", null: false
    t.text "properties"
    t.bigint "creator", default: 0, null: false
    t.datetime "date_created", precision: nil, default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.bigint "changed_by"
    t.datetime "date_changed", precision: nil
    t.boolean "retired", default: false, null: false
    t.bigint "retired_by"
    t.datetime "date_retired", precision: nil
    t.string "retire_reason"
    t.index ["changed_by"], name: "fk_rails_175110352f"
    t.index ["creator"], name: "fk_rails_a382cb02d2"
    t.index ["report_definition_id"], name: "fk_rails_755e8628eb"
    t.index ["retired_by"], name: "fk_rails_3d73dd32ac"
  end

  create_table "reporting_report_design_resource", id: :bigint, default: nil, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "uuid", limit: 38, null: false
    t.string "name", null: false
    t.string "description", limit: 1000
    t.bigint "report_design_id", default: 0, null: false
    t.string "content_type", limit: 50
    t.string "extension", limit: 20
    t.binary "contents", size: :long
    t.bigint "creator", default: 0, null: false
    t.datetime "date_created", precision: nil, default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.bigint "changed_by"
    t.datetime "date_changed", precision: nil
    t.boolean "retired", default: false, null: false
    t.bigint "retired_by"
    t.datetime "date_retired", precision: nil
    t.string "retire_reason"
    t.index ["changed_by"], name: "fk_rails_225f1eac3b"
    t.index ["creator"], name: "fk_rails_d95cf01516"
    t.index ["report_design_id"], name: "fk_rails_3ac59593ea"
    t.index ["retired_by"], name: "fk_rails_872128ffb0"
  end

  create_table "reporting_report_request", id: :bigint, default: nil, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "uuid", limit: 38, null: false
    t.string "base_cohort_uuid", limit: 38
    t.text "base_cohort_parameters"
    t.string "report_definition_uuid", limit: 38, null: false
    t.text "report_definition_parameters"
    t.string "renderer_type", null: false
    t.string "renderer_argument"
    t.bigint "requested_by", default: 0, null: false
    t.datetime "request_datetime", precision: nil, default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string "priority", null: false
    t.string "status", null: false
    t.datetime "evaluation_start_datetime", precision: nil
    t.datetime "evaluation_complete_datetime", precision: nil
    t.datetime "render_complete_datetime", precision: nil
    t.string "description", limit: 1000
    t.index ["requested_by"], name: "fk_rails_3ac0c60286"
  end

  create_table "role", primary_key: "role", id: { type: :string, limit: 50, default: "" }, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "description"
    t.string "uuid", limit: 38, null: false
  end

  create_table "role_privilege", id: false, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "role", limit: 50, default: "", null: false
    t.string "privilege", null: false
    t.index ["privilege", "role"], name: "index_role_privilege_on_privilege_and_role", unique: true
    t.index ["role"], name: "fk_rails_9b793b57fe"
  end

  create_table "role_role", id: false, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "parent_role", limit: 50, default: "", null: false
    t.string "child_role", default: "", null: false
    t.index ["child_role"], name: "fk_rails_ae60fd244a"
    t.index ["parent_role", "child_role"], name: "index_role_role_on_parent_role_and_child_role", unique: true
  end

  create_table "room_temperature", primary_key: "room_temperature_id", id: :bigint, default: nil, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.datetime "time", precision: nil, null: false
    t.bigint "temp", null: false
    t.string "uuid", limit: 38, null: false
  end

  create_table "scheduler_task_config", primary_key: "task_config_id", id: :bigint, default: nil, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.string "description", limit: 1024
    t.text "schedulable_class"
    t.datetime "start_time", precision: nil
    t.string "start_time_pattern", limit: 50
    t.bigint "repeat_interval", default: 0, null: false
    t.bigint "start_on_startup", default: 0, null: false
    t.bigint "started", default: 0, null: false
    t.bigint "created_by", default: 0
    t.datetime "date_created", precision: nil, default: -> { "CURRENT_TIMESTAMP" }
    t.bigint "changed_by"
    t.datetime "date_changed", precision: nil
    t.string "uuid", limit: 38, null: false
    t.datetime "last_execution_time", precision: nil
    t.index ["changed_by"], name: "fk_rails_9503734d39"
    t.index ["created_by"], name: "fk_rails_cda39bb3c1"
  end

  create_table "scheduler_task_config_property", primary_key: "task_config_property_id", id: :bigint, default: nil, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.text "value"
    t.bigint "task_config_id"
    t.index ["task_config_id"], name: "fk_rails_b80ac9481b"
  end

  create_table "serialized_object", primary_key: "serialized_object_id", id: :bigint, default: nil, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.string "description", limit: 5000
    t.string "type", null: false
    t.string "subtype", null: false
    t.string "serialization_class", null: false
    t.text "serialized_data", size: :medium, null: false
    t.datetime "date_created", precision: nil, null: false
    t.bigint "creator", null: false
    t.datetime "date_changed", precision: nil
    t.bigint "changed_by"
    t.boolean "retired", default: false, null: false
    t.datetime "date_retired", precision: nil
    t.bigint "retired_by"
    t.string "retire_reason", limit: 1000
    t.string "uuid", limit: 38, null: false
    t.index ["changed_by"], name: "fk_rails_034f0a1caf"
    t.index ["creator"], name: "fk_rails_dfcc7c44c9"
    t.index ["retired_by"], name: "fk_rails_e1e5634e84"
  end

  create_table "test_order", primary_key: "order_id", id: :bigint, default: 0, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "specimen_source"
    t.string "laterality", limit: 20
    t.text "clinical_history"
    t.bigint "frequency"
    t.bigint "number_of_repeats"
    t.index ["frequency"], name: "fk_rails_f176dfe487"
    t.index ["specimen_source"], name: "fk_rails_2ce60abca3"
  end

  create_table "tribe", primary_key: "tribe_id", id: :bigint, default: nil, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.boolean "retired", default: false, null: false
    t.string "name", limit: 50, default: "", null: false
  end

  create_table "user_property", id: false, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "user_id", default: 0, null: false
    t.string "property", limit: 100, default: "", null: false
    t.string "property_value", default: "", null: false
    t.index ["user_id", "property"], name: "index_user_property_on_user_id_and_property", unique: true
  end

  create_table "user_role", id: false, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "user_id", default: 0, null: false
    t.string "role", limit: 50, default: "", null: false
    t.index ["role", "user_id"], name: "index_user_role_on_role_and_user_id", unique: true
    t.index ["user_id"], name: "fk_rails_110a93bb80"
  end

  create_table "users", primary_key: "user_id", id: :bigint, default: nil, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "system_id", limit: 50, default: "", null: false
    t.string "username", limit: 50
    t.string "password", limit: 128
    t.string "salt", limit: 128
    t.string "secret_question"
    t.string "secret_answer"
    t.bigint "creator", default: 0, null: false
    t.datetime "date_created", precision: nil, default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.bigint "changed_by"
    t.datetime "date_changed", precision: nil
    t.bigint "person_id", null: false
    t.boolean "retired", default: false, null: false
    t.bigint "retired_by"
    t.datetime "date_retired", precision: nil
    t.string "retire_reason"
    t.string "uuid", limit: 38, null: false
    t.string "activation_key"
    t.string "email"
    t.index ["changed_by"], name: "fk_rails_2b5948ae3b"
    t.index ["creator"], name: "fk_rails_fd256d8564"
    t.index ["person_id"], name: "fk_rails_fa67535741"
    t.index ["retired_by"], name: "fk_rails_1a80c1c317"
  end

  create_table "visit", primary_key: "visit_id", id: :bigint, default: nil, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "patient_id", null: false
    t.bigint "visit_type_id", null: false
    t.datetime "date_started", precision: nil, null: false
    t.datetime "date_stopped", precision: nil
    t.bigint "indication_concept_id"
    t.bigint "location_id"
    t.bigint "creator", null: false
    t.datetime "date_created", precision: nil, null: false
    t.bigint "changed_by"
    t.datetime "date_changed", precision: nil
    t.boolean "voided", default: false, null: false
    t.bigint "voided_by"
    t.datetime "date_voided", precision: nil
    t.string "void_reason"
    t.string "uuid", limit: 38, null: false
    t.index ["changed_by"], name: "fk_rails_a496173fc2"
    t.index ["creator"], name: "fk_rails_a1f67b7ff2"
    t.index ["indication_concept_id"], name: "fk_rails_8b0be4a56e"
    t.index ["location_id"], name: "fk_rails_3bfd15f321"
    t.index ["patient_id"], name: "fk_rails_eb98da7293"
    t.index ["visit_type_id"], name: "fk_rails_c95796b732"
    t.index ["voided_by"], name: "fk_rails_011dd6de27"
  end

  create_table "visit_attribute", primary_key: "visit_attribute_id", id: :bigint, default: nil, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "visit_id", null: false
    t.bigint "attribute_type_id", null: false
    t.text "value_reference", null: false
    t.string "uuid", limit: 38, null: false
    t.bigint "creator", null: false
    t.datetime "date_created", precision: nil, null: false
    t.bigint "changed_by"
    t.datetime "date_changed", precision: nil
    t.boolean "voided", default: false, null: false
    t.bigint "voided_by"
    t.datetime "date_voided", precision: nil
    t.string "void_reason"
    t.index ["attribute_type_id"], name: "fk_rails_3befd9866d"
    t.index ["changed_by"], name: "fk_rails_8142223796"
    t.index ["creator"], name: "fk_rails_5590e34c96"
    t.index ["visit_id"], name: "fk_rails_4f0fcd42e4"
    t.index ["voided_by"], name: "fk_rails_affb1c0994"
  end

  create_table "visit_attribute_type", primary_key: "visit_attribute_type_id", id: :bigint, default: nil, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.string "description", limit: 1024
    t.string "datatype"
    t.text "datatype_config"
    t.string "preferred_handler"
    t.text "handler_config"
    t.bigint "min_occurs", null: false
    t.bigint "max_occurs"
    t.bigint "creator", null: false
    t.datetime "date_created", precision: nil, null: false
    t.bigint "changed_by"
    t.datetime "date_changed", precision: nil
    t.boolean "retired", default: false, null: false
    t.bigint "retired_by"
    t.datetime "date_retired", precision: nil
    t.string "retire_reason"
    t.string "uuid", limit: 38, null: false
    t.index ["changed_by"], name: "fk_rails_2aca067745"
    t.index ["creator"], name: "fk_rails_4e8b204823"
    t.index ["retired_by"], name: "fk_rails_8aba0056e6"
  end

  create_table "visit_type", primary_key: "visit_type_id", id: :bigint, default: nil, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.string "description", limit: 1024
    t.string "uuid", limit: 38, null: false
    t.bigint "creator", null: false
    t.datetime "date_created", precision: nil, null: false
    t.bigint "changed_by"
    t.datetime "date_changed", precision: nil
    t.bigint "retired", default: 0, null: false
    t.bigint "retired_by"
    t.datetime "date_retired", precision: nil
    t.string "retire_reason"
    t.index ["changed_by"], name: "fk_rails_cbbe2016cc"
    t.index ["creator"], name: "fk_rails_ce7f875c6c"
    t.index ["retired_by"], name: "fk_rails_df8447ea86"
  end

  create_table "xforms_medical_history_field", primary_key: "field_id", id: :bigint, default: nil, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "tabIndex"
  end

  create_table "xforms_person_repeat_attribute", primary_key: "person_repeat_attribute_id", id: :bigint, default: nil, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "person_id", default: 0, null: false
    t.string "value", limit: 50, default: "", null: false
    t.bigint "person_attribute_type_id", default: 0, null: false
    t.bigint "value_id", default: 0, null: false
    t.bigint "value_id_type", default: 0, null: false
    t.bigint "value_display_order", default: 0, null: false
    t.bigint "creator", default: 0, null: false
    t.datetime "date_created", precision: nil, default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.bigint "changed_by"
    t.datetime "date_changed", precision: nil
    t.boolean "voided", default: false, null: false
    t.bigint "voided_by"
    t.datetime "date_voided", precision: nil
    t.string "void_reason"
    t.index ["changed_by"], name: "fk_rails_3d991c4b24"
    t.index ["creator"], name: "fk_rails_50c193acc7"
    t.index ["person_attribute_type_id"], name: "fk_rails_e670ee0ce7"
    t.index ["person_id"], name: "fk_rails_356b38b58d"
    t.index ["voided_by"], name: "fk_rails_a0d047a9e4"
  end

  create_table "xforms_xform", primary_key: "form_id", id: :bigint, default: nil, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.text "xform_xml", size: :long
    t.text "layout_xml", size: :long
    t.bigint "creator", default: 0, null: false
    t.datetime "date_created", precision: nil, default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.bigint "changed_by"
    t.datetime "date_changed", precision: nil
    t.text "locale_xml", size: :long
    t.text "javascript_src", size: :long
    t.index ["changed_by"], name: "fk_rails_923b01d922"
    t.index ["creator"], name: "fk_rails_bf229b6226"
  end

  add_foreign_key "allergy", "concept", column: "coded_allergen", primary_key: "concept_id"
  add_foreign_key "allergy", "concept", column: "severity_concept_id", primary_key: "concept_id"
  add_foreign_key "allergy", "patient", primary_key: "patient_id"
  add_foreign_key "allergy", "users", column: "changed_by", primary_key: "user_id"
  add_foreign_key "allergy", "users", column: "creator", primary_key: "user_id"
  add_foreign_key "allergy", "users", column: "voided_by", primary_key: "user_id"
  add_foreign_key "allergy_reaction", "allergy", primary_key: "allergy_id"
  add_foreign_key "allergy_reaction", "concept", column: "reaction_concept_id", primary_key: "concept_id"
  add_foreign_key "care_setting", "users", column: "changed_by", primary_key: "user_id"
  add_foreign_key "care_setting", "users", column: "creator", primary_key: "user_id"
  add_foreign_key "care_setting", "users", column: "retired_by", primary_key: "user_id"
  add_foreign_key "cohort", "users", column: "changed_by", primary_key: "user_id"
  add_foreign_key "cohort", "users", column: "creator", primary_key: "user_id"
  add_foreign_key "cohort", "users", column: "voided_by", primary_key: "user_id"
  add_foreign_key "cohort_member", "cohort", primary_key: "cohort_id"
  add_foreign_key "cohort_member", "patient", primary_key: "patient_id"
  add_foreign_key "cohort_member", "users", column: "creator", primary_key: "user_id"
  add_foreign_key "concept", "concept_class", column: "class_id", primary_key: "concept_class_id"
  add_foreign_key "concept", "concept_datatype", column: "datatype_id", primary_key: "concept_datatype_id"
  add_foreign_key "concept", "users", column: "changed_by", primary_key: "user_id"
  add_foreign_key "concept", "users", column: "creator", primary_key: "user_id"
  add_foreign_key "concept", "users", column: "retired_by", primary_key: "user_id"
  add_foreign_key "concept_answer", "concept", column: "answer_concept", primary_key: "concept_id"
  add_foreign_key "concept_answer", "concept", primary_key: "concept_id"
  add_foreign_key "concept_answer", "drug", column: "answer_drug", primary_key: "drug_id"
  add_foreign_key "concept_answer", "users", column: "creator", primary_key: "user_id"
  add_foreign_key "concept_attribute", "concept", primary_key: "concept_id"
  add_foreign_key "concept_attribute", "concept_attribute_type", column: "attribute_type_id", primary_key: "concept_attribute_type_id"
  add_foreign_key "concept_attribute", "users", column: "changed_by", primary_key: "user_id"
  add_foreign_key "concept_attribute", "users", column: "creator", primary_key: "user_id"
  add_foreign_key "concept_attribute", "users", column: "voided_by", primary_key: "user_id"
  add_foreign_key "concept_attribute_type", "users", column: "changed_by", primary_key: "user_id"
  add_foreign_key "concept_attribute_type", "users", column: "creator", primary_key: "user_id"
  add_foreign_key "concept_attribute_type", "users", column: "retired_by", primary_key: "user_id"
  add_foreign_key "concept_class", "users", column: "changed_by", primary_key: "user_id"
  add_foreign_key "concept_class", "users", column: "creator", primary_key: "user_id"
  add_foreign_key "concept_class", "users", column: "retired_by", primary_key: "user_id"
  add_foreign_key "concept_complex", "concept", primary_key: "concept_id"
  add_foreign_key "concept_datatype", "users", column: "creator", primary_key: "user_id"
  add_foreign_key "concept_datatype", "users", column: "retired_by", primary_key: "user_id"
  add_foreign_key "concept_description", "concept", primary_key: "concept_id"
  add_foreign_key "concept_description", "users", column: "changed_by", primary_key: "user_id"
  add_foreign_key "concept_description", "users", column: "creator", primary_key: "user_id"
  add_foreign_key "concept_map_type", "users", column: "changed_by", primary_key: "user_id"
  add_foreign_key "concept_map_type", "users", column: "creator", primary_key: "user_id"
  add_foreign_key "concept_map_type", "users", column: "retired_by", primary_key: "user_id"
  add_foreign_key "concept_name", "concept", primary_key: "concept_id"
  add_foreign_key "concept_name", "users", column: "changed_by", primary_key: "user_id"
  add_foreign_key "concept_name", "users", column: "creator", primary_key: "user_id"
  add_foreign_key "concept_name", "users", column: "voided_by", primary_key: "user_id"
  add_foreign_key "concept_name_tag", "users", column: "changed_by", primary_key: "user_id"
  add_foreign_key "concept_name_tag_map", "concept_name", primary_key: "concept_name_id"
  add_foreign_key "concept_name_tag_map", "concept_name_tag", primary_key: "concept_name_tag_id"
  add_foreign_key "concept_numeric", "concept", primary_key: "concept_id"
  add_foreign_key "concept_proposal", "concept", column: "obs_concept_id", primary_key: "concept_id"
  add_foreign_key "concept_proposal", "concept", primary_key: "concept_id"
  add_foreign_key "concept_proposal", "encounter", primary_key: "encounter_id"
  add_foreign_key "concept_proposal", "obs", column: "obs_id", primary_key: "obs_id"
  add_foreign_key "concept_proposal", "users", column: "changed_by", primary_key: "user_id"
  add_foreign_key "concept_proposal", "users", column: "creator", primary_key: "user_id"
  add_foreign_key "concept_proposal_tag_map", "concept_name_tag", primary_key: "concept_name_tag_id"
  add_foreign_key "concept_proposal_tag_map", "concept_proposal", primary_key: "concept_proposal_id"
  add_foreign_key "concept_reference_map", "concept", primary_key: "concept_id"
  add_foreign_key "concept_reference_map", "concept_map_type", primary_key: "concept_map_type_id"
  add_foreign_key "concept_reference_map", "concept_reference_term", primary_key: "concept_reference_term_id"
  add_foreign_key "concept_reference_map", "users", column: "changed_by", primary_key: "user_id"
  add_foreign_key "concept_reference_map", "users", column: "creator", primary_key: "user_id"
  add_foreign_key "concept_reference_source", "users", column: "changed_by", primary_key: "user_id"
  add_foreign_key "concept_reference_source", "users", column: "creator", primary_key: "user_id"
  add_foreign_key "concept_reference_source", "users", column: "retired_by", primary_key: "user_id"
  add_foreign_key "concept_reference_term", "concept_reference_source", column: "concept_source_id", primary_key: "concept_source_id"
  add_foreign_key "concept_reference_term", "users", column: "changed_by", primary_key: "user_id"
  add_foreign_key "concept_reference_term", "users", column: "creator", primary_key: "user_id"
  add_foreign_key "concept_reference_term", "users", column: "retired_by", primary_key: "user_id"
  add_foreign_key "concept_reference_term_map", "concept_map_type", column: "a_is_to_b_id", primary_key: "concept_map_type_id"
  add_foreign_key "concept_reference_term_map", "concept_reference_term", column: "term_a_id", primary_key: "concept_reference_term_id"
  add_foreign_key "concept_reference_term_map", "concept_reference_term", column: "term_b_id", primary_key: "concept_reference_term_id"
  add_foreign_key "concept_reference_term_map", "users", column: "changed_by", primary_key: "user_id"
  add_foreign_key "concept_reference_term_map", "users", column: "creator", primary_key: "user_id"
  add_foreign_key "concept_set", "concept", column: "concept_set", primary_key: "concept_id"
  add_foreign_key "concept_set", "concept", primary_key: "concept_id"
  add_foreign_key "concept_set", "users", column: "creator", primary_key: "user_id"
  add_foreign_key "concept_state_conversion", "concept", primary_key: "concept_id"
  add_foreign_key "concept_state_conversion", "program_workflow", primary_key: "program_workflow_id"
  add_foreign_key "concept_state_conversion", "program_workflow_state", primary_key: "program_workflow_state_id"
  add_foreign_key "concept_word", "concept", primary_key: "concept_id"
  add_foreign_key "concept_word", "concept_name", primary_key: "concept_name_id"
  add_foreign_key "conditions", "concept", column: "condition_coded", primary_key: "concept_id"
  add_foreign_key "conditions", "concept_name", column: "condition_coded_name", primary_key: "concept_name_id"
  add_foreign_key "conditions", "conditions", column: "previous_version", primary_key: "condition_id"
  add_foreign_key "conditions", "patient", primary_key: "patient_id"
  add_foreign_key "conditions", "users", column: "changed_by", primary_key: "user_id"
  add_foreign_key "conditions", "users", column: "creator", primary_key: "user_id"
  add_foreign_key "conditions", "users", column: "voided_by", primary_key: "user_id"
  add_foreign_key "drug", "concept", column: "dosage_form", primary_key: "concept_id"
  add_foreign_key "drug", "concept", column: "route", primary_key: "concept_id"
  add_foreign_key "drug", "concept", primary_key: "concept_id"
  add_foreign_key "drug", "users", column: "changed_by", primary_key: "user_id"
  add_foreign_key "drug", "users", column: "creator", primary_key: "user_id"
  add_foreign_key "drug", "users", column: "retired_by", primary_key: "user_id"
  add_foreign_key "drug_ingredient", "concept", column: "ingredient_id", primary_key: "concept_id"
  add_foreign_key "drug_ingredient", "concept", column: "units", primary_key: "concept_id"
  add_foreign_key "drug_ingredient", "drug", primary_key: "drug_id"
  add_foreign_key "drug_order", "concept", column: "dose_units", primary_key: "concept_id"
  add_foreign_key "drug_order", "concept", column: "duration_units", primary_key: "concept_id"
  add_foreign_key "drug_order", "concept", column: "quantity_units", primary_key: "concept_id"
  add_foreign_key "drug_order", "concept", column: "route", primary_key: "concept_id"
  add_foreign_key "drug_order", "drug", column: "drug_inventory_id", primary_key: "drug_id"
  add_foreign_key "drug_order", "order_frequency", column: "frequency", primary_key: "order_frequency_id"
  add_foreign_key "drug_order", "orders", primary_key: "order_id"
  add_foreign_key "drug_reference_map", "concept_map_type", column: "concept_map_type", primary_key: "concept_map_type_id"
  add_foreign_key "drug_reference_map", "concept_reference_term", column: "term_id", primary_key: "concept_reference_term_id"
  add_foreign_key "drug_reference_map", "drug", primary_key: "drug_id"
  add_foreign_key "drug_reference_map", "users", column: "changed_by", primary_key: "user_id"
  add_foreign_key "drug_reference_map", "users", column: "creator", primary_key: "user_id"
  add_foreign_key "drug_reference_map", "users", column: "retired_by", primary_key: "user_id"
  add_foreign_key "encounter", "encounter_type", column: "encounter_type", primary_key: "encounter_type_id"
  add_foreign_key "encounter", "form", primary_key: "form_id"
  add_foreign_key "encounter", "location", primary_key: "location_id"
  add_foreign_key "encounter", "patient", primary_key: "patient_id"
  add_foreign_key "encounter", "users", column: "changed_by", primary_key: "user_id"
  add_foreign_key "encounter", "users", column: "creator", primary_key: "user_id"
  add_foreign_key "encounter", "users", column: "voided_by", primary_key: "user_id"
  add_foreign_key "encounter", "visit", primary_key: "visit_id"
  add_foreign_key "encounter_diagnosis", "concept", column: "diagnosis_coded", primary_key: "concept_id"
  add_foreign_key "encounter_diagnosis", "concept_name", column: "diagnosis_coded_name", primary_key: "concept_name_id"
  add_foreign_key "encounter_diagnosis", "conditions", primary_key: "condition_id"
  add_foreign_key "encounter_diagnosis", "encounter", primary_key: "encounter_id"
  add_foreign_key "encounter_diagnosis", "patient", primary_key: "patient_id"
  add_foreign_key "encounter_diagnosis", "users", column: "changed_by", primary_key: "user_id"
  add_foreign_key "encounter_diagnosis", "users", column: "creator", primary_key: "user_id"
  add_foreign_key "encounter_diagnosis", "users", column: "voided_by", primary_key: "user_id"
  add_foreign_key "encounter_provider", "encounter", primary_key: "encounter_id"
  add_foreign_key "encounter_provider", "encounter_role", primary_key: "encounter_role_id"
  add_foreign_key "encounter_provider", "provider", primary_key: "provider_id"
  add_foreign_key "encounter_provider", "users", column: "changed_by", primary_key: "user_id"
  add_foreign_key "encounter_provider", "users", column: "creator", primary_key: "user_id"
  add_foreign_key "encounter_provider", "users", column: "voided_by", primary_key: "user_id"
  add_foreign_key "encounter_role", "users", column: "changed_by", primary_key: "user_id"
  add_foreign_key "encounter_role", "users", column: "creator", primary_key: "user_id"
  add_foreign_key "encounter_role", "users", column: "retired_by", primary_key: "user_id"
  add_foreign_key "encounter_type", "privilege", column: "edit_privilege", primary_key: "privilege"
  add_foreign_key "encounter_type", "privilege", column: "view_privilege", primary_key: "privilege"
  add_foreign_key "encounter_type", "users", column: "changed_by", primary_key: "user_id"
  add_foreign_key "encounter_type", "users", column: "creator", primary_key: "user_id"
  add_foreign_key "encounter_type", "users", column: "retired_by", primary_key: "user_id"
  add_foreign_key "field", "concept", primary_key: "concept_id"
  add_foreign_key "field", "field_type", column: "field_type", primary_key: "field_type_id"
  add_foreign_key "field", "users", column: "changed_by", primary_key: "user_id"
  add_foreign_key "field", "users", column: "creator", primary_key: "user_id"
  add_foreign_key "field", "users", column: "retired_by", primary_key: "user_id"
  add_foreign_key "field_answer", "concept", column: "answer_id", primary_key: "concept_id"
  add_foreign_key "field_answer", "field", primary_key: "field_id"
  add_foreign_key "field_answer", "users", column: "creator", primary_key: "user_id"
  add_foreign_key "field_type", "users", column: "creator", primary_key: "user_id"
  add_foreign_key "form", "encounter_type", column: "encounter_type", primary_key: "encounter_type_id"
  add_foreign_key "form", "users", column: "changed_by", primary_key: "user_id"
  add_foreign_key "form", "users", column: "creator", primary_key: "user_id"
  add_foreign_key "form", "users", column: "retired_by", primary_key: "user_id"
  add_foreign_key "form_field", "field", primary_key: "field_id"
  add_foreign_key "form_field", "form", primary_key: "form_id"
  add_foreign_key "form_field", "form_field", column: "parent_form_field", primary_key: "form_field_id"
  add_foreign_key "form_field", "users", column: "changed_by", primary_key: "user_id"
  add_foreign_key "form_field", "users", column: "creator", primary_key: "user_id"
  add_foreign_key "form_resource", "form", primary_key: "form_id"
  add_foreign_key "form_resource", "users", column: "changed_by", primary_key: "user_id"
  add_foreign_key "formentry_archive", "users", column: "creator", primary_key: "user_id"
  add_foreign_key "formentry_error", "users", column: "creator", primary_key: "user_id"
  add_foreign_key "formentry_xsn", "form", primary_key: "form_id"
  add_foreign_key "formentry_xsn", "users", column: "archived_by", primary_key: "user_id"
  add_foreign_key "formentry_xsn", "users", column: "creator", primary_key: "user_id"
  add_foreign_key "global_property", "users", column: "changed_by", primary_key: "user_id"
  add_foreign_key "hl7_in_queue", "hl7_source", column: "hl7_source", primary_key: "hl7_source_id"
  add_foreign_key "hl7_source", "users", column: "creator", primary_key: "user_id"
  add_foreign_key "htmlformentry_html_form", "form", primary_key: "form_id"
  add_foreign_key "htmlformentry_html_form", "users", column: "changed_by", primary_key: "user_id"
  add_foreign_key "htmlformentry_html_form", "users", column: "creator", primary_key: "user_id"
  add_foreign_key "htmlformentry_html_form", "users", column: "retired_by", primary_key: "user_id"
  add_foreign_key "location", "location", column: "parent_location", primary_key: "location_id"
  add_foreign_key "location", "users", column: "changed_by", primary_key: "user_id"
  add_foreign_key "location", "users", column: "creator", primary_key: "user_id"
  add_foreign_key "location", "users", column: "retired_by", primary_key: "user_id"
  add_foreign_key "location_attribute", "location", primary_key: "location_id"
  add_foreign_key "location_attribute", "location_attribute_type", column: "attribute_type_id", primary_key: "location_attribute_type_id"
  add_foreign_key "location_attribute", "users", column: "changed_by", primary_key: "user_id"
  add_foreign_key "location_attribute", "users", column: "creator", primary_key: "user_id"
  add_foreign_key "location_attribute", "users", column: "voided_by", primary_key: "user_id"
  add_foreign_key "location_attribute_type", "users", column: "changed_by", primary_key: "user_id"
  add_foreign_key "location_attribute_type", "users", column: "creator", primary_key: "user_id"
  add_foreign_key "location_attribute_type", "users", column: "retired_by", primary_key: "user_id"
  add_foreign_key "location_tag", "users", column: "changed_by", primary_key: "user_id"
  add_foreign_key "location_tag", "users", column: "creator", primary_key: "user_id"
  add_foreign_key "location_tag", "users", column: "retired_by", primary_key: "user_id"
  add_foreign_key "location_tag_map", "location", primary_key: "location_id"
  add_foreign_key "location_tag_map", "location_tag", primary_key: "location_tag_id"
  add_foreign_key "logic_rule_definition", "users", column: "changed_by", primary_key: "user_id"
  add_foreign_key "logic_rule_definition", "users", column: "creator", primary_key: "user_id"
  add_foreign_key "logic_rule_definition", "users", column: "retired_by", primary_key: "user_id"
  add_foreign_key "logic_rule_token", "person", column: "changed_by", primary_key: "person_id"
  add_foreign_key "logic_rule_token", "person", column: "creator", primary_key: "person_id"
  add_foreign_key "logic_rule_token_tag", "logic_rule_token", primary_key: "logic_rule_token_id"
  add_foreign_key "logic_token_registration", "users", column: "changed_by", primary_key: "user_id"
  add_foreign_key "logic_token_registration", "users", column: "creator", primary_key: "user_id"
  add_foreign_key "logic_token_registration_tag", "logic_token_registration", column: "token_registration_id", primary_key: "token_registration_id"
  add_foreign_key "note", "encounter", primary_key: "encounter_id"
  add_foreign_key "note", "note", column: "parent", primary_key: "note_id"
  add_foreign_key "note", "obs", column: "obs_id", primary_key: "obs_id"
  add_foreign_key "note", "patient", primary_key: "patient_id"
  add_foreign_key "note", "users", column: "changed_by", primary_key: "user_id"
  add_foreign_key "note", "users", column: "creator", primary_key: "user_id"
  add_foreign_key "notification_alert", "users", column: "changed_by", primary_key: "user_id"
  add_foreign_key "notification_alert", "users", column: "creator", primary_key: "user_id"
  add_foreign_key "notification_alert_recipient", "notification_alert", column: "alert_id", primary_key: "alert_id"
  add_foreign_key "notification_alert_recipient", "users", primary_key: "user_id"
  add_foreign_key "obs", "concept", column: "value_coded", primary_key: "concept_id"
  add_foreign_key "obs", "concept", primary_key: "concept_id"
  add_foreign_key "obs", "concept_name", column: "value_coded_name_id", primary_key: "concept_name_id"
  add_foreign_key "obs", "drug", column: "value_drug", primary_key: "drug_id"
  add_foreign_key "obs", "encounter", primary_key: "encounter_id"
  add_foreign_key "obs", "location", primary_key: "location_id"
  add_foreign_key "obs", "obs", column: "obs_group_id", primary_key: "obs_id"
  add_foreign_key "obs", "obs", column: "previous_version", primary_key: "obs_id"
  add_foreign_key "obs", "orders", primary_key: "order_id"
  add_foreign_key "obs", "person", primary_key: "person_id"
  add_foreign_key "obs", "users", column: "creator", primary_key: "user_id"
  add_foreign_key "obs", "users", column: "voided_by", primary_key: "user_id"
  add_foreign_key "order_frequency", "concept", primary_key: "concept_id"
  add_foreign_key "order_frequency", "users", column: "changed_by", primary_key: "user_id"
  add_foreign_key "order_frequency", "users", column: "creator", primary_key: "user_id"
  add_foreign_key "order_frequency", "users", column: "retired_by", primary_key: "user_id"
  add_foreign_key "order_group", "encounter", primary_key: "encounter_id"
  add_foreign_key "order_group", "order_set", primary_key: "order_set_id"
  add_foreign_key "order_group", "patient", primary_key: "patient_id"
  add_foreign_key "order_group", "users", column: "changed_by", primary_key: "user_id"
  add_foreign_key "order_group", "users", column: "creator", primary_key: "user_id"
  add_foreign_key "order_group", "users", column: "voided_by", primary_key: "user_id"
  add_foreign_key "order_set", "users", column: "changed_by", primary_key: "user_id"
  add_foreign_key "order_set", "users", column: "creator", primary_key: "user_id"
  add_foreign_key "order_set", "users", column: "retired_by", primary_key: "user_id"
  add_foreign_key "order_set_member", "concept", primary_key: "concept_id"
  add_foreign_key "order_set_member", "order_set", primary_key: "order_set_id"
  add_foreign_key "order_set_member", "order_type", column: "order_type", primary_key: "order_type_id"
  add_foreign_key "order_set_member", "users", column: "changed_by", primary_key: "user_id"
  add_foreign_key "order_set_member", "users", column: "creator", primary_key: "user_id"
  add_foreign_key "order_set_member", "users", column: "retired_by", primary_key: "user_id"
  add_foreign_key "order_type", "order_type", column: "parent", primary_key: "order_type_id"
  add_foreign_key "order_type", "users", column: "changed_by", primary_key: "user_id"
  add_foreign_key "order_type", "users", column: "creator", primary_key: "user_id"
  add_foreign_key "order_type", "users", column: "retired_by", primary_key: "user_id"
  add_foreign_key "order_type_class_map", "concept_class", primary_key: "concept_class_id"
  add_foreign_key "order_type_class_map", "order_type", primary_key: "order_type_id"
  add_foreign_key "orders", "care_setting", column: "care_setting", primary_key: "care_setting_id"
  add_foreign_key "orders", "concept", column: "order_reason", primary_key: "concept_id"
  add_foreign_key "orders", "encounter", primary_key: "encounter_id"
  add_foreign_key "orders", "order_group", primary_key: "order_group_id"
  add_foreign_key "orders", "order_type", primary_key: "order_type_id"
  add_foreign_key "orders", "orders", column: "previous_order_id", primary_key: "order_id"
  add_foreign_key "orders", "patient", primary_key: "patient_id"
  add_foreign_key "orders", "provider", column: "orderer", primary_key: "provider_id"
  add_foreign_key "orders", "users", column: "creator", primary_key: "user_id"
  add_foreign_key "orders", "users", column: "voided_by", primary_key: "user_id"
  add_foreign_key "patient", "person", column: "patient_id", primary_key: "person_id"
  add_foreign_key "patient", "users", column: "changed_by", primary_key: "user_id"
  add_foreign_key "patient", "users", column: "creator", primary_key: "user_id"
  add_foreign_key "patient", "users", column: "voided_by", primary_key: "user_id"
  add_foreign_key "patient_identifier", "location", primary_key: "location_id"
  add_foreign_key "patient_identifier", "patient", primary_key: "patient_id"
  add_foreign_key "patient_identifier", "patient_identifier_type", column: "identifier_type", primary_key: "patient_identifier_type_id"
  add_foreign_key "patient_identifier", "users", column: "changed_by", primary_key: "user_id"
  add_foreign_key "patient_identifier", "users", column: "creator", primary_key: "user_id"
  add_foreign_key "patient_identifier", "users", column: "voided_by", primary_key: "user_id"
  add_foreign_key "patient_identifier_type", "users", column: "changed_by", primary_key: "user_id"
  add_foreign_key "patient_identifier_type", "users", column: "creator", primary_key: "user_id"
  add_foreign_key "patient_identifier_type", "users", column: "retired_by", primary_key: "user_id"
  add_foreign_key "patient_program", "concept", column: "outcome_concept_id", primary_key: "concept_id"
  add_foreign_key "patient_program", "location", primary_key: "location_id"
  add_foreign_key "patient_program", "patient", primary_key: "patient_id"
  add_foreign_key "patient_program", "program", primary_key: "program_id"
  add_foreign_key "patient_program", "users", column: "changed_by", primary_key: "user_id"
  add_foreign_key "patient_program", "users", column: "creator", primary_key: "user_id"
  add_foreign_key "patient_program", "users", column: "voided_by", primary_key: "user_id"
  add_foreign_key "patient_program_attribute", "patient_program", primary_key: "patient_program_id"
  add_foreign_key "patient_program_attribute", "program_attribute_type", column: "attribute_type_id", primary_key: "program_attribute_type_id"
  add_foreign_key "patient_program_attribute", "users", column: "changed_by", primary_key: "user_id"
  add_foreign_key "patient_program_attribute", "users", column: "creator", primary_key: "user_id"
  add_foreign_key "patient_program_attribute", "users", column: "voided_by", primary_key: "user_id"
  add_foreign_key "patient_state", "patient_program", primary_key: "patient_program_id"
  add_foreign_key "patient_state", "program_workflow_state", column: "state", primary_key: "program_workflow_state_id"
  add_foreign_key "patient_state", "users", column: "changed_by", primary_key: "user_id"
  add_foreign_key "patient_state", "users", column: "creator", primary_key: "user_id"
  add_foreign_key "patient_state", "users", column: "voided_by", primary_key: "user_id"
  add_foreign_key "person", "concept", column: "cause_of_death", primary_key: "concept_id"
  add_foreign_key "person", "users", column: "changed_by", primary_key: "user_id"
  add_foreign_key "person", "users", column: "creator", primary_key: "user_id"
  add_foreign_key "person", "users", column: "voided_by", primary_key: "user_id"
  add_foreign_key "person_address", "person", primary_key: "person_id"
  add_foreign_key "person_address", "users", column: "changed_by", primary_key: "user_id"
  add_foreign_key "person_address", "users", column: "creator", primary_key: "user_id"
  add_foreign_key "person_address", "users", column: "voided_by", primary_key: "user_id"
  add_foreign_key "person_attribute", "person", primary_key: "person_id"
  add_foreign_key "person_attribute", "person_attribute_type", primary_key: "person_attribute_type_id"
  add_foreign_key "person_attribute", "users", column: "changed_by", primary_key: "user_id"
  add_foreign_key "person_attribute", "users", column: "creator", primary_key: "user_id"
  add_foreign_key "person_attribute", "users", column: "voided_by", primary_key: "user_id"
  add_foreign_key "person_attribute_type", "privilege", column: "edit_privilege", primary_key: "privilege"
  add_foreign_key "person_attribute_type", "users", column: "changed_by", primary_key: "user_id"
  add_foreign_key "person_attribute_type", "users", column: "creator", primary_key: "user_id"
  add_foreign_key "person_attribute_type", "users", column: "retired_by", primary_key: "user_id"
  add_foreign_key "person_merge_log", "person", column: "loser_person_id", primary_key: "person_id"
  add_foreign_key "person_merge_log", "person", column: "winner_person_id", primary_key: "person_id"
  add_foreign_key "person_merge_log", "users", column: "changed_by", primary_key: "user_id"
  add_foreign_key "person_merge_log", "users", column: "creator", primary_key: "user_id"
  add_foreign_key "person_merge_log", "users", column: "voided_by", primary_key: "user_id"
  add_foreign_key "person_name", "person", primary_key: "person_id"
  add_foreign_key "person_name", "users", column: "creator", primary_key: "user_id"
  add_foreign_key "person_name", "users", column: "voided_by", primary_key: "user_id"
  add_foreign_key "program", "concept", column: "outcomes_concept_id", primary_key: "concept_id"
  add_foreign_key "program", "concept", primary_key: "concept_id"
  add_foreign_key "program", "users", column: "changed_by", primary_key: "user_id"
  add_foreign_key "program", "users", column: "creator", primary_key: "user_id"
  add_foreign_key "program_attribute_type", "users", column: "changed_by", primary_key: "user_id"
  add_foreign_key "program_attribute_type", "users", column: "creator", primary_key: "user_id"
  add_foreign_key "program_attribute_type", "users", column: "retired_by", primary_key: "user_id"
  add_foreign_key "program_workflow", "concept", primary_key: "concept_id"
  add_foreign_key "program_workflow", "program", primary_key: "program_id"
  add_foreign_key "program_workflow", "users", column: "changed_by", primary_key: "user_id"
  add_foreign_key "program_workflow", "users", column: "creator", primary_key: "user_id"
  add_foreign_key "program_workflow_state", "concept", primary_key: "concept_id"
  add_foreign_key "program_workflow_state", "program_workflow", primary_key: "program_workflow_id"
  add_foreign_key "program_workflow_state", "users", column: "changed_by", primary_key: "user_id"
  add_foreign_key "program_workflow_state", "users", column: "creator", primary_key: "user_id"
  add_foreign_key "provider", "concept", column: "role_id", primary_key: "concept_id"
  add_foreign_key "provider", "concept", column: "speciality_id", primary_key: "concept_id"
  add_foreign_key "provider", "person", primary_key: "person_id"
  add_foreign_key "provider", "users", column: "changed_by", primary_key: "user_id"
  add_foreign_key "provider", "users", column: "creator", primary_key: "user_id"
  add_foreign_key "provider", "users", column: "retired_by", primary_key: "user_id"
  add_foreign_key "provider_attribute", "provider", primary_key: "provider_id"
  add_foreign_key "provider_attribute", "provider_attribute_type", column: "attribute_type_id", primary_key: "provider_attribute_type_id"
  add_foreign_key "provider_attribute", "users", column: "changed_by", primary_key: "user_id"
  add_foreign_key "provider_attribute", "users", column: "creator", primary_key: "user_id"
  add_foreign_key "provider_attribute", "users", column: "voided_by", primary_key: "user_id"
  add_foreign_key "provider_attribute_type", "users", column: "changed_by", primary_key: "user_id"
  add_foreign_key "provider_attribute_type", "users", column: "creator", primary_key: "user_id"
  add_foreign_key "provider_attribute_type", "users", column: "retired_by", primary_key: "user_id"
  add_foreign_key "relationship", "person", column: "person_a", primary_key: "person_id"
  add_foreign_key "relationship", "person", column: "person_b", primary_key: "person_id"
  add_foreign_key "relationship", "relationship_type", column: "relationship", primary_key: "relationship_type_id"
  add_foreign_key "relationship", "users", column: "changed_by", primary_key: "user_id"
  add_foreign_key "relationship", "users", column: "creator", primary_key: "user_id"
  add_foreign_key "relationship", "users", column: "voided_by", primary_key: "user_id"
  add_foreign_key "relationship_type", "users", column: "changed_by", primary_key: "user_id"
  add_foreign_key "relationship_type", "users", column: "creator", primary_key: "user_id"
  add_foreign_key "relationship_type", "users", column: "retired_by", primary_key: "user_id"
  add_foreign_key "report_object", "users", column: "changed_by", primary_key: "user_id"
  add_foreign_key "report_object", "users", column: "creator", primary_key: "user_id"
  add_foreign_key "report_object", "users", column: "voided_by", primary_key: "user_id"
  add_foreign_key "reporting_report_design", "serialized_object", column: "report_definition_id", primary_key: "serialized_object_id"
  add_foreign_key "reporting_report_design", "users", column: "changed_by", primary_key: "user_id"
  add_foreign_key "reporting_report_design", "users", column: "creator", primary_key: "user_id"
  add_foreign_key "reporting_report_design", "users", column: "retired_by", primary_key: "user_id"
  add_foreign_key "reporting_report_design_resource", "reporting_report_design", column: "report_design_id"
  add_foreign_key "reporting_report_design_resource", "users", column: "changed_by", primary_key: "user_id"
  add_foreign_key "reporting_report_design_resource", "users", column: "creator", primary_key: "user_id"
  add_foreign_key "reporting_report_design_resource", "users", column: "retired_by", primary_key: "user_id"
  add_foreign_key "reporting_report_request", "users", column: "requested_by", primary_key: "user_id"
  add_foreign_key "role_privilege", "privilege", column: "privilege", primary_key: "privilege"
  add_foreign_key "role_privilege", "role", column: "role", primary_key: "role"
  add_foreign_key "role_role", "role", column: "child_role", primary_key: "role"
  add_foreign_key "role_role", "role", column: "parent_role", primary_key: "role"
  add_foreign_key "scheduler_task_config", "users", column: "changed_by", primary_key: "user_id"
  add_foreign_key "scheduler_task_config", "users", column: "created_by", primary_key: "user_id"
  add_foreign_key "scheduler_task_config_property", "scheduler_task_config", column: "task_config_id", primary_key: "task_config_id"
  add_foreign_key "serialized_object", "users", column: "changed_by", primary_key: "user_id"
  add_foreign_key "serialized_object", "users", column: "creator", primary_key: "user_id"
  add_foreign_key "serialized_object", "users", column: "retired_by", primary_key: "user_id"
  add_foreign_key "test_order", "concept", column: "specimen_source", primary_key: "concept_id"
  add_foreign_key "test_order", "order_frequency", column: "frequency", primary_key: "order_frequency_id"
  add_foreign_key "test_order", "orders", primary_key: "order_id"
  add_foreign_key "user_property", "users", primary_key: "user_id"
  add_foreign_key "user_role", "role", column: "role", primary_key: "role"
  add_foreign_key "user_role", "users", primary_key: "user_id"
  add_foreign_key "users", "person", primary_key: "person_id"
  add_foreign_key "users", "users", column: "changed_by", primary_key: "user_id"
  add_foreign_key "users", "users", column: "creator", primary_key: "user_id"
  add_foreign_key "users", "users", column: "retired_by", primary_key: "user_id"
  add_foreign_key "visit", "concept", column: "indication_concept_id", primary_key: "concept_id"
  add_foreign_key "visit", "location", primary_key: "location_id"
  add_foreign_key "visit", "patient", primary_key: "patient_id"
  add_foreign_key "visit", "users", column: "changed_by", primary_key: "user_id"
  add_foreign_key "visit", "users", column: "creator", primary_key: "user_id"
  add_foreign_key "visit", "users", column: "voided_by", primary_key: "user_id"
  add_foreign_key "visit", "visit_type", primary_key: "visit_type_id"
  add_foreign_key "visit_attribute", "users", column: "changed_by", primary_key: "user_id"
  add_foreign_key "visit_attribute", "users", column: "creator", primary_key: "user_id"
  add_foreign_key "visit_attribute", "users", column: "voided_by", primary_key: "user_id"
  add_foreign_key "visit_attribute", "visit", primary_key: "visit_id"
  add_foreign_key "visit_attribute", "visit_attribute_type", column: "attribute_type_id", primary_key: "visit_attribute_type_id"
  add_foreign_key "visit_attribute_type", "users", column: "changed_by", primary_key: "user_id"
  add_foreign_key "visit_attribute_type", "users", column: "creator", primary_key: "user_id"
  add_foreign_key "visit_attribute_type", "users", column: "retired_by", primary_key: "user_id"
  add_foreign_key "visit_type", "users", column: "changed_by", primary_key: "user_id"
  add_foreign_key "visit_type", "users", column: "creator", primary_key: "user_id"
  add_foreign_key "visit_type", "users", column: "retired_by", primary_key: "user_id"
  add_foreign_key "xforms_person_repeat_attribute", "person", primary_key: "person_id"
  add_foreign_key "xforms_person_repeat_attribute", "person_attribute_type", primary_key: "person_attribute_type_id"
  add_foreign_key "xforms_person_repeat_attribute", "users", column: "changed_by", primary_key: "user_id"
  add_foreign_key "xforms_person_repeat_attribute", "users", column: "creator", primary_key: "user_id"
  add_foreign_key "xforms_person_repeat_attribute", "users", column: "voided_by", primary_key: "user_id"
  add_foreign_key "xforms_xform", "users", column: "changed_by", primary_key: "user_id"
  add_foreign_key "xforms_xform", "users", column: "creator", primary_key: "user_id"
end
