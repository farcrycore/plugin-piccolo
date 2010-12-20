<cfcomponent displayname="Thread" extends="farcry.core.packages.types.types">

<cfproperty name="forumID" type="string" ftType="UUID" ftRenderType="list" ftJoin="forum">
<cfproperty name="title" type="string">
<cfproperty name="body" type="longchar" ftType="markdown">

</cfcomponent>