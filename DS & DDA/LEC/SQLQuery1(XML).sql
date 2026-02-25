--Example: using query metho
SELECT id, xDoc, query('/catalog')
FROM AdminDocs

--product details
SELECT id, xDoc, query('/catalog/product') --('//product') -- ('/*/product') * --> only represents the first tag
FROM AdminDocs

--product numbers
SELECT id, xDoc, query('/catalog/product/numbers') --//numbers
FROM AdminDocs

--Display a specific variable 
DECLARE @x xml
SET @x = '<ROOT><a>111</a></ROOT>'
SELECT @x.query('/ROOT/a')  

--let - variable delcaration 



