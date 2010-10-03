{*
 *  header.tpl
 *  gitphp: A PHP git repository browser
 *  Component: Page header template
 *
 *  Copyright (C) 2006 Christopher Han <xiphux@gmail.com>
 *}
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
  <!-- gitphp web interface {$version}, (C) 2006-2010 Christopher Han <xiphux@gmail.com> -->
  <head>
    <title>{$pagetitle}{if $project} :: {$project->GetProject()}{if $actionlocal}/{$actionlocal}{/if}{/if}</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    {if $project}
      <link rel="alternate" title="{$project->GetProject()} log" href="{$SCRIPT_NAME}?p={$project->GetProject()|urlencode}&a=rss" type="application/rss+xml" />
    {/if}
    <link rel="stylesheet" href="css/{$stylesheet}" type="text/css" />
    {if $extracss}
    <style type="text/css">
    <!--
    {$extracss}
    -->
    </style>
    {/if}
    {if $javascript}
    <script language="javascript">
      var GITPHP_RES_LOADING="{t escape='js'}Loading…{/t}";
      var GITPHP_RES_LOADING_BLAME_DATA="{t escape='js'}Loading blame data…{/t}";
    </script>
    <link rel="stylesheet" href="css/ext/jquery.qtip.css" type="text/css" />
    <script language="javascript" src="js/ext/jquery-1.4.2.min.js"></script>
    <script language="javascript" src="js/ext/jquery.qtip.min.js"></script>
    <script language="javascript" src="js/tooltips.js"></script>
    <script language="javascript" src="js/lang.js"></script>
    {foreach from=$extrascripts item=script}
    <script language="javascript" src="{$script}"></script>
    {/foreach}
    {/if}
    {$smarty.capture.header}
  </head>
  <body>
    <div class="page_header">
      <a href="http://git-scm.com" title="git homepage">
        <img src="images/git-logo.png" width="72" height="27" alt="git" class="logo" />
      </a>
      {if $supportedlocales}
      <div class="lang_select">
        <form action="{$SCRIPT_NAME}" method="get" id="frmLangSelect">
	{foreach from=$requestvars key=var item=val}
	<input type="hidden" name="{$var}" value="{$val}" />
	{/foreach}
	<label for="l">language:</label>
	<select name="l" id="selLang">
	  {foreach from=$supportedlocales key=locale item=language}
	    <option {if $locale == $currentlocale}selected="selected"{/if} value="{$locale}">{$language}</option>
	  {/foreach}
	</select>
	<input type="submit" value="Set" id="btnLangSet" />
	</form>
      </div>
      {/if}
      <a href="index.php">{if $homelink}{$homelink}{else}{t}projects{/t}{/if}</a> / 
      {if $project}
        <a href="{$SCRIPT_NAME}?p={$project->GetProject()|urlencode}&a=summary">{$project->GetProject()}</a>
        {if $actionlocal}
           / {$actionlocal}
        {/if}
        {if $enablesearch}
          <form method="get" action="index.php" enctype="application/x-www-form-urlencoded">
            <div class="search">
              <input type="hidden" name="p" value="{$project->GetProject()}" />
              <input type="hidden" name="a" value="search" />
              <input type ="hidden" name="h" value="{if $commit}{$commit->GetHash()}{else}HEAD{/if}" />
              <select name="st">
                <option {if $searchtype == 'commit'}selected="selected"{/if} value="commit">{t}commit{/t}</option>
                <option {if $searchtype == 'author'}selected="selected"{/if} value="author">{t}author{/t}</option>
                <option {if $searchtype == 'committer'}selected="selected"{/if} value="committer">{t}committer{/t}</option>
                {if $filesearch}
                  <option {if $searchtype == 'file'}selected="selected"{/if} value="file">{t}file{/t}</option>
                {/if}
              </select> {t}search{/t}: <input type="text" name="s" {if $search}value="{$search}"{/if} />
            </div>
          </form>
        {/if}
      {/if}
    </div>
