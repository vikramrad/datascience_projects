SELECT ORDER_HEADER.ORDER_ID,ONLINE_CUSTOMER.CUSTOMER_ID,  (ONLINE_CUSTOMER.CUSTOMER_FNAME || " "|| ONLINE_CUSTOMER.CUSTOMER_LNAME) as Fullname, 
sum(ORDER_ITEMS.PRODUCT_QUANTITY) as totalq_prod
from online_customer
JOIN ORDER_HEADER ON ORDER_HEADER.CUSTOMER_ID = ONLINE_CUSTOMER.CUSTOMER_ID
JOIN ORDER_ITEMS  ON ORDER_ITEMS.ORDER_ID=ORDER_HEADER.ORDER_ID
WHERE ORDER_HEADER.ORDER_STATUS="Shipped"
GROUP BY ORDER_ITEMS.ORDER_ID
HAVING ORDER_ITEMS.ORDER_ID>10060 




