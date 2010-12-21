<cfimport taglib="/farcry/core/tags/webskin" prefix="skin" />

<cfset qForums = application.fapi.getContentObjects(typename="pForum")>

<cfoutput>
<h1>Forums</h1>

<cfif qForums.recordcount gt 0>
	<table class="pTable" cellpadding="0" cellspacing="0">
	<tr>
		<th class="pForumTitle">
			<strong>Forums</strong>
		</th>
		<th class="pForumThreads">
			<strong>Threads</strong>
		</th>
		<th class="pForumLastPost">
			<strong>Last Posted</strong>
		</th>
	</tr>
	<cfloop query="qForums">
		<skin:view objectid="#qForums.objectid#" typename="pForum" template="displayTableRow" />
	</cfloop>
	</table>
<cfelse>
	<!--- TODO: make this into a skin --->
	<cfoutput>
	<p>This site does not have any forums yet.</p>
	</cfoutput>
</cfif>

</cfoutput>
