<cfcomponent displayname="Thread" extends="farcry.core.packages.types.types" fualias="thread" bFriendly="true">

<cfproperty 
	name="forumID" type="uuid" hint="Parent forum." required="true" default="" 
	ftSeq="1" ftFieldset="General Details" ftLabel="Parent Forum"
	ftType="uuid" ftJoin="pForum" ftRenderType="list" />

<cfproperty 
	name="title" type="string" hint="Title string." required="true" default="" 
	ftSeq="2" ftFieldset="General Details" ftLabel="Title" ftValidation="required"
	ftHint="" />
	
</cfcomponent>