<!--- @@fualias: new --->

<cfimport taglib="/farcry/core/tags/webskin" prefix="skin" />
<cfimport taglib="/farcry/core/tags/formtools" prefix="ft" />

<cfset bViewThread = false>

<!--- save new thread --->
<ft:processform action="Save">
	<ft:processformobjects typename="pThread">
		<cfset bViewThread = true>
	</ft:processformobjects>
</ft:processform>

<cfif bViewThread>
	<cflocation addtoken="false" url="#application.fapi.getLink(type="pThread", objectid="#stProperties.objectid#")#">
</cfif>


<cfoutput>
<h1>New Thread</h1>

<ft:form>
<ft:object lFields="title,body" typename="pThread" />
<input type="hidden" name="forumID" value="#url.forumID#">
<ft:buttonpanel>
	<ft:button value="Save" />
</ft:buttonpanel>
</ft:form>

</cfoutput>

