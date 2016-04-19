{include file='documentHeader'}
<head>
  <title>{lang}wcf.page.training.ranks{/lang} - {PAGE_TITLE|language}</title>

  <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
  {include file='headInclude' sandbox=false}
</head>

<body id="tpl{$templateName|ucfirst}">
  {include file='header'}

  <header class="boxHeadline">    
    <h1>{lang}wcf.page.training.ranks{/lang}</h1>
  </header>

  {include file='userNotice'}

  <div class="container marginTop">
    <ul class="containerList exampleList">
      <li class="exampleBox">
        <div>
          <div class="containerHeadline">
            <div id="accordion">

              {foreach from=$categories item=category}
                {if !$category->isDisabled && $hasRanks[$category->categoryID]}
                  {assign var="branches" value=$lookup[$category->categoryID]['branches']}
                  {assign var="paygrades" value=$lookup[$category->categoryID]['paygrades']}
                  {assign var="ranks" value=$lookup[$category->categoryID]['ranks']}

                  <h3>{$category->title} Ranks</h3>

                  <div>
                    <p class="info" style="margin-bottom:20px;">{$category->description}</p>

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
                  </div>

                {/if}
              {/foreach}
            </div>
          </div>
        </div>
      </li>
    </ul>
  </div>

  <script data-relocate="true">
    $(function() {
      $("#accordion").accordion({
        heightStyle: "content"
      });
    });
  </script>

  {include file='footer'}
</body>
</html>