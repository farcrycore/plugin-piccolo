<cfsetting enablecfoutputonly="true" />
<!--- @@displayname: Table Row for Thread --->

<!--- tag libraries --->
<cfimport taglib="/farcry/core/tags/webskin/" prefix="skin" />
<cfimport taglib="/farcry/core/tags/formtools/" prefix="ft" />

<cfset oProfile = application.fapi.getContentType(typename="dmProfile")>
<cfset pThread = application.fapi.getContentType(typename="pThread")>
<cfset stLastPost = application.fapi.getContentObjects(typename="pPost", lProperties="datetimecreated,createdby", threadID_eq="#stobj.objectid#", orderBy="datetimecreated DESC", maxRows="1")>

<cfoutput>
<tr class="pThreadRow">
	<td class="pThreadIcon">
		<cfif stobj.sticky>
			[sticky]
		</cfif>
	</td>
	<td class="pThreadTitle">
		<skin:buildLink objectID="#stObj.ObjectID#"><cfoutput>#stobj.title#</cfoutput></skin:buildLink>
	</td>
	<td class="pThreadPosts">
		#pThread.getPostCount(threadID=stobj.objectid)#
	</td>
	<td class="pThreadLastPost">
		#application.fapi.prettyDate(stLastPost.datetimecreated)#<br>
		by <skin:view typename="dmProfile" objectid="#oProfile.getProfileID(stLastPost.createdby)#" webskin="displayProfileLabel" /> 
	</td>
</tr>
</cfoutput>

<cfsetting enablecfoutputonly="false" />