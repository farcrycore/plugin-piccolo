<cfsetting enablecfoutputonly="true">

<cfimport taglib="/farcry/core/tags/formtools" prefix="ft" />
<cfimport taglib="/farcry/core/tags/admin/" prefix="admin" />

<!--- set up page header --->
<admin:header title="" />

<ft:objectAdmin
	title="Piccolo Forums"
	typename="forum"
	ColumnList="title,description,datetimelastupdated"
	SortableColumns=""
	lFilterFields=""
	sqlorderby="" />

<admin:footer />

<cfsetting enablecfoutputonly="no">
