<?php

function fn_change_order_status_history_get_order_status_changes()
{
    $fields = [
        '?:logs.user_id',
        '?:logs.timestamp',
        '?:logs.content',
        '?:users.firstname',
        '?:users.lastname'
    ];

    $join = "LEFT JOIN ?:users USING(user_id)";

    $condition = db_quote('AND ?:logs.type = "orders" AND ?:logs.action="status"');

    $data = db_get_array("SELECT " . join(', ', $fields) . " FROM ?:logs ?p WHERE 1 ?p", $join, $condition);

    foreach ($data as $k => $v) {
        $content = !empty($v['content']) ? unserialize($v['content']) : [];
        $data[$k]['content'] = $content;
        if(isset($content['status'])) {
            $explodedStatuses = explode(' -> ', $content['status']);
            $data[$k]['oldStatus'] = $explodedStatuses[0];
            $data[$k]['newStatus'] = $explodedStatuses[1];
        }
    }

    return $data;
}