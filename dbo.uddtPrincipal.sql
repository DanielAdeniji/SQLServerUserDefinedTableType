use master
go

/*

    drop type [udttPrincipal]

*/
declare @type sysname

set @type = 'udttPrincipal'

if not exists
    (
        select *

        from   sys.types tblST

        where  tblST.[name] = @type

    )
begin

    create type [dbo].[udttPrincipal] as table
    (
          [id]      smallint not null
            identity(1,1)

        , [name]	sysname

        , primary key
            (
                [name]
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