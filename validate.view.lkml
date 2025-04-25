
view: validate {
  sql_table_name: `looker-load-tests.lkr_dev_mode_validate.run_googleapis_com_stdout` ;;

  dimension: validate_duration {
    type: number
    sql: ${TABLE}.jsonPayload.validate_duration ;;
  }

  dimension: total_duration {
    type: number
    sql: ${TABLE}.jsonPayload.total_duration ;;
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}.jsonPayload.admin_id ;;
  }

  dimension_group: start_time {
    type: time
    sql: TIMESTAMP_SECONDS(CAST(${TABLE}.jsonPayload.start_time as INT64)) ;;
  }

  dimension_group: end_time {
    type: time
    sql: TIMESTAMP_SECONDS(CAST(${TABLE}.jsonPayload.end_time as INT64)) ;;
  }

  dimension: event {
    type: string
    sql: ${TABLE}.jsonPayload.event ;;
  }

  measure: count {
    type: count
  }

  measure: avg_total_duration {
    type: average
    sql: ${total_duration} ;;
    value_format_name: decimal_2
  }

  measure: avg_validate_duration {
    type: average
    sql: ${validate_duration} ;;
    value_format_name: decimal_2
  }
  measure: count_users {
    type: count_distinct
    sql: ${user_id} ;;
  }


}
