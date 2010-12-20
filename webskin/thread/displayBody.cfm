<cfimport taglib="/farcry/core/tags/webskin" prefix="skin" />

<cfset qThreads = application.fapi.getContentObjects(typename="thread")>
<cfset stParamNewThread = {	"forumID" = stobj.objectid }>

<cfoutput>
<h1>#stobj.title# - <a href="#application.fapi.getLink(type="post", bodyview="displayBodyNewReply", stParameters=stParamNewThread)#">New Reply</a></h1>

<div class="pPost">

	<cfset paths = arrayNew(1)>
	<cfset paths[1] = expandPath("/farcry/plugins/piccolo/packages/formtools/markdown/markdownj.jar")>
	<cfset loader = createObject("component", "farcry.core.packages.farcry.javaloader.JavaLoader").init(paths) />
	<cfset markdownprocessor = loader.create('com.petebevin.markdown.MarkdownProcessor')>

	<cfset out = markdownprocessor.markdown(stobj.body)>

	#out#

</div>
</cfoutput>
