<cfimport taglib="/farcry/core/tags/webskin" prefix="skin" />

<cfset qThreads = application.fapi.getContentObjects(typename="thread")>
<cfset stParamNewThread = {	"forumID" = stobj.objectid }>

<cfoutput>
<h1>#stobj.title# - <a href="#application.fapi.getLink(type="thread", bodyview="displayBodyNewThread", stParameters=stParamNewThread)#">New Thread</a></h1>
</cfoutput>

<cfloop query="qThreads">
	<skin:view objectid="#qThreads.objectid#" typename="thread" template="displayTeaserStandard" />
</cfloop>

