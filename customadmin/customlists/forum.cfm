<cfsetting enablecfoutputonly="true">

<cfimport taglib="/farcry/core/tags/formtools" prefix="ft" />
<cfimport taglib="/farcry/core/tags/admin/" prefix="admin" />

<!--- set up page header --->
<admin:header title="" />

<ft:objectAdmin
	title="Piccolo Forums"
	typename="pForum"
	ColumnList="seq,title,description,datetimelastupdated"
	SortableColumns=""
	lFilterFields=""
	sqlorderby="seq ASC" />

<admin:footer />

<cfsetting enablecfoutputonly="no">
