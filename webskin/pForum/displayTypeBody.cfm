<cfimport taglib="/farcry/core/tags/webskin" prefix="skin" />

<cfset qForums = application.fapi.getContentObjects(typename="pForum")>

<cfoutput>
<h1>Forums</h1>
</cfoutput>

<cfloop query="qForums">
	<skin:view objectid="#qForums.objectid#" typename="pForum" template="displayTeaserStandard" />
</cfloop>

