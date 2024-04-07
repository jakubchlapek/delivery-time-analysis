SELECT 
    product_id AS productID, 
    SUM(op.quantity * p.weight) AS totalWeight 
FROM 
    route_segments rs
JOIN 
    orders o USING(order_id)
JOIN 
    orders_products op USING(order_id)
JOIN 
    products p USING(product_id)
WHERE 
    DATE(segment_end_time) = '2024-02-13' 
    AND customer_id = 32
GROUP BY 
    product_id
ORDER BY 
    totalWeight ASC;