select one.CUSTOMER_ID,(one.CUSTOMER_FNAME || " "|| one.CUSTOMER_LNAME) as Fullname,
one.CUSTOMER_EMAIL,two.ORDER_ID, PRODUCT_DESC, two.PRODUCT_QUANTITY,
(two.PRODUCT_QUANTITY * two.PRODUCT_PRICE) as subtotal
from

(SELECT * from ONLINE_CUSTOMER) as one

left join

(SELECT *
FROM ONLINE_CUSTOMER 
JOIN ORDER_HEADER ON ORDER_HEADER.CUSTOMER_ID = ONLINE_CUSTOMER.CUSTOMER_ID
LEFT JOIN ORDER_ITEMS  ON ORDER_ITEMS.ORDER_ID=ORDER_HEADER.ORDER_ID
LEFT JOIN PRODUCT  ON ORDER_ITEMS.PRODUCT_ID=PRODUCT.PRODUCT_ID) as two

on one.CUSTOMER_ID=two.CUSTOMER_ID
