<cfcomponent displayname="Forum" extends="farcry.core.packages.types.types" fualias="forum" bFriendly="true">
<!--- 
 // type properties 
--------------------------------------------------------------------------------------------------->
<cfproperty 
	name="title" type="string" hint="Forum title." required="true" default="" 
	ftSeq="1" ftFieldset="General Details" ftLabel="Title" ftvalidation="required"
	fthint="" />
		
<cfproperty 
	name="description" type="string" hint="Forum description." required="false" default="" 
	ftSeq="2" ftFieldset="General Details" ftLabel="Description" 
	fttype="longchar" ftlimit="250"
	fthint="" />


<!--- 
 // type methods 
--------------------------------------------------------------------------------------------------->

<cffunction name="getThreadCount">
	<cfargument name="forumID" required="true">
	
	<cfset var qCount = "">
	
	<cfquery name="qCount" datasource="#application.dsn#">
		SELECT COUNT(objectID) AS c
		FROM #application.dbowner#pThread
		WHERE forumID = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.forumID#">
	</cfquery>

	<cfreturn qCount.c>
</cffunction>

<cffunction name="getLastPosted">
	<cfargument name="forumID" required="true">
	
	<cfset var qPost = "">
	
	<cfquery name="qPost" datasource="#application.dsn#">
		SELECT MAX(datetimelastupdated) AS d
		FROM #application.dbowner#pThread
		WHERE forumID = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.forumID#">
	</cfquery>

	<cfreturn qPost.d>
</cffunction>

</cfcomponent>