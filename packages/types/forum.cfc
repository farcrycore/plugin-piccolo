<cfcomponent displayname="Forum" extends="farcry.core.packages.types.types" fualias="forum">

<cfproperty 
	name="title" type="string" hint="Forum title." required="true" default="" 
	ftSeq="1" ftFieldset="General Details" ftLabel="Title" ftvalidation="required"
	fthint="" />
		
<cfproperty 
	name="description" type="string" hint="Forum description." required="false" default="" 
	ftSeq="2" ftFieldset="General Details" ftLabel="Description" 
	fttype="longchar" ftlimit="250"
	fthint="" />

</cfcomponent>