<cfcomponent displayname="Post" extends="farcry.core.packages.types.types" fualias="post" bUseInTree="true">

<cfproperty 
	name="threadID" type="uuid" hint="Parent thread." required="true" default="" 
	ftSeq="1" ftFieldset="General Details" ftLabel="Parent Thread"
	ftType="uuid" ftJoin="pThread" ftRenderType="list" />

<cfproperty 
	name="body" type="longchar" hint="Post body content." required="false" default="" 
	ftSeq="2" ftFieldset="General Details" ftLabel="Body"
	ftType="markdown" />

</cfcomponent>