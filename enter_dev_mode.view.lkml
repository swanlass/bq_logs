
view: enter_dev_mode {
  sql_table_name: `looker-load-tests.loadtests.run_googleapis_com_stdout` ;;

  dimension: total_duration {
    description: "in seconds"
    type: number
    sql: ${TABLE}.jsonPayload.total_duration ;;
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

  dimension: start_time {
    type: date_time
    sql: TIMESTAMP_SECONDS(CAST(${TABLE}.jsonPayload.end_time as INT64)) ;;
  }

  dimension: end_time {
    type: number
    sql: ${TABLE}.jsonPayload.end_time ;;
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
