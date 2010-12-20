<cfsetting enablecfoutputonly="yes">
<!--- @@displayname: Standard Teaser for forum --->
<!--- @@author: Scaffold--->

<!--- tag libraries --->
<cfimport taglib="/farcry/core/tags/webskin/" prefix="skin">
<cfimport taglib="/farcry/core/tags/formtools/" prefix="ft">

<cfoutput>
<div class="teaser">
	<skin:buildLink objectID="#stObj.ObjectID#"><cfoutput>#stobj.title#</cfoutput></skin:buildLink>
</div>
</cfoutput>

<cfsetting enablecfoutputonly="false" />