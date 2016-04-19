{include file='header' pageTitle='wcf.acp.clan.branch.list'}

<script data-relocate="true">
    //<![CDATA[
    $(function() {
        new WCF.Action.Delete('wcf\\data\\branch\\BranchAction', '.jsBranchRow');
    });
    //]]>
</script>

<header class="boxHeadline">
    <h1>{lang}wcf.acp.clan.branch.list{/lang}</h1>
</header>

<div class="contentNavigation">
    {pages print=true assign=pagesLinks controller="BranchList" link="pageNo=%d&sortField=$sortField&sortOrder=$sortOrder"}

    <nav>
        <ul>
            <li><a href="{link controller='BranchAdd'}{/link}" class="button"><span class="icon icon16 icon-plus"></span> <span>{lang}wcf.acp.menu.link.clan.branch.add{/lang}</span></a></li>

            {event name='contentNavigationButtonsTop'}
        </ul>
    </nav>
</div>

{hascontent}
    <div class="tabularBox tabularBoxTitle marginTop">
        <header>
            <h2>{lang}wcf.acp.clan.branch.list{/lang} <span class="badge badgeInverse">{#$items}</span></h2>
        </header>

        <table class="table">
            <thead>
            <tr>
                <th class="columnID columnBranchID{if $sortField == 'branchID'} active {@$sortOrder}{/if}" colspan="2"><a href="{link controller='BranchList'}pageNo={@$pageNo}&sortField=branchID&sortOrder={if $sortField == 'branchID' && $sortOrder == 'ASC'}DESC{else}ASC{/if}{/link}">{lang}wcf.global.objectID{/lang}</a></th>
                <th class="columnTitle columnName{if $sortField == 'name'} active {@$sortOrder}{/if}"><a href="{link controller='BranchList'}pageNo={@$pageNo}&sortField=name&sortOrder={if $sortField == 'name' && $sortOrder == 'ASC'}DESC{else}ASC{/if}{/link}">{lang}wcf.acp.clan.branch.name{/lang}</a></th>
                <th class="columnText columnImage">{lang}wcf.acp.clan.branch.image{/lang}</th>
                <th class="columnText columnDisplayOrder{if $sortField == 'displayOrder'} active {@$sortOrder}{/if}"><a href="{link controller='BranchList'}pageNo={@$pageNo}&sortField=displayOrder&sortOrder={if $sortField == 'displayOrder' && $sortOrder == 'ASC'}DESC{else}ASC{/if}{/link}">{lang}wcf.acp.clan.branch.sortOrder{/lang}</a></th>

                {event name='columnHeads'}
            </tr>
            </thead>

            <tbody>
            {content}
            {foreach from=$objects item=branch}
                <tr class="jsBranchRow">
                    <td class="columnIcon">
                        <a href="{link controller='BranchEdit' id=$branch->branchID}{/link}" title="{lang}wcf.global.button.edit{/lang}" class="jsTooltip"><span class="icon icon16 icon-pencil"></span></a>
                        <span class="icon icon16 icon-remove jsDeleteButton jsTooltip pointer" title="{lang}wcf.global.button.delete{/lang}" data-object-id="{@$branch->branchID}" data-confirm-message="{lang}wcf.acp.clan.branch.delete.sure{/lang}"></span>

                        {event name='rowButtons'}
                    </td>
                    <td class="columnID columnBranchID">{@$branch->branchID}</td>
                    <td class="columnTitle columnName">{$branch->name}</td>
                    <td class="columnText columnImage">{if $branch->image}{@$branch->getImage()}{/if}</td>
                    <td class="columnDigits columnDisplayOrder">{#$branch->displayOrder}</td>

                    {event name='columns'}
                </tr>
            {/foreach}
            {/content}
            </tbody>
        </table>

    </div>

    <div class="contentNavigation">
        {@$pagesLinks}

        <nav>
            <ul>
                <li><a href="{link controller='BranchAdd'}{/link}" class="button"><span class="icon icon16 icon-plus"></span> <span>{lang}wcf.acp.clan.branch.add{/lang}</span></a></li>

                {event name='contentNavigationButtonsBottom'}
            </ul>
        </nav>
    </div>
{hascontentelse}
    <p class="info">{lang}wcf.global.noItems{/lang}</p>
{/hascontent}

{include file='footer'}