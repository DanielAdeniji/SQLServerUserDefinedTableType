use master
go

/*

    drop type [udttForeignKey]

*/
declare @type sysname

set @type = 'udttForeignKey'

if not exists
    (
        select *

        from   sys.types tblST

        where  tblST.[name] = @type

    )
begin

    create type [dbo].[udttForeignKey] as table
    (

          [id]      smallint not null
            identity(1,1)

		, [schemaParent] sysname not null

        , [tableParent]  sysname not null

		, [foreignKeyColumnsParent] nvarchar(max) not null

		, [schemaReferenced] sysname not null
        , [tableReferenced]  sysname not null
		, [foreignKeyColumnsReferenced] nvarchar(max) not null

        , [name]	sysname not null

        , primary key
            (
                  [schemaParent]
                , [tableParent]

                , [schemaReferenced]
                , [tableReferenced]
 
                , [name]
   
            )
            WITH 
            (
                IGNORE_DUP_KEY = ON
            )
            
            
        , unique 
            (
                [id]
            )
            WITH 
            (
                IGNORE_DUP_KEY = ON
            )
            
    ) 

end
go

