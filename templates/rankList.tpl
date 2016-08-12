{include file='documentHeader'}
<head>
    <title>{lang}wcf.page.training.ranks{/lang} - {PAGE_TITLE|language}</title>

    {include file='headInclude' sandbox=false}
</head>

<body id="tpl{$templateName|ucfirst}">
{include file='header' title='wcf.page.training.ranks.title'|language paddingBottom=30 light=true}

<div class="container marginTop">
    {include file='userNotice'}

    <div class="row">
        <div class="col-md-4">
            <div class="tabs tabs-vertical tabs-left tabs-navigation">
                <ul class="nav nav-tabs col-sm-3">
                    {foreach from=$categories item=category key=key}
                        {counter assign=tabNo name=tabNo print=false}
                        <li {if $tabNo == 1}class="active"{/if}>
                            <a href="#tabCategory{$key}" data-toggle="tab">{$category->title}</a>
                        </li>
                    {/foreach}
                </ul>
            </div>
        </div>

        <div class="col-md-8">
            {foreach from=$categories item=category key=key}
                {assign var="tree" value=$category->getRankTree()}
                {counter assign=paneNo name=paneNo print=false}
                <div class="tab-pane tab-pane-navigation {if $paneNo == 1}active{/if}" id="tabCategory{$key}">

                    <table style="text-align:center;">
                        <thead>
                            <tr>
                                <td>Paygrade</td>
                                {foreach from=$branches item=branch}
                                    <th class="text-center">{$branch->name}</th>
                                {/foreach}
                            </tr>
                        </thead>
                        <tbody>
                            {foreach from=$tree['paygrades'] item=paygrade}
                                {assign var="paygradeRanks" value=$tree['ranks'][$paygrade]}
                                <tr>
                                    <th rowspan="3">{$paygrade}</th>
                                    {foreach from=$branches item=branch}
                                        <td>
                                            {if $paygradeRanks[$branch->branchID]|isset}
                                                {$paygradeRanks[$branch->branchID]->name}
                                            {else}
                                                Rank Unavailable
                                            {/if}
                                        </td>
                                    {/foreach}
                                </tr>
                                <tr>
                                    {foreach from=$branches item=branch}
                                        <td>
                                            {if $paygradeRanks[$branch->branchID]|isset}
                                                {@$paygradeRanks[$branch->branchID]->getImage(80)}
                                            {else}
                                                <img src="{$branch->rankUnavailableImage}" width="80"></p>
                                            {/if}
                                        </td>
                                    {/foreach}
                                </tr>
                                <tr>
                                    {foreach from=$branches item=branch}
                                        <td>
                                            {if $paygradeRanks[$branch->branchID]|isset}
                                                {$paygradeRanks[$branch->branchID]->prefix}
                                            {else}
                                                in {$branch->name}
                                            {/if}
                                        </td>
                                    {/foreach}
                                </tr>
                            {/foreach}
                        </tbody>
                    </table>

                </div>
            {/foreach}
        </div>
    </div>
</div>

{include file='footer' skipBreadcrumbs=true}
</body>
</html>