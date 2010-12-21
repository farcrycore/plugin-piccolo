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

<cfproperty 
	name="seq" type="string" hint="Forum sequence position." required="true" default="" 
	ftSeq="3" ftFieldset="General Details" ftLabel="Position"
	fthint=""
	fttype="list" ftListData="getSequence" />


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

<!--- 
 // formtool library methods 
--------------------------------------------------------------------------------------------------->
<cffunction name="getSequence">
	<cfset var q = "">
	<cfset var i = 0>
	<cfset var seqList = "">
	
	<cfquery name="q" datasource="#application.dsn#">
		SELECT count(*) AS totalForums
		FROM #application.dbowner#pForum
	</cfquery>
	
	<cfloop from="1" to="#q.totalForums#" index="i">
		<cfset seqList = listAppend(seqList, i)>
	</cfloop>

	<cfreturn seqList />
</cffunction>

</cfcomponent>