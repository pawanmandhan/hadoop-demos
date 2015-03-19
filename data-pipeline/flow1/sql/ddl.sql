
create database demomysql;

use demomysql;

create table sv_aggregate(
studyid VARCHAR(255),
visit VARCHAR(255), 
year BIGINT,
month BIGINT,
visit_count BIGINT
) ;


create user 'demouser' identified by 'demopwd';

GRANT ALL PRIVILEGES ON demouser.* TO 'demouser'@'%' WITH GRANT OPTION;

