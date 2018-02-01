create table pdsItem(
id number not null,
fileName varchar2(100) not null,
fileSize number,
description varchar2(255)
);

select 'private '||decode(data_type,'NUMBER','int','VARCHAR2','String',data_type)||' '||lower(column_name)||';'  
from cols where table_name='PDSITEM';
select * from cols;

select * from pdsItem;

select nvl(max(id),0) from pdsItem;

select * from pdsItem order by id;