use master
go

/*

    drop type [udttSecurable]

*/
declare @type sysname

set @type = 'udttSecurable'

if not exists
    (
        select *

        from   sys.types tblST

        where  tblST.[name] = @type

    )
begin

    create type [dbo].[udttSecurable] as table
    (

          [id]      smallint not null
            identity(1,1)

        , [database]	sysname not null

        , [securable]		sysname not null

        , [securableType] sysname null
            default 'object'
             
        , [permission]   varchar(200) not null
        
        , primary key
            (
                  [database]
                , [securable]
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

