//import products
LOAD CSV WITH HEADERS FROM 'file:///demos/northwind/csv/products.csv' AS row
MERGE (n:Product {productID: row.productID})
ON CREATE SET n = row,
n.uuid = randomUUID(),
n.unitPrice = toFloat(row.unitPrice),
n.unitsInStock = toInteger(row.unitsInStock), n.unitsOnOrder = toInteger(row.unitsOnOrder),
n.reorderLevel = toInteger(row.reorderLevel), n.discontinued = (row.discontinued <> '0');

//import categories
LOAD CSV WITH HEADERS FROM 'file:///demos/northwind/csv/categories.csv' AS row
MERGE (n:Category {categoryID: row.categoryID})
  ON CREATE SET n = row,
  n.uuid = randomUUID();

//import suppliers
LOAD CSV WITH HEADERS FROM 'file:///demos/northwind/csv/suppliers.csv' AS row
MERGE (n:Supplier {suplierID: row.supplierID})
  ON CREATE SET n = row,
  n.uuid = randomUUID();
//import customers
LOAD CSV WITH HEADERS FROM 'file:///demos/northwind/csv/customers.csv' AS row
MERGE (n:Customer {customerID: row.customerID})
  ON CREATE SET n = row,
  n.uuid = randomUUID();
//import orders
LOAD CSV WITH HEADERS FROM 'file:///demos/northwind/csv/orders.csv' AS row
MERGE (n:Order {orderID: row.orderID})
  ON CREATE SET n = row,
  n.uuid = randomUUID();
// import employees
LOAD CSV WITH HEADERS FROM 'file:///demos/northwind/csv/employees.csv' AS row
MERGE (e:Employee {employeeID: row.employeeID})
ON CREATE SET e.firstName = row.firstName, e.lastName = row.lastName, e.title = row.title, e.uuid = randomUUID();

//MERGE relationships
MATCH (p:Product), (c:Category)
WHERE p.categoryID = c.categoryID
MERGE (p)-[n:PART_OF]->(c)
ON CREATE SET n.uuid = randomUUID();

MATCH (p:Product), (s:Supplier)
WHERE p.supplierID = s.supplierID
MERGE (s)-[sup:SUPPLIES]->(p)
ON CREATE SET sup.uuid = randomUUID();

MATCH (c:Customer), (o:Order)
WHERE c.customerID = o.customerID
MERGE (c)-[pur:PURCHASED]->(o)
  ON CREATE SET pur.uuid = randomUUID();

LOAD CSV WITH HEADERS FROM 'file:///demos/northwind/csv/order-details.csv' AS row
MATCH (p:Product), (o:Order)
WHERE p.productID = row.productID AND o.orderID = row.orderID
MERGE (o)-[details:ORDERS]->(p)
ON CREATE SET details = row,
details.quantity = toInteger(row.quantity),
details.uuid = randomUUID();

LOAD CSV WITH HEADERS FROM 'file:///demos/northwind/csv/employees.csv' AS row
MATCH (employee:Employee {employeeID: row.employeeID})
MATCH (manager:Employee {employeeID: row.reportsTo})
MERGE (employee)-[rep:REPORTS_TO]->(manager)
ON CREATE SET rep.uuid = randomUUID();

LOAD CSV WITH HEADERS FROM "file:///demos/northwind/csv/orders.csv" AS row
MATCH (order:Order {orderID: row.orderID})
MATCH (employee:Employee {employeeID: row.employeeID})
MERGE (employee)-[sol:SOLD]->(order)
ON CREATE SET sol.uuid = randomUUID();

MATCH (n)
SET n:_Identifiable;
