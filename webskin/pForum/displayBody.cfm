<!--- @@displayname: Basic Forum Thread List --->

<cfimport taglib="/farcry/core/tags/webskin" prefix="skin" />

<cfset qThreads = application.fapi.getContentObjects(typename="pThread", forumID_eq="#stobj.objectid#", orderBy="sticky DESC, datetimelastpost DESC")>
<cfset stParamNewThread = {	"forumID" = stobj.objectid }>

<cfoutput>
<p><a href="/">Forums</a> &raquo; #stobj.title#</p>

<h1>#stobj.title# - <a href="#application.fapi.getLink(type="pThread", bodyview="displayBodyNewThread", stParameters=stParamNewThread)#">New Thread</a></h1>

<cfif qThreads.recordcount gt 0>
	<table class="pTable" cellpadding="0" cellspacing="0">
	<tr>
		<th class="pThreadIcon">
			&nbsp;
		</th>
		<th class="pThreadTitle">
			<strong>Title</strong>
		</th>
		<th class="pThreadPosts">
			<strong>Posts</strong>
		</th>
		<th class="pThreadLastPost">
			<strong>Last Post</strong>
		</th>
	</tr>
	<cfloop query="qThreads">
		<skin:view objectid="#qThreads.objectid#" typename="pThread" template="displayTableRow" />
	</cfloop>
	</table>
<cfelse>
	<!--- TODO: make this into a skin --->
	<cfoutput>
	<p>This forum does not have any topics yet.</p>
	</cfoutput>
</cfif>

</cfoutput>