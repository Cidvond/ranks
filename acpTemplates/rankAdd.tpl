{include file='header' pageTitle='wcf.acp.menu.link.clan.rank.'|concat:$action}

<header class="boxHeadline">
    <h1>{lang}wcf.acp.clan.rank.{$action}{/lang}</h1>
</header>

{include file='formError'}

{if $success|isset}
    <p class="success">{lang}wcf.global.success.{$action}{/lang}</p>
{/if}

<div class="contentNavigation">
    <nav>
        <ul>
            <li><a href="{link controller='RankList'}{/link}" class="button"><span class="icon icon16 icon-list"></span> <span>{lang}wcf.acp.menu.link.clan.rank.list{/lang}</span></a></li>

            {event name='contentNavigationButtons'}
        </ul>
    </nav>
</div>

<form method="post" action="{if $action == 'add'}{link controller='RankAdd'}{/link}{else}{link controller='RankEdit' id=$primaryID}{/link}{/if}">
    <div class="container containerPadding marginTop">
        <fieldset>
            <legend>{lang}wcf.global.form.data{/lang}</legend>

            <dl{if $errorField == 'name'} class="formError"{/if}>
                <dt><label for="name">{lang}wcf.acp.clan.rank.name{/lang}</label></dt>
                <dd>
                    <input type="text" id="name" name="name" value="{if $primaryID}{$object->name}{/if}" required="required" autofocus="autofocus" class="long" />
                    {if $errorField == 'name'}
                        <small class="innerError">
                            {if $errorType == 'empty'}
                                {lang}wcf.global.form.error.empty{/lang}
                            {else}
                                {lang}wcf.acp.clan.rank.name.error.{@$errorType}{/lang}
                            {/if}
                        </small>
                    {/if}
                </dd>
            </dl>

            <dl{if $errorField == 'prefix'} class="formError"{/if}>
                <dt><label for="prefix">{lang}wcf.acp.clan.rank.prefix{/lang}</label></dt>
                <dd>
                    <input type="text" id="prefix" name="prefix" value="{if $primaryID}{$object->prefix}{/if}" required="required" autofocus="autofocus" class="long" />
                    {if $errorField == 'prefix'}
                        <small class="innerError">
                            {if $errorType == 'empty'}
                                {lang}wcf.global.form.error.empty{/lang}
                            {else}
                                {lang}wcf.acp.clan.rank.prefix.error.{@$errorType}{/lang}
                            {/if}
                        </small>
                    {/if}
                </dd>
            </dl>

            <dl{if $errorField == 'paygrade'} class="formError"{/if}>
                <dt><label for="paygrade">{lang}wcf.acp.clan.rank.paygrade{/lang}</label></dt>
                <dd>
                    <input type="text" id="paygrade" name="paygrade" value="{if $primaryID}{$object->paygrade}{/if}" required="required" autofocus="autofocus" class="long" />
                    {if $errorField == 'paygrade'}
                        <small class="innerError">
                            {if $errorType == 'empty'}
                                {lang}wcf.global.form.error.empty{/lang}
                            {else}
                                {lang}wcf.acp.clan.rank.paygrade.error.{@$errorType}{/lang}
                            {/if}
                        </small>
                    {/if}
                </dd>
            </dl>

            <dl{if $errorField == 'image'} class="formError"{/if}>
                <dt><label for="image">{lang}wcf.acp.clan.rank.image{/lang}</label></dt>
                <dd>
                    <input type="text" id="image" name="image" value="{if $primaryID}{$object->image}{/if}" required="required" autofocus="autofocus" class="long" />
                    {if $errorField == 'image'}
                        <small class="innerError">
                            {if $errorType == 'empty'}
                                {lang}wcf.global.form.error.empty{/lang}
                            {else}
                                {lang}wcf.acp.clan.rank.image.error.{@$errorType}{/lang}
                            {/if}
                        </small>
                    {/if}
                    <p style="margin-top: 10px;">
                        {if $primaryID}{@$object->getImage('80')}{/if}
                    </p>
                </dd>
            </dl>

            <dl{if $errorField == 'branchID'} class="formError"{/if}>
                <dt><label for="branchID">{lang}wcf.acp.clan.rank.branch{/lang}</label></dt>
                <dd>
                    <select id="branchID" name="branchID">
                        {foreach from=$branches item=branch}
                            <option value="{$branch->branchID}" {if $primaryID && $object->branchID == $branch->branchID}selected{/if}>{$branch->name}</option>
                        {/foreach}
                    </select>
                    {if $errorField == 'branchID'}
                        <small class="innerError">
                            {lang}wcf.acp.clan.rank.branch.error.{@$errorType}{/lang}
                        </small>
                    {/if}
                </dd>
            </dl>

            <dl{if $errorField == 'categoryID'} class="formError"{/if}>
                <dt><label for="categoryID">{lang}wcf.acp.clan.rank.category{/lang}</label></dt>
                <dd>
                    <select id="categoryID" name="categoryID">
                        {$categories}
                        {foreach from=$categories item=category}
                            <option value="{$category->categoryID}" {if $primaryID && $object->categoryID == $category->categoryID}selected{/if}>{$category->title}</option>
                        {/foreach}
                    </select>
                    {if $errorField == 'categoryID'}
                        <small class="innerError">
                            {lang}wcf.acp.clan.rank.category.error.{@$errorType}{/lang}
                        </small>
                    {/if}
                </dd>
            </dl>

            <dl{if $errorField == 'displayOrder'} class="formError"{/if}>
                <dt><label for="displayOrder">{lang}wcf.acp.clan.rank.displayOrder{/lang}</label></dt>
                <dd>
                    <input type="number" id="displayOrder" name="displayOrder" value="{if $primaryID}{$object->displayOrder}{/if}" min="1" class="tiny" />
                    {if $errorField == 'displayOrder'}
                        <small class="innerError">
                            {lang}wcf.acp.clan.rank.displayOrder.error.{@$errorType}{/lang}
                        </small>
                    {/if}
                </dd>
            </dl>

            <dl {if $errorField == 'isDisabled'} class="formError"{/if}>
                <dt></dt>
                <dd>
                    <label><input type="checkbox" id="isDisabled" name="isDisabled" value="1"{if $isDisabled} checked="checked"{/if} /> {lang}wcf.acp.clan.rank.isDisabled{/lang}</label>
                </dd>
            </dl>

        {event name='fieldsets'}
    </div>

    <div class="formSubmit">
        <input type="submit" value="{lang}wcf.global.button.submit{/lang}" accesskey="s" />
        {@SECURITY_TOKEN_INPUT_TAG}
    </div>
</form>

{include file='footer'}
