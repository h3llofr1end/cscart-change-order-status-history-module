{capture name="mainbox"}

    {if $history}
        <div class="table-responsive-wrapper">
            <table class="table table--relative table-responsive">
                <thead>
                <tr>
                    <th>{__("change_order_status_history.order_id")}</th>
                    <th>{__("change_order_status_history.old_status")}</th>
                    <th>{__("change_order_status_history.new_status")}</th>
                    <th>{__("change_order_status_history.user")}</th>
                    <th>{__("change_order_status_history.time")}</th>
                </tr>
                </thead>
                <tbody>
                {foreach from=$history item="historyItem"}
                    <tr>
                        <td data-th="{__("change_order_status_history.order_id")}">
                            {$historyItem.content.id}
                        </td>
                        <td data-th="{__("change_order_status_history.old_status")}">
                            {$historyItem.oldStatus}
                        </td>
                        <td data-th="{__("change_order_status_history.new_status")}">
                            {$historyItem.newStatus}
                        </td>
                        <td data-th="{__("change_order_status_history.user")}">
                            {if $historyItem.user_id}
                                <a href="{"profiles.update?user_id=`$historyItem.user_id`"|fn_url}">{$historyItem.lastname}{if $historyItem.firstname || $historyItem.lastname}&nbsp;{/if}{$historyItem.firstname}</a>
                            {else}
                                &mdash;
                            {/if}
                        </td>
                        <td data-th="{__("change_order_status_history.time")}">
                            <span class="nowrap">{$historyItem.timestamp|date_format:"`$settings.Appearance.date_format`, `$settings.Appearance.time_format`"}</span>
                        </td>
                    </tr>
                {/foreach}
                </tbody>
            </table>
        </div>
    {else}
        <p class="no-items">{__("no_data")}</p>
    {/if}

{/capture}

{include file="common/mainbox.tpl" title=__("change_order_status_history.title") content=$smarty.capture.mainbox buttons=$smarty.capture.buttons sidebar=$smarty.capture.sidebar}
