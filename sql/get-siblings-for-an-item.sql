declare @itemId bigint = 3

declare @tempTable table 
(
    Id int, 
    name nvarchar(100)
)

insert into @tempTable values 
(1, 'Item1'),
(2, 'Item2'),
(3, 'Item3'),
(4, 'Item4'),
(5, 'Item5')

;with ctx as(
SELECT 
    Id, 
    Name, 
    ROW_NUMBER() over (order by Id) rowNumber
FROM @tempTable
) 
select 
    ctx.Id
    ,ctx.Name
    ,
    cast(
        case 
            when item.rowNumber > ctx.rowNumber
                then -1
            when item.rowNumber < ctx.rowNumber
                then 1
            else 0
        end
        as int
    ) as SiblingOrder
    --,item.rowNumber as rowNumber2
from ctx
cross apply
(
    select 
        rowNumber 
    from ctx 
    where Id = @itemId 
) item
where ctx.rowNumber in 
(
    item.rowNumber -1, 
    item.rowNumber + 1
)
