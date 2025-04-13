set quoted_identifier on
go
set identity_insert "Shippers" on
go
ALTER TABLE "Shippers" NOCHECK CONSTRAINT ALL
go
INSERT "Shippers"("ShipperID","CompanyName","Phone") VALUES(1,'Speedy Express','(503) 555-9831')
INSERT "Shippers"("ShipperID","CompanyName","Phone") VALUES(2,'United Package','(503) 555-3199')
INSERT "Shippers"("ShipperID","CompanyName","Phone") VALUES(3,'Federal Shipping','(503) 555-9931')
go
set identity_insert "Shippers" off
go
ALTER TABLE "Shippers" CHECK CONSTRAINT ALL
go
