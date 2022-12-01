-- Show all columns for staff who live in Portsmouth
SELECT * FROM staff WHERE town LIKE '%Portsmouth%';

-- Show all columns for staff who live in Southsea and are role 3
SELECT * FROM staff WHERE town LIKE '%Southsea%' AND ROLE = 3;

-- Select all columns for products which are of catagory 3
SELECT * FROM product WHERE prod_cat = 3;

-- Select all columns for staff and show the descriptions of their roles
SELECT * FROM staff LEFT JOIN role ON staff.role=role.role_id;

-- Show the names, emails and role descriptions of all staff, sorted by staff_id
SELECT staff.staff_fname, staff.staff_lname, staff.work_email, role.role_name FROM staff LEFT JOIN role ON staff.role=role.role_id ORDER BY staff.staff_id ASC;

-- Show the names and addresses of all customers, along with any products they may have ordered, sorted by cust_id
SELECT customer.cust_id, customer.cust_fname, customer.cust_lname, customer.addr1, customer.town, customer.postcode, product.prod_name, product.prod_id FROM customer LEFT JOIN cust_order ON customer.cust_id=cust_order.cust_id LEFT JOIN manifest ON cust_order.cust_ord_id=manifest.cust_ord_id LEFT JOIN product ON manifest.prod_id=product.prod_id ORDER BY customer.cust_id ASC;