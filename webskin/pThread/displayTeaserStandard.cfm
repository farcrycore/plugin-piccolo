<cfsetting enablecfoutputonly="yes">
<!--- @@displayname: Standard Teaser for thread --->
<!--- @@author: Scaffold--->

<!--- tag libraries --->
<cfimport taglib="/farcry/core/tags/webskin/" prefix="skin">
<cfimport taglib="/farcry/core/tags/formtools/" prefix="ft">

<cfset pThread = application.fapi.getContentType(typename="pThread")>
<cfset stLastPost = application.fapi.getContentObjects(typename="pPost", lProperties="datetimecreated,createdby", threadID_eq="#stobj.objectid#", orderBy="datetimecreated DESC", maxRows="1")>

<cfoutput>
<tr class="pThreadRow">
	<td class="pThreadTitle">
		<skin:buildLink objectID="#stObj.ObjectID#"><cfoutput>#stobj.title#</cfoutput></skin:buildLink>
	</td>
	<td class="pThreadPosts">
		#pThread.getPostCount(threadID=stobj.objectid)#
	</td>
	<td class="pThreadLastPost">
		#application.fapi.prettyDate(stLastPost.datetimecreated)#
		by #stLastPost.createdby#
	</td>
</tr>
</cfoutput>

<cfsetting enablecfoutputonly="false" />