view: create_dev_user {
  sql_table_name: `looker-load-tests.lkr_dev_mode_create.run_googleapis_com_stdout` ;;


  measure: count {
    type: count
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}.jsonPayload.user_id ;;
  }

  dimension: event {
    type: string
    sql: ${TABLE}.jsonPayload.event ;;
  }

  # dimension: timestamp {
  #   type: string
  #   sql: ${TABLE}.jsonPayload.timestamp ;;
  # }

  dimension_group: start_time {
    type: time
    sql: TIMESTAMP_SECONDS(CAST(${TABLE}.jsonPayload.start_time as INT64)) ;;
  }

  dimension_group: end_time {
    type: time
    sql: TIMESTAMP_SECONDS(CAST(${TABLE}.jsonPayload.end_time as INT64)) ;;
  }

  dimension: change_to_dev_duration {
    description: "in seconds"
    type: number
    sql: ${TABLE}.jsonPayload.change_to_dev_duration ;;
  }

  dimension: total_duration {
    description: "in seconds"
    type: number
    sql: ${TABLE}.jsonPayload.total_duration ;;
  }

  measure: avg_change_to_dev_duration {
    type: average
    sql: ${change_to_dev_duration} ;;
  }
  measure: avg_total_duration {
    type: average
    sql: ${total_duration} ;;
  }
  measure: count_users {
    type: count_distinct
    sql: ${user_id} ;;
  }
}
