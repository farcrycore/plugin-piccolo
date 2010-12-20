<!--- @@description:
	<p>Displays markdown editor using markItUp! (http://markitup.jaysalvat.com)</p> --->

<!--- @@examples:
	<p>Example ...</p>
	<code>
	<cfproperty 
		name="Body" type="longchar" hint="Main body of content." required="no" default="" 
		ftSeq="12" ftwizardStep="Body" ftFieldset="Body" ftLabel="Body" 
		ftType="markdown" 
	/>
	</code>
--->
<cfcomponent extends="farcry.core.packages.formtools.field" name="markdown" displayname="Markdown Editor" hint="Used to liase with longchar type fields"> 
	
	<cfproperty name="ftLabelAlignment" required="false" default="inline" options="inline,block" hint="Used by FarCry Form Layouts for positioning of labels. inline or block." />
	<cfproperty name="ftWidth" required="false" default="100%" hint="Width required for the rich text editor." />
	<cfproperty name="ftHeight" required="false" default="280px" hint="Height required for the rich text editor." />

	
	<cffunction name="edit" access="public" output="true" returntype="string" hint="his will return a string of formatted HTML text to enable the user to edit the data">
		<cfargument name="typename" required="true" type="string" hint="The name of the type that this field is part of.">
		<cfargument name="stObject" required="true" type="struct" hint="The object of the record that this field is part of.">
		<cfargument name="stMetadata" required="true" type="struct" hint="This is the metadata that is either setup as part of the type.cfc or overridden when calling ft:object by using the stMetadata argument.">
		<cfargument name="fieldname" required="true" type="string" hint="This is the name that will be used for the form field. It includes the prefix that will be used by ft:processform.">
				
		<cfset var html = "" />	
		<cfset var oType = application.fapi.getContentType(arguments.typename) />
		
		<!--- IMPORT TAG LIBRARIES --->
		<cfimport taglib="/farcry/core/tags/webskin" prefix="skin" />
				
			
		<skin:loadJS id="jquery" />
		
		<cfsavecontent variable="html">
			<cfoutput>
				<script type="text/javascript" src="/piccolo/js/markitup/jquery.markitup.js"></script>
				<script type="text/javascript" src="/piccolo/js/markitup/sets/markdown/set.js"></script>

				<link rel="stylesheet" type="text/css" href="/piccolo/js/markitup/skins/markitup/style.css" />
				<link rel="stylesheet" type="text/css" href="/piccolo/js/markitup/sets/markdown/style.css" />

				<script language="javascript" type="text/javascript">
					$(document).ready(function() {
						$(".markItUp").markItUp(mySettings);
					});
				</script>
				
				<div class="clear" style="text-align: left;">
					<textarea name="#arguments.fieldname#" id="#arguments.fieldname#" class="markItUp textareaInput #arguments.stMetadata.ftClass#" style="width: 100%; #arguments.stMetadata.ftStyle#" cols="80" rows="20">#arguments.stMetadata.value#</textarea>
					<div class="clear"></div>
				</div>
			</cfoutput>
		</cfsavecontent>
		
		<cfreturn html>
	</cffunction>

	<cffunction name="display" access="public" output="false" returntype="string" hint="This will return a string of formatted HTML text to display.">
		<cfargument name="typename" required="true" type="string" hint="The name of the type that this field is part of.">
		<cfargument name="stObject" required="true" type="struct" hint="The object of the record that this field is part of.">
		<cfargument name="stMetadata" required="true" type="struct" hint="This is the metadata that is either setup as part of the type.cfc or overridden when calling ft:object by using the stMetadata argument.">
		<cfargument name="fieldname" required="true" type="string" hint="This is the name that will be used for the form field. It includes the prefix that will be used by ft:processform.">

		<cfset var html = "" />
		
		<cfsavecontent variable="html">
			<!--- Place custom code here! --->
			<cfoutput>#ReplaceNoCase(arguments.stMetadata.value, chr(10), "<br>" , "All")#</cfoutput>
			
		</cfsavecontent>
		
		<cfreturn html>
	</cffunction>

	<cffunction name="validate" access="public" output="true" returntype="struct" hint="This will return a struct with bSuccess and stError">
		<cfargument name="stFieldPost" required="true" type="struct" hint="The fields that are relevent to this field type.It consists of value and stSupporting">
		<cfargument name="stMetadata" required="true" type="struct" hint="This is the metadata that is either setup as part of the type.cfc or overridden when calling ft:object by using the stMetadata argument.">
		
		<cfset var stResult = structNew()>		
		<cfset stResult.bSuccess = true>
		<cfset stResult.value = stFieldPost.Value>
		<cfset stResult.stError = StructNew()>
		
		<!--- --------------------------- --->
		<!--- Perform any validation here --->
		<!--- --------------------------- --->

		
		<!--- ----------------- --->
		<!--- Return the Result --->
		<!--- ----------------- --->
		<cfreturn stResult>
		
	</cffunction>


</cfcomponent>