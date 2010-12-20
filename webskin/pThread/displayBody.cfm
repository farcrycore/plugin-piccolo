<cfimport taglib="/farcry/core/tags/webskin" prefix="skin" />

<cfset qThreads = application.fapi.getContentObjects(typename="pThread")>
<cfset stParamNewThread = {	"forumID" = stobj.objectid }>

<cfoutput>
<h1>#stobj.title# - <a href="#application.fapi.getLink(type="pPost", bodyview="displayBodyNewReply", stParameters=stParamNewThread)#">New Reply</a></h1>

<div class="pPost">
	#application.fc.lib.markdown.markdownRender(stobj.body)#
</div>
</cfoutput>
