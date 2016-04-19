{include file='header' pageTitle='wcf.acp.menu.link.clan.branches.'|concat:$action}

<header class="boxHeadline">
    <h1>{lang}wcf.acp.clan.branch.{$action}{/lang}</h1>
</header>

{include file='formError'}

{if $success|isset}
    <p class="success">{lang}wcf.global.success.{$action}{/lang}</p>
{/if}

<div class="contentNavigation">
    <nav>
        <ul>
            <li><a href="{link controller='BranchList'}{/link}" class="button"><span class="icon icon16 icon-list"></span> <span>{lang}wcf.acp.menu.link.clan.branch.list{/lang}</span></a></li>

            {event name='contentNavigationButtons'}
        </ul>
    </nav>
</div>

<form method="post" action="{if $action == 'add'}{link controller='BranchAdd'}{/link}{else}{link controller='BranchEdit' id=$primaryID}{/link}{/if}">
    <div class="container containerPadding marginTop">
        <fieldset>
            <legend>{lang}wcf.global.form.data{/lang}</legend>

            <dl{if $errorField == 'name'} class="formError"{/if}>
                <dt><label for="name">{lang}wcf.acp.clan.branch.name{/lang}</label></dt>
                <dd>
                    <input type="text" id="name" name="name" value="{if $primaryID}{$object->name}{/if}" required="required" autofocus="autofocus" class="long" />
                    {if $errorField == 'name'}
                        <small class="innerError">
                            {if $errorType == 'empty'}
                                {lang}wcf.global.form.error.empty{/lang}
                            {else}
                                {lang}wcf.acp.user.rank.title.error.{@$errorType}{/lang}
                            {/if}
                        </small>
                    {/if}
                </dd>
            </dl>

            <dl{if $errorField == 'image'} class="formError"{/if}>
                <dt><label for="image">{lang}wcf.acp.clan.branch.image{/lang}</label></dt>
                <dd>
                    <input type="text" id="image" name="image" value="{if $primaryID}{$object->image}{/if}" required="required" autofocus="autofocus" class="long" />
                    {if $errorField == 'image'}
                        <small class="innerError">
                            {if $errorType == 'empty'}
                                {lang}wcf.global.form.error.empty{/lang}
                            {else}
                                {lang}wcf.acp.user.rank.title.error.{@$errorType}{/lang}
                            {/if}
                        </small>
                    {/if}
                    <p style="margin-top: 10px;">
                        {if $primaryID}{@$object->getImage()}{/if}
                    </p>
                </dd>
            </dl>

            <dl{if $errorField == 'rankUnavailableImage'} class="formError"{/if}>
                <dt><label for="rankUnavailableImage">{lang}wcf.acp.clan.branch.rankUnavailableImage{/lang}</label></dt>
                <dd>
                    <input type="text" id="rankUnavailableImage" name="rankUnavailableImage" value="{if $primaryID}{$object->rankUnavailableImage}{/if}" required="required" autofocus="autofocus" class="long" />
                    <small>{lang}wcf.acp.clan.branch.rankUnavailableImage.description{/lang}</small>
                    {if $errorField == 'image'}
                        <small class="innerError">
                            {if $errorType == 'empty'}
                                {lang}wcf.global.form.error.empty{/lang}
                            {else}
                                {lang}wcf.acp.user.rank.title.error.{@$errorType}{/lang}
                            {/if}
                        </small>
                    {/if}
                    <p style="margin-top: 10px;">
                        {if $primaryID}<img src="{@$object->rankUnavailableImage}" width="80">{/if}
                    </p>
                </dd>
            </dl>

            <dl{if $errorField == 'displayOrder'} class="formError"{/if}>
                <dt><label for="displayOrder">{lang}wcf.acp.clan.branch.sortOrder{/lang}</label></dt>
                <dd>
                    <input type="number" id="displayOrder" name="displayOrder" value="{if $primaryID}{$object->displayOrder}{/if}" min="1" class="tiny" />
                    {if $errorField == 'displayOrder'}
                        <small class="innerError">
                            {lang}wcf.acp.clan.branch.sortOrder.error.{@$errorType}{/lang}
                        </small>
                    {/if}
                </dd>
            </dl>

            <dl {if $errorField == 'isDisabled'} class="formError"{/if}>
                <dt></dt>
                <dd>
                    <label><input type="checkbox" id="isDisabled" name="isDisabled" value="1"{if $primaryID && $object->isDisabled} checked="checked"{/if} /> {lang}wcf.acp.clan.branch.isDisabled{/lang}</label>
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