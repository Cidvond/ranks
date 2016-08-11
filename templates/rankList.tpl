{include file='documentHeader'}
<head>
    <title>{lang}wcf.page.training.ranks{/lang} - {PAGE_TITLE|language}</title>

    {include file='headInclude' sandbox=false}
</head>

<body id="tpl{$templateName|ucfirst}">
    {include file='header' title='wcf.page.training.ranks.title'|language paddingBottom=30 light=true}

    {include file='userNotice'}

    <div class="container marginTop">

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
                    {counter assign=paneNo name=paneNo print=false}

                    {assign var="branches" value=$lookup[$category->categoryID]['branches']}
                    {assign var="paygrades" value=$lookup[$category->categoryID]['paygrades']}
                    {assign var="ranks" value=$lookup[$category->categoryID]['ranks']}

                    <div class="tab-pane tab-pane-navigation {if $paneNo == 1}active{/if}" id="tabCategory{$key}">
                        {if $paygrades|count}
                            <table style="text-align:center;">
                                <thead>
                                <tr>
                                    <td>Paygrade</td>
                                    {foreach from=$branches item=branch}
                                        <th>{$branch->name}</th>
                                    {/foreach}
                                </tr>
                                </thead>
                                <tbody>
                                {foreach from=$paygrades item=paygrade}
                                    <tr>
                                        <th>{$paygrade}</th>
                                        {foreach from=$branches item=branch}
                                            <td>
                                                {if $ranks[$paygrade][$branch->branchID]}
                                                    <p>{$ranks[$paygrade][$branch->branchID]->name}</p>
                                                    <p>{@$ranks[$paygrade][$branch->branchID]->getImage(80)}</p>
                                                    <p>{$ranks[$paygrade][$branch->branchID]->prefix}</p>
                                                {else}
                                                    <p>Rank Unavailable</p>
                                                    <img src="{$branch->rankUnavailableImage}" width="80"></p>
                                                    <p>in {$branch->name}</p>
                                                {/if}
                                            </td>
                                        {/foreach}
                                    </tr>
                                {/foreach}
                                </tbody>
                            </table>
                        {else}
                            <div class="alert alert-warning">
                                <strong>Oh noes!</strong> For some reason there's currently no content available in this category.
                            </div>
                        {/if}
                    </div>
                {/foreach}
            </div>
        </div>
    </div>

    {include file='footer' skipBreadcrumbs=true}
</body>
</html>