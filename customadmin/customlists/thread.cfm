<cfsetting enablecfoutputonly="true">

<cfimport taglib="/farcry/core/tags/formtools" prefix="ft" />
<cfimport taglib="/farcry/core/tags/admin/" prefix="admin" />

<!--- set up page header --->
<admin:header title="" />

<ft:objectAdmin
	title="Piccolo Threads"
	typename="pThread"
	ColumnList="sticky,title,createdby,datetimecreated,datetimelastupdated"
	SortableColumns="datetimecreated,datetimelastupdated"
	lFilterFields="title"
	sqlorderby="datetimecreated" />

<admin:footer />

<cfsetting enablecfoutputonly="no">
