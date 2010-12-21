<cfsetting enablecfoutputonly="true" /> 
<!--- @@Copyright: Copyright (c) 2010 Daemon Pty Limited. All rights reserved. --->
<!--- @@displayname: displayProfileLabel --->
<!--- @@description: displayProfileLabel --->
<!--- @@author: Geoffrey Bowers on 2010-12-21 --->
<!--- @@cacheStatus: 1 --->
<!--- @@cacheTimeout: 60 --->
<!--- @@fuAlias:  --->

<!--- import tag libraries --->
<cfimport taglib="/farcry/core/tags/webskin" prefix="skin" />

<!--- 
 // view
--------------------------------------------------------------------------------------------------->
<cfoutput>#stobj.label#</cfoutput>

<cfsetting enablecfoutputonly="false" />