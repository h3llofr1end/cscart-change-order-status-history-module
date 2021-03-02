<?php

if (!defined('BOOTSTRAP')) { die('Access denied'); }

if($mode == 'index') {
	$history = fn_change_order_status_history_get_order_status_changes();

	Tygh::$app['view']->assign('history', $history);
}