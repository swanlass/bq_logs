connection: "bigquery"

# include: "/views/*.view.lkml"                # include all views in the views/ folder in this project
include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

explore: create_dev_user {
  description: "time to create a user and enter dev mode for the first time"
  join: enter_dev_mode {
    sql_on: ${create_dev_user.user_id} = ${enter_dev_mode.user_id} ;;
    type: left_outer
    relationship: one_to_many
  }
}

explore: enter_dev_mode {
  description: "time it took to enter dev mode"
}

explore: validate {
  description: "time to validate LookML"
}
