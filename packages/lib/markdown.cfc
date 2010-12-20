<cfcomponent>

<cffunction name="init">

	<cfset var paths = arrayNew(1)>
	<cfset var javaloader = "">
	
	<cfset paths[1] = expandPath("/farcry/plugins/piccolo/packages/formtools/markdown/markdownj.jar")>
	<cfset javaloader = createObject("component", "farcry.core.packages.farcry.javaloader.JavaLoader").init(paths) />

	<cfset variables.mdp = javaloader.create('com.petebevin.markdown.MarkdownProcessor')>

	<cfreturn this>
</cffunction>

<cffunction name="markdownRender">
	<cfargument name="in" type="string" required="true">

	<cfreturn variables.mdp.markdown(arguments.in)>
</cffunction>

</cfcomponent>