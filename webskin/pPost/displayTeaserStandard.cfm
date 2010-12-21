<cfsetting enablecfoutputonly="yes">
<!--- @@displayname: Standard Teaser for thread --->
<!--- @@author: Scaffold--->

<!--- tag libraries --->
<cfimport taglib="/farcry/core/tags/webskin/" prefix="skin">
<cfimport taglib="/farcry/core/tags/formtools/" prefix="ft">

<cfset stParamNewPost["threadID"] = stobj.threadID>
<cfset stParamNewPost["postID"] = stobj.objectid>

<cfoutput>
<div class="pPost">
	#application.fc.lib.markdown.markdownRender(stobj.body)#
	<a href="#application.fapi.getLink(type="pPost", bodyview="displayBodyNewReply", stParameters=stParamNewPost)#">New Reply</a>
</div>
</cfoutput>

<cfsetting enablecfoutputonly="false" />