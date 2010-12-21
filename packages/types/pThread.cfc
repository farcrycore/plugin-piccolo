<cfcomponent displayname="Thread" extends="farcry.core.packages.types.types" fualias="thread" bFriendly="true">

<!--- 
 // type properties 
--------------------------------------------------------------------------------------------------->
<cfproperty 
	name="forumID" type="uuid" hint="Parent forum." required="true" default="" 
	ftSeq="1" ftFieldset="General Details" ftLabel="Parent Forum"
	ftType="uuid" ftJoin="pForum" ftRenderType="list" />

<cfproperty 
	name="title" type="string" hint="Title string." required="true" default="" 
	ftSeq="2" ftFieldset="General Details" ftLabel="Title" ftValidation="required"
	ftHint="" />

<cfproperty 
	name="sticky" type="boolean" hint="Flag for sticky threads." required="true" default="0" 
	ftSeq="3" ftFieldset="General Details" ftLabel="Sticky"
	ftHint="" />

<!--- 
 // type methods
--------------------------------------------------------------------------------------------------->
<cffunction name="getPostCount">
	<cfargument name="threadID" required="true">
	
	<cfset var qCount = "">
	
	<cfquery name="qCount" datasource="#application.dsn#">
		SELECT COUNT(objectID) AS c
		FROM #application.dbowner#pPost
		WHERE threadID = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.threadID#">
	</cfquery>

	<cfreturn qCount.c>
</cffunction>

	
</cfcomponent>