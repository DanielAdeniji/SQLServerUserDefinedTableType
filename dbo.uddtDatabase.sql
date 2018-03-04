use master
go

/*

    drop type [udttDatabase]

*/
declare @type sysname

set @type = 'udttDatabase'

if not exists
    (
        select *

        from   sys.types tblST

        where  tblST.[name] = @type

    )
begin

    create type [dbo].[udttDatabase] as table
    (

          [id]      smallint not null
            identity(1,1)

        , [name]	sysname

		, [dbid]   as
			  case 
					when [name] = 'Resource DB' then 32767
					else db_id([name])
			  end
			  	
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