<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>{$GLOBAL.website.title} - {$smarty.request.page|escape|default:"home"|capitalize}</title>
  
  <!--[if lt IE 9]>
  <link rel="stylesheet" href="{$PATH}/css/ie.css" type="text/css" media="screen" />
  <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
  <![endif]-->

  <!--[if IE]><script type="text/javascript" src="{$PATH}/js/excanvas.js"></script><![endif]-->
  {if $GLOBAL.statistics.analytics.enabled}
  {$GLOBAL.statistics.analytics.code nofilter}
  {/if}
  <link href="https://unpkg.com/bootstrap-rin@3.3.7-2/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-switch/3.3.2/css/bootstrap3/bootstrap-switch.min.css" rel="stylesheet">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css" rel="stylesheet">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.css" rel="stylesheet">
  <link href="{$PATH}/css/plugins/timeline/timeline.css" rel="stylesheet">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/datatables/1.10.12/css/dataTables.bootstrap.min.css" rel="stylesheet">
  <link href="{$PATH}/css/mpos.css" rel="stylesheet">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/metisMenu/2.5.2/metisMenu.min.css" rel="stylesheet">
  <link href="{$PATH}/css/sparklines.css" rel="stylesheet">
  {if $GLOBAL.config.website_design|default:"default" != "default"}
  <link href="{$PATH}/css/design/{$GLOBAL.config.website_design}.css" rel="stylesheet">
  {/if}
  
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
  <script src="https://cdn.rawgit.com/placemarker/jQuery-MD5/b985fce4/jquery.md5.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.6/js/bootstrap.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-switch/3.3.2/js/bootstrap-switch.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/datatables/1.10.12/js/jquery.dataTables.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/datatables/1.10.12/js/dataTables.bootstrap.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/metisMenu/2.5.2/metisMenu.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.2/raphael-min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-sparklines/2.1.2/jquery.sparkline.min.js"></script>
  <script src="{$PATH}/js/mpos.js"></script>
</head>
<body>
  <div id="wrapper">
    {include file="global/header.tpl"}
    {include file="global/navigation.tpl"}

    <div id="page-wrapper"><br />
    {nocache}
    {if is_array($smarty.session.POPUP|default)}
      {section popup $smarty.session.POPUP}
      <div class="{if $smarty.session.POPUP[popup].DISMISS|default:"" == "yes"}alert-dismissable {/if} {$smarty.session.POPUP[popup].TYPE|default:"alert alert-info"} {if $smarty.session.POPUP[popup].ID|default:"static" == "static" AND $GLOBAL.website.notificationshide == 1}autohide{/if}" id="{$smarty.session.POPUP[popup].ID|default:"static"}">
        {if $smarty.session.POPUP[popup].DISMISS|default:"no" == "yes"}
        <button id="{$smarty.session.POPUP[popup].ID|default:"static"}" type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
        {/if}
        {if $smarty.session.POPUP[popup].TYPE|default:"alert alert-info" == "alert alert-info"}
        <span class="glyphicon glyphicon-info-sign">&nbsp;</span>
        {elseif $smarty.session.POPUP[popup].TYPE|default:"alert alert-info" == "alert alert-warning"}
        <span class="glyphicon glyphicon-info-sign">&nbsp;</span>
        {elseif $smarty.session.POPUP[popup].TYPE|default:"alert alert-info" == "alert alert-danger"}
        <span class="glyphicon glyphicon-remove-circle">&nbsp;</span>
        {elseif $smarty.session.POPUP[popup].TYPE|default:"alert alert-info" == "alert alert-success"}
        <span class="glyphicon glyphicon-ok-circle">&nbsp;</span>
        {/if}
        {$smarty.session.POPUP[popup].CONTENT nofilter}
      </div>
      {/section}
    {/if}
    {/nocache}
    {if $CONTENT != "empty" && $CONTENT != ""}
      {if file_exists($smarty.current_dir|cat:"/$PAGE/$ACTION/$CONTENT")}
        {include file="$PAGE/$ACTION/$CONTENT"}
      {else}
        Missing template for this page
      {/if}
    {/if}
    </div>
    {include file="global/footer.tpl"}
  </body>
</html>
