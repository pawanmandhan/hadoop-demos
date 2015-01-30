A = LOAD '/flume/events/root/demo-data/' using PigStorage('|','-tagFile');
B = foreach A generate $0, count($0); 
C = DISTINCT B;

DUMP C;
