<cfsetting enablecfoutputonly="true" /> 
<!--- @@Copyright: Copyright (c) 2010 Daemon Pty Limited. All rights reserved. --->
<!--- @@displayname: RSS Feed --->
<!--- @@description: Type webskin for RSS feed for the latest posts for a thread --->
<!--- @@viewStack: ajax --->
<!--- @@viewBinding: type --->
<!--- @@cacheStatus: 1 --->
<!--- @@cacheTimeout: 15 --->
<!--- @@fualias: rss --->

<!--- deactivate the tray --->
<cfset request.bHideContextMenu = true />

<cfset qposts = application.fapi.getcontentobjects(typename="pPost",lproperties="objectid,label,body,datetimelastupdated",orderby="datetimelastupdated DESC",maxrows="30",threadid_eq=stobj.objectid) />

<!--- <cfdump var="#qPosts#">
<cfabort /> --->

<cfset qFeed = queryNew("title, content, publisheddate, rsslink") />
<cfloop query="qposts">
	<cfset queryaddrow(qFeed, 1) />
	<cfset querysetcell(qFeed, "title", left(xmlFormat(qPosts.body), 30)) />
	<cfset querysetcell(qFeed, "content", left(xmlFormat(qPosts.body), 300)) />
	<cfset querysetcell(qFeed, "publisheddate", qPosts.datetimelastupdated) />
	<cfset querysetcell(qFeed, "rsslink", application.fapi.getLink(objectid=stobj.objectid, view="displayPageStandard")) />
</cfloop>

<!--- Set the feed metadata. --->
<!--- TODO	need to pick up this metadata from a config somewhere --->
<cfset stprop = StructNew() />
<cfset stprop.title = "Piccolo Forum" />
<cfset stprop.link = "http://piccolo.local/" />
<cfset stprop.description = "The lastest updates to this here thread." />
<cfset stprop.version = "rss_2.0" />

<!--- Create the feed. --->
<cffeed 
	action="create"
	query="#qFeed#"
	properties="#stProp#"
	xmlvar="rssXML" />

<cfcontent reset="true" /><cfoutput>#rssXML#</cfoutput>


<!---<cfdump var="#XMLParse(rssXML)#">--->



<cfsetting enablecfoutputonly="false" />