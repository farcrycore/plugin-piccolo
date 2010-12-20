<cfcomponent displayname="Thread" extends="farcry.core.packages.types.types" fualias="thread">

<cfproperty 
	name="forumID" type="uuid" hint="Parent forum." required="true" default="" 
	ftSeq="1" ftFieldset="General Details" ftLabel="Parent Forum"
	fttype="uuid" ftjoin="forum" ftRenderType="list" />

<cfproperty 
	name="title" type="string" hint="Title string." required="true" default="" 
	ftSeq="2" ftFieldset="General Details" ftLabel="Title" ftvalidation="required"
	fthint="" />
	
<cfproperty 
	name="body" type="longchar" hint="Teaser" required="false" default="" 
	ftSeq="3" ftFieldset="General Details" ftLabel="Body (DELETE ME)"
	fttype="markdown" />

</cfcomponent>