<cfsetting enablecfoutputonly="yes">
<!--- @@displayname: Standard Teaser for thread --->
<!--- @@author: Scaffold--->

<!--- tag libraries --->
<cfimport taglib="/farcry/core/tags/webskin/" prefix="skin">
<cfimport taglib="/farcry/core/tags/formtools/" prefix="ft">

<cfset stParamNewPost["threadID"] = stobj.threadID>
<cfset stParamNewPost["postID"] = stobj.objectid>

<cfset oProfile = application.fapi.getContentType(typename="dmProfile")>

<cfoutput>
<div class="pPostRow">	
	<div class="fg-layout span-6">
		<div class="fg-content">
			<skin:view typename="dmProfile" objectid="#oProfile.getProfileID(stobj.createdby)#" webskin="displayProfileLabel" />
			Posted #application.fapi.prettyDate(stobj.datetimecreated)#<br />
			<a href="#application.fapi.getLink(type="pPost", bodyview="displayBodyNewReply", stParameters=stParamNewPost)#">Reply</a>
		</div>
	</div>
	<div class="fg-layout span-18">
		<div class="fg-content">
	
		<table class="pPostTable">
		<tr>
			<td class="pThreadPosts">
				<div class="pPost">
					#application.fc.lib.markdown.markdownRender(stobj.body)#
				</div>
			</td>
		</tr>
		</table>
		
		</div>
	</div>
	<div class="clear"></div>
</div>
</cfoutput>

<cfoutput>

</cfoutput>

<cfsetting enablecfoutputonly="false" />