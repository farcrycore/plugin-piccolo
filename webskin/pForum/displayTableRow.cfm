<cfsetting enablecfoutputonly="yes">
<!--- @@displayname: Standard Teaser for forum --->

<!--- tag libraries --->
<cfimport taglib="/farcry/core/tags/webskin/" prefix="skin">
<cfimport taglib="/farcry/core/tags/formtools/" prefix="ft">

<cfset pForum = application.fapi.getContentType(typename="pForum")>

<cfoutput>
<tr class="pForumRow">
	<td class="pForumTitle">
		<skin:buildLink objectID="#stObj.ObjectID#"><cfoutput>#stobj.title#</cfoutput></skin:buildLink>
		<p>#stobj.description#</p>
	</td>
	<td class="pForumThreads">
		#pForum.getThreadCount(forumID=stobj.objectid)#
	</td>
</tr>
</cfoutput>

<cfsetting enablecfoutputonly="false" />