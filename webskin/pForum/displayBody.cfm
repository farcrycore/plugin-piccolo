<cfimport taglib="/farcry/core/tags/webskin" prefix="skin" />

<cfset qThreads = application.fapi.getContentObjects(typename="pThread", forumID_eq="#stobj.objectid#")>
<cfset stParamNewThread = {	"forumID" = stobj.objectid }>

<cfoutput>
<h1>#stobj.title# - <a href="#application.fapi.getLink(type="pThread", bodyview="displayBodyNewThread", stParameters=stParamNewThread)#">New Thread</a></h1>
</cfoutput>

<cfif qThreads.recordcount gt 0>
	<cfloop query="qThreads">
		<skin:view objectid="#qThreads.objectid#" typename="pThread" template="displayTeaserStandard" />
	</cfloop>
<cfelse>
	<!--- TODO: make this into a skin --->
	<cfoutput>
	<p>This forum does not have any topics yet.</p>
	</cfoutput>
</cfif>
