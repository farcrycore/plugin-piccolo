<cfimport taglib="/farcry/core/tags/webskin" prefix="skin" />
<cfset qPosts = application.fapi.getContentObjects(typename="pPost",threadID_eq="#stobj.objectid#")>
<cfset stParamNewPost = { "threadID" = stobj.objectid }>


<cfoutput>
<h1>#stobj.title# - <a href="#application.fapi.getLink(type="pPost", bodyview="displayBodyNewReply", stParameters=stParamNewPost)#">New Reply</a></h1>

<cfloop query="qPosts">
<cfset stPost = application.fapi.getContentObject(typename="pPost",objectid="#qPosts.objectid#")>
<div class="pPost">
	#application.fc.lib.markdown.markdownRender(stPost.body)#
</div>
</cfloop>

</cfoutput>
