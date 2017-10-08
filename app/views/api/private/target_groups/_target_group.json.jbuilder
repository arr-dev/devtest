json.partial! "api/public/target_groups/target_group", target_group: target_group

json.extract! target_group, :secret_code, :external_id
