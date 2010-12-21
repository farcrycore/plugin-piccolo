<cfsetting enablecfoutputonly="true" /> 
<!--- @@Copyright: Copyright (c) 2010 Daemon Pty Limited. All rights reserved. --->
<!--- @@displayname: displayLabel --->
<!--- @@description: displayLabel --->
<!--- @@author: Geoffrey Bowers on 2010-12-21 --->
<!--- @@cacheStatus: 1 --->
<!--- @@cacheTimeout: 60 --->
<!--- @@fuAlias:  --->

<!--- import tag libraries --->
<cfimport taglib="/farcry/core/tags/webskin" prefix="skin" />

<!--- 
 // view
--------------------------------------------------------------------------------------------------->
<cfoutput><a href="#application.fapi.getLink(typename="pForum", objectid=stobj.objectid)#">#stobj.title#</a></cfoutput>

<cfsetting enablecfoutputonly="false" />