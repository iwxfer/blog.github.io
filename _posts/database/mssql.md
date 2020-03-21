# MS SQL Server

## Backup

```sql
BACKUP DATABASE [PRB_RPT] FROM DISK='\\remote.com\share\reports.bak';
```

```sql
USE master;
RESTORE DATABASE [PRB_RPT] FROM DISK='C:\tmp\reports.bak' WITH REPLACE,
MOVE 'PRB_RPT' TO 'C:\tmp\PRB_RPT.mdf',
MOVE 'PRB_RPT_log' TO 'C:\tmp\PRB_RPT_log.ldf';
```
