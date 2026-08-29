/*
SQL security lab
Topics: schemas, roles, least privilege, row-level security
*/

CREATE SCHEMA secure;
GO

CREATE TABLE secure.SalesTerritoryFact (
    SalesId       bigint PRIMARY KEY,
    TerritoryCode varchar(20) NOT NULL,
    SalesAmount   decimal(18,2) NOT NULL,
    SalesDate     date NOT NULL
);
GO

CREATE ROLE sales_reader;
CREATE ROLE sales_admin;
GO

GRANT SELECT ON SCHEMA::secure TO sales_reader;
GRANT SELECT, INSERT, UPDATE, DELETE ON SCHEMA::secure TO sales_admin;
GO

CREATE TABLE secure.UserTerritoryAccess (
    LoginName      sysname NOT NULL,
    TerritoryCode  varchar(20) NOT NULL,
    PRIMARY KEY(LoginName, TerritoryCode)
);
GO

CREATE FUNCTION secure.fn_TerritoryPredicate(@TerritoryCode varchar(20))
RETURNS TABLE
WITH SCHEMABINDING
AS
RETURN
    SELECT 1 AS access_result
    WHERE EXISTS (
        SELECT 1
        FROM secure.UserTerritoryAccess a
        WHERE a.LoginName = USER_NAME()
          AND a.TerritoryCode = @TerritoryCode
    );
GO

CREATE SECURITY POLICY secure.TerritorySecurityPolicy
ADD FILTER PREDICATE secure.fn_TerritoryPredicate(TerritoryCode)
ON secure.SalesTerritoryFact
WITH (STATE = ON);
GO

-- Discussion:
-- * USER_NAME() vs Entra identities and group-based access
-- * RLS in the database vs semantic model security
-- * Why service accounts often require a different strategy
-- * How to test privilege escalation and accidental broad grants
