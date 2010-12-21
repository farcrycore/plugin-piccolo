<cfcomponent displayname="Forum" extends="farcry.core.packages.types.types" fualias="forum" bFriendly="true">

<cfproperty 
	name="title" type="string" hint="Forum title." required="true" default="" 
	ftSeq="1" ftFieldset="General Details" ftLabel="Title" ftvalidation="required"
	fthint="" />
		
<cfproperty 
	name="description" type="string" hint="Forum description." required="false" default="" 
	ftSeq="2" ftFieldset="General Details" ftLabel="Description" 
	fttype="longchar" ftlimit="250"
	fthint="" />


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


</cfcomponent>