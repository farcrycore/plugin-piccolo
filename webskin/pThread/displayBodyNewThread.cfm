<!--- @@fualias: new --->

<cfimport taglib="/farcry/core/tags/webskin" prefix="skin" />
<cfimport taglib="/farcry/core/tags/formtools" prefix="ft" />

<cfset bViewThread = false>
<cfset newThreadID = "">

<!--- save new thread --->
<ft:processform action="Save">
	<ft:processformobjects typename="pThread">
		<cfset stProperties.forumID = form.forumID>
		<cfset newThreadID = stProperties.objectid>
	</ft:processformobjects>
	<ft:processformobjects typename="pPost">
		<cfset stProperties.threadID = newThreadID>
		<cfset bViewThread = true>
	</ft:processformobjects>
</ft:processform>

<!--- redirect to new thread --->
<cfif bViewThread>
	<cflocation addtoken="false" url="#application.fapi.getLink(type="pThread", objectid="#newThreadID#")#">
</cfif>


<cfoutput>
<h1>New Thread</h1>

<ft:form>
<ft:object lFields="title" typename="pThread" />
<ft:object lFields="body" typename="pPost" />
<input type="hidden" name="forumID" value="#url.forumID#">
<ft:buttonpanel>
	<ft:button value="Save" />
</ft:buttonpanel>
</ft:form>

</cfoutput>
