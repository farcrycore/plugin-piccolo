<cfimport taglib="/farcry/core/tags/webskin" prefix="skin" />
<cfset qPosts = application.fapi.getContentObjects(typename="pPost",threadID_eq="#stobj.objectid#",orderBy="datetimecreated ASC")>
<cfset stParamNewPost = { "threadID"=stobj.objectid, "postID"=qPosts.objectid }>

<cfoutput>
<p><a href="/">Forums</a> &raquo; <skin:view typename="pForum" objectid="#stobj.forumid#" webskin="displayLabel" /></p>

<h1>#stobj.title# - <a href="#application.fapi.getLink(type="pPost", bodyview="displayBodyNewReply", stParameters=stParamNewPost)#">New Reply</a></h1>

<div class="pThread">
<cfloop query="qPosts">
	<cfset stPost = application.fapi.getContentObject(typename="pPost",objectid="#qPosts.objectid#")>
	<skin:view stobject="#stPost#" objectid="#qPosts.objectid#" typename="pPost" template="displayTableRow" />
</cfloop>
</div>

</cfoutput>
