<cfcomponent displayname="Post" extends="farcry.core.packages.types.types" fualias="post" bUseInTree="true">

<cfproperty 
	name="threadID" type="uuid" hint="Parent thread." required="true" default="" 
	ftSeq="1" ftFieldset="General Details" ftLabel="Parent Thread"
	ftType="uuid" ftJoin="pThread" ftRenderType="list" />

<cfproperty 
	name="body" type="longchar" hint="Post body content." required="true" default="" 
	ftSeq="2" ftFieldset="General Details" ftLabel="Body"
	ftType="markdown" />


<cffunction name="afterSave">
	<cfargument name="stProperties" required="yes" type="struct" hint="A structure containing the contents of the properties that were saved to the object.">

	<cfset var parentPost = "">
	<cfset var qRootNode = "">
	<cfset var qChildren = "">
	<cfset var position = "">
	<cfset var stReturn = "">
		
	<!--- update nested tree graph for post threading --->
	<cfif structKeyExists(arguments.stProperties, "postID") AND arguments.stProperties.postID neq "">
		<cfset parentPost = arguments.stProperties.postID>
	<cfelse>
		<cfset qRootNode = application.factory.oTree.getRootNode(typename="pPost")>
		<cfset parentPost = qRootNode.objectid>
	</cfif>

	<cfset qChildren = application.factory.oTree.getChildren(objectid=parentPost,typename='pPost')>
	<cfset position = qChildren.recordCount + 1>
	<cfset stReturn = application.factory.oTree.setChild(objectName=left(arguments.stProperties.body,24),typename='pPost',parentID=parentPost,objectID=arguments.stProperties.objectid,pos=position)>

</cffunction>


</cfcomponent>