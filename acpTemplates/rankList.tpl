{include file='header' pageTitle='wcf.acp.clan.rank.list'}

<script data-relocate="true">
    //<![CDATA[
    $(function() {
        new WCF.Action.Delete('wcf\\data\\rank\\RankAction', '.jsRankRow');
    });
    //]]>
</script>

<header class="boxHeadline">
    <h1>{lang}wcf.acp.clan.rank.list{/lang}</h1>
</header>

<div class="contentNavigation">
    {pages print=true assign=pagesLinks controller="RankList" object=$category link="pageNo=%d&sortField=$sortField&sortOrder=$sortOrder"}

    <nav>
        <ul>
            <li><a href="{link controller='RankAdd'}{/link}" class="button"><span class="icon icon16 icon-plus"></span> <span>{lang}wcf.acp.clan.rank.add{/lang}</span></a></li>

            {event name='contentNavigationButtonsTop'}
        </ul>
    </nav>
</div>

<div class="tabularBox tabularBoxTitle marginTop">
    <header>
        <h2>{lang}wcf.acp.clan.rank.list{/lang} <span class="badge badgeInverse">{#$items}</span></h2>
    </header>

    <div class="tabMenuContainer container containerPadding marginTop">
        <nav class="menu">
            <ul>
                <?php print_r($categories); ?>
                {foreach from=$categories item=categoryLoop}
                    {$categoryLoop->categoryID}
                    <li{if (!$category && !$categoryLoop->categoryID) || ($category && $category->categoryID == $categoryLoop->categoryID)} class="ui-state-active"{/if}><a href="{if $categoryLoop->categoryID}{link controller='RankList' object=$categoryLoop}{/link}{else}{link controller='RankList'}{/link}{/if}">{$categoryLoop->title}</a></li>
                {/foreach}
            </ul>
        </nav>

        {hascontent}
            <table class="table sortableListContainer">
                <thead>
                <tr>
                    <th class="columnID columnRankID{if $sortField == 'rankID'} active {@$sortOrder}{/if}" colspan="2"><a href="{link controller='RankList' object=$category}pageNo={@$pageNo}&sortField=rankID&sortOrder={if $sortField == 'branchID' && $sortOrder == 'ASC'}DESC{else}ASC{/if}{/link}">{lang}wcf.global.objectID{/lang}</a></th>
                    <th class="columnTitle columnName{if $sortField == 'name'} active {@$sortOrder}{/if}"><a href="{link controller='RankList' object=$category}pageNo={@$pageNo}&sortField=name&sortOrder={if $sortField == 'name' && $sortOrder == 'ASC'}DESC{else}ASC{/if}{/link}">{lang}wcf.acp.clan.rank.name{/lang}</a></th>
                    <th class="columnTitle columnPaygrade{if $sortField == 'paygrade'} active {@$sortOrder}{/if}"><a href="{link controller='RankList' object=$category}pageNo={@$pageNo}&sortField=paygrade&sortOrder={if $sortField == 'paygrade' && $sortOrder == 'ASC'}DESC{else}ASC{/if}{/link}">{lang}wcf.acp.clan.rank.paygrade{/lang}</a></th>
                    <th class="columnText columnPrefix{if $sortField == 'prefix'} active {@$sortOrder}{/if}"><a href="{link controller='RankList' object=$category}pageNo={@$pageNo}&sortField=prefix&sortOrder={if $sortField == 'prefix' && $sortOrder == 'ASC'}DESC{else}ASC{/if}{/link}">{lang}wcf.acp.clan.rank.prefix{/lang}</a></th>
                    <th class="columnText columnImage">{lang}wcf.acp.clan.rank.image{/lang}</th>
                    <th class="columnText columnBranch">{lang}wcf.acp.clan.rank.branch{/lang}</th>
                    <th class="columnText columnDisplayOrder{if $sortField == 'displayOrder'} active {@$sortOrder}{/if}"><a href="{link controller='RankList' object=$category}pageNo={@$pageNo}&sortField=displayOrder&sortOrder={if $sortField == 'displayOrder' && $sortOrder == 'ASC'}DESC{else}ASC{/if}{/link}">{lang}wcf.acp.clan.rank.sortOrder{/lang}</a></th>

                    {event name='columnHeads'}
                </tr>
                </thead>

                <tbody>
                {content}
                {foreach from=$objects item=rank}
                    <tr class="jsRankRow">
                        <td class="columnIcon">
                            <a href="{link controller='RankEdit' id=$rank->rankID}{/link}" title="{lang}wcf.global.button.edit{/lang}" class="jsTooltip"><span class="icon icon16 icon-pencil"></span></a>
                            <span class="icon icon16 icon-remove jsDeleteButton jsTooltip pointer" title="{lang}wcf.global.button.delete{/lang}" data-object-id="{@$rank->rankID}" data-confirm-message="{lang}wcf.acp.clan.rank.delete.sure{/lang}"></span>

                            {event name='rowButtons'}
                        </td>
                        <td class="columnID columnRankID">{@$rank->rankID}</td>
                        <td class="columnTitle columnName">{$rank->name}</td>
                        <td class="columnTitle columnPaygrade">{$rank->paygrade}</td>
                        <td class="columnText columnPrefix">{$rank->prefix}</td>
                        <td class="columnText columnImage">{if $rank->image}{@$rank->getImage(60)}{/if}</td>
                        <td class="columnText columnBranch">{$rank->branch->name}</td>
                        <td class="columnDigits columnDisplayOrder">{#$rank->displayOrder}</td>

                        {event name='columns'}
                    </tr>
                {/foreach}
                {/content}
                </tbody>
            </table>
        {hascontentelse}
        <p class="info">{lang}wcf.global.noItems{/lang}</p>
        {/hascontent}
    </div>
</div>

<div class="contentNavigation">
    {@$pagesLinks}

    <nav>
        <ul>
            <li><a href="{link controller='RankAdd'}{/link}" class="button"><span class="icon icon16 icon-plus"></span> <span>{lang}wcf.acp.clan.rank.add{/lang}</span></a></li>

            {event name='contentNavigationButtonsBottom'}
        </ul>
    </nav>
</div>

{include file='footer'}