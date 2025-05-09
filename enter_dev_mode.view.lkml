
view: enter_dev_mode {
  sql_table_name: `looker-load-tests.lkr_enter_dev_mode.enter_dev_mode` ;;

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

  dimension_group: start_time {
    type: time
    sql: TIMESTAMP_SECONDS(CAST(${TABLE}.jsonPayload.start_time as INT64)) ;;
  }

  dimension_group: end_time {
    type: time
    sql: TIMESTAMP_SECONDS(CAST(${TABLE}.jsonPayload.end_time as INT64)) ;;
  }

  measure: avg_total_duration {
    type: average
    sql: ${total_duration} ;;
    value_format_name: decimal_2
  }
  measure: count_users {
    type: count_distinct
    sql: ${user_id} ;;
  }
}
