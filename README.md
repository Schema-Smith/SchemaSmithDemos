# SchemaSmithDemos

## Overview

The SchemaSmithDemos repository is a collection of well known, freely avaiable, sql server sample database definitions modified to be deployed by [Schema Quench](https://github.com/Schema-Smith/SchemaSmithyFree).

Each demo is self contained in one of the following subfolders

| Demo           | Source location                                    | Status |
| -------------- | -------------------------------------------------- | ------ |
| Northwind      | [Northwind pubs](https://raw.githubusercontent.com/microsoft/sql-server-samples/master/samples/databases/northwind-pubs/instnwnd.sql)                  | Done |
| AdventureWorks | [AdventureWorks OLTP Scripts](https://github.com/Microsoft/sql-server-samples/releases/download/adventureworks/AdventureWorks-oltp-install-script.zip) | Done |

## Quick Start Guide

Each demo has an associated docker service associated with it.  To deploy the full stack on windows or mac run the following from the root of the repository:

```bash
docker compose pull
docker compose up
```

## Additional Resources

Checkout our [wiki](https://github.com/Schema-Smith/SchemaSmithyFree/wiki) for documentation about how these tools work to make deploying sql server schema effortless.
