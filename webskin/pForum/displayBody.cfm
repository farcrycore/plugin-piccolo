<cfimport taglib="/farcry/core/tags/webskin" prefix="skin" />

<cfset qThreads = application.fapi.getContentObjects(typename="pThread")>
<cfset stParamNewThread = {	"forumID" = stobj.objectid }>

<cfoutput>
<h1>#stobj.title# - <a href="#application.fapi.getLink(type="pThread", bodyview="displayBodyNewThread", stParameters=stParamNewThread)#">New Thread</a></h1>
</cfoutput>

<cfloop query="qThreads">
	<skin:view objectid="#qThreads.objectid#" typename="pThread" template="displayTeaserStandard" />
</cfloop>

