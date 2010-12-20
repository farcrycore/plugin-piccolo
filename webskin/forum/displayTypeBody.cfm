<cfimport taglib="/farcry/core/tags/webskin" prefix="skin" />

<cfset qForums = application.fapi.getContentObjects(typename="forum")>

<cfoutput>
<h1>Forums</h1>
</cfoutput>

<cfloop query="qForums">
	<skin:view objectid="#qForums.objectid#" typename="forum" template="displayTeaserStandard" />
</cfloop>

