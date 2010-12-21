<cfcomponent displayname="Post" extends="farcry.core.packages.types.types" fualias="post" bUseInTree="true">

<cfproperty 
	name="threadID" type="uuid" hint="Parent thread." required="true" default="" 
	ftSeq="1" ftFieldset="General Details" ftLabel="Parent Thread"
	ftType="uuid" ftJoin="pThread" ftRenderType="list" />

<cfproperty 
	name="body" type="longchar" hint="Post body content." required="true" default="" 
	ftSeq="2" ftFieldset="General Details" ftLabel="Body"
	ftType="markdown" />

<!--- 

<cffunction name="afterSave">

<cfscript>
	qChildren = application.factory.oTree.getChildren(objectid=arguments.parentID,typename='dmCategory');
	position = qChildren.recordCount + 1;
	stReturn = application.factory.oTree.setChild(objectName=arguments.categoryLabel,typename='dmCategory',parentID=arguments.parentID,objectID=arguments.categoryID,pos=position);

	stStatus.message = '#arguments.categoryLabel# successfully added';
	stStatus.status = true;
</cfscript>


</cffunction>
 --->


</cfcomponent>