INSERT INTO `prescholar`.`editions`
(`EDITIONS_ID`,
`CREATED_BY`,
`CREATED_DATE`,
`EDITION_NAME`)
VALUES
(4,'TRIAL','2016-01-01 00:00:00','Trial');
INSERT INTO `prescholar`.`license_type`
(`LICENSE_TYPE_ID`,
`CREATED_BY`,
`CREATED_DATE`,
`LICENSE_NAME`
)
VALUES
(3,'test','2016-01-01 00:00:00','Trial');
INSERT INTO `prescholar`.`license`
(`LICENSE_ID`,
`CREATED_BY`,
`CREATED_DATE`,
`EDITIONS_ID`,
`LICENSE_TYPE_ID`,
`DEFAULT_RATE`
)
VALUES
(1,'test','2016-01-01 00:00:00',4,3,0);
update prescholar.license set IS_APPROVED=1 where LICENSE_ID=1;
update prescholar.editions set IS_APPROVED=1 where EDITIONS_ID=4;
update prescholar.LICENSE_TYPE set IS_APPROVED=1 where license_type_id=3;