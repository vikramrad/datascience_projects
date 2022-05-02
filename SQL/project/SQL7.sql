SELECT carton.CARTON_ID as "Optimal Carton ID", (carton.len*carton.width*carton.height) as carton_vol ,
((carton.len*carton.width*carton.height- (SELECT SUM(PRODUCT.len*PRODUCT.width*PRODUCT.height*ORDER_ITEMS.PRODUCT_QUANTITY) as pvol
FROM ORDER_ITEMS 
JOIN PRODUCT ON PRODUCT.PRODUCT_ID=ORDER_ITEMS.PRODUCT_ID 
WHERE ORDER_ID=10006))) as vol_diff_carton_prod  
FROM CARTON 
HAVING vol_diff_carton_prod >0
ORDER BY vol_diff_carton_prod LIMIT 1



