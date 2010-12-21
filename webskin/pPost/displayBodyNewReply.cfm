<!--- @@fualias: reply --->

<cfimport taglib="/farcry/core/tags/webskin" prefix="skin" />
<cfimport taglib="/farcry/core/tags/formtools" prefix="ft" />

<cfparam name="url.postID" default="">


<cfset bViewThread = false>

<!--- save new thread --->
<ft:processform action="Reply">
	<ft:processformobjects typename="pPost">
		<cfset stProperties.threadID = form.threadID>
		<cfset stProperties.postID = form.postID>
		<cfset bViewThread = true>
	</ft:processformobjects>
</ft:processform>

<!--- redirect to new thread --->
<cfif bViewThread>
	<cflocation addtoken="false" url="#application.fapi.getLink(type="pThread", objectid="#form.threadID#")#">
</cfif>


<cfoutput>
<h1>New Reply</h1>

<ft:form>
<ft:object lFields="body" typename="pPost" />
<input type="hidden" name="threadID" value="#url.threadID#">
<input type="hidden" name="postID" value="#url.postID#">
<ft:buttonpanel>
	<ft:button value="Reply" />
</ft:buttonpanel>
</ft:form>

</cfoutput>
