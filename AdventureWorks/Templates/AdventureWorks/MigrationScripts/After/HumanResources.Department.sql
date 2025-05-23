DECLARE @data VARCHAR(MAX) = '[
  {
    "DepartmentID": 1,
    "Name": "Engineering",
    "GroupName": "Research and Development",
    "ModifiedDate": "2008-04-30T00:00:00"
  },
  {
    "DepartmentID": 2,
    "Name": "Tool Design",
    "GroupName": "Research and Development",
    "ModifiedDate": "2008-04-30T00:00:00"
  },
  {
    "DepartmentID": 3,
    "Name": "Sales",
    "GroupName": "Sales and Marketing",
    "ModifiedDate": "2008-04-30T00:00:00"
  },
  {
    "DepartmentID": 4,
    "Name": "Marketing",
    "GroupName": "Sales and Marketing",
    "ModifiedDate": "2008-04-30T00:00:00"
  },
  {
    "DepartmentID": 5,
    "Name": "Purchasing",
    "GroupName": "Inventory Management",
    "ModifiedDate": "2008-04-30T00:00:00"
  },
  {
    "DepartmentID": 6,
    "Name": "Research and Development",
    "GroupName": "Research and Development",
    "ModifiedDate": "2008-04-30T00:00:00"
  },
  {
    "DepartmentID": 7,
    "Name": "Production",
    "GroupName": "Manufacturing",
    "ModifiedDate": "2008-04-30T00:00:00"
  },
  {
    "DepartmentID": 8,
    "Name": "Production Control",
    "GroupName": "Manufacturing",
    "ModifiedDate": "2008-04-30T00:00:00"
  },
  {
    "DepartmentID": 9,
    "Name": "Human Resources",
    "GroupName": "Executive General and Administration",
    "ModifiedDate": "2008-04-30T00:00:00"
  },
  {
    "DepartmentID": 10,
    "Name": "Finance",
    "GroupName": "Executive General and Administration",
    "ModifiedDate": "2008-04-30T00:00:00"
  },
  {
    "DepartmentID": 11,
    "Name": "Information Services",
    "GroupName": "Executive General and Administration",
    "ModifiedDate": "2008-04-30T00:00:00"
  },
  {
    "DepartmentID": 12,
    "Name": "Document Control",
    "GroupName": "Quality Assurance",
    "ModifiedDate": "2008-04-30T00:00:00"
  },
  {
    "DepartmentID": 13,
    "Name": "Quality Assurance",
    "GroupName": "Quality Assurance",
    "ModifiedDate": "2008-04-30T00:00:00"
  },
  {
    "DepartmentID": 14,
    "Name": "Facilities and Maintenance",
    "GroupName": "Executive General and Administration",
    "ModifiedDate": "2008-04-30T00:00:00"
  },
  {
    "DepartmentID": 15,
    "Name": "Shipping and Receiving",
    "GroupName": "Inventory Management",
    "ModifiedDate": "2008-04-30T00:00:00"
  },
  {
    "DepartmentID": 16,
    "Name": "Executive",
    "GroupName": "Executive General and Administration",
    "ModifiedDate": "2008-04-30T00:00:00"
  }
]'

MERGE INTO HumanResources.Department AS Target
USING (
    SELECT *
    FROM OPENJSON(@data)
    WITH (
        DepartmentID smallint,
        Name nvarchar(50),
        GroupName nvarchar(50),
        ModifiedDate datetime
    )
) AS Source
ON Target.DepartmentID = Source.DepartmentID
WHEN MATCHED THEN
    UPDATE SET
        Name = Source.Name,
        GroupName = Source.GroupName,
        ModifiedDate = Source.ModifiedDate
WHEN NOT MATCHED THEN
    INSERT (Name, GroupName, ModifiedDate)
    VALUES (Source.Name, Source.GroupName, Source.ModifiedDate);