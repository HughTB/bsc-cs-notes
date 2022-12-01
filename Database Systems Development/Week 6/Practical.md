# DSD - Practical 14:00 10/11/22

```sql
select count(*) from product, category;
```
14. Returns 600
```sql
select * from product, category where prod_name = 'Multi-layered multi-tasking initiative';
```
16. Returns the following: 
```
1 | Multi-layered multi-tasking initiative |        2 |      1 | Men's Wear
1 | Multi-layered multi-tasking initiative |        2 |      2 | Ladies Wear
1 | Multi-layered multi-tasking initiative |        2 |      3 | Kid's Wear
1 | Multi-layered multi-tasking initiative |        2 |      4 | Outdoor
1 | Multi-layered multi-tasking initiative |        2 |      5 | Sport
1 | Multi-layered multi-tasking initiative |        2 |      6 | Health
```
```sql
select * from category join product on category.cat_id = product.prod_cat;
```
17. Returns the following:
```
      2 | Ladies Wear |       1 | Multi-layered multi-tasking initiative           |        2
      1 | Men's Wear  |       2 | Operative analyzing task-force                   |        1
      5 | Sport       |       3 | Exclusive client-server array                    |        5
      6 | Health      |       4 | Balanced client-server product                   |        6
      5 | Sport       |       5 | Exclusive background website                     |        5
      6 | Health      |       6 | Pre-emptive holistic intranet                    |        6
      1 | Men's Wear  |       7 | Re-engineered cohesive methodology               |        1
      2 | Ladies Wear |       8 | Robust directional projection                    |        2
      4 | Outdoor     |       9 | Inverse transitional infrastructure              |        4
      6 | Health      |      10 | Multi-tiered explicit paradigm                   |        6
      2 | Ladies Wear |      11 | Re-engineered explicit software                  |        2
      3 | Kid's Wear  |      12 | Cross-platform fresh-thinking core               |        3
      4 | Outdoor     |      13 | Diverse neutral emulation                        |        4
      4 | Outdoor     |      14 | Up-sized composite challenge                     |        4
      4 | Outdoor     |      15 | Intuitive directional complexity                 |        4
      5 | Sport       |      16 | Universal encompassing conglomeration            |        5
      2 | Ladies Wear |      17 | Multi-channelled well-modulated analyzer         |        2
      4 | Outdoor     |      18 | Re-engineered actuating capability               |        4
      2 | Ladies Wear |      19 | Public-key interactive encoding                  |        2
      6 | Health      |      20 | Monitored asynchronous function                  |        6
      4 | Outdoor     |      21 | Proactive methodical data-warehouse              |        4
      1 | Men's Wear  |      22 | Balanced real-time info-mediaries                |        1
      6 | Health      |      23 | Right-sized mission-critical pricing structure   |        6
      5 | Sport       |      24 | Synergistic homogeneous ability                  |        5
      5 | Sport       |      25 | Open-source impactful archive                    |        5
      2 | Ladies Wear |      26 | Realigned 5th generation artificial intelligence |        2
      5 | Sport       |      27 | Configurable methodical firmware                 |        5
      3 | Kid's Wear  |      28 | Profound optimal encryption                      |        3
      2 | Ladies Wear |      29 | Vision-oriented user-facing framework            |        2
      2 | Ladies Wear |      30 | Secured holistic hierarchy                       |        2
      2 | Ladies Wear |      31 | Assimilated regional instruction set             |        2
      3 | Kid's Wear  |      32 | Business-focused holistic help-desk              |        3
      5 | Sport       |      33 | Virtual stable Graphic Interface                 |        5
      1 | Men's Wear  |      34 | Implemented optimizing benchmark                 |        1
      1 | Men's Wear  |      35 | Adaptive static website                          |        1
      2 | Ladies Wear |      36 | Virtual impactful success                        |        2
      6 | Health      |      37 | Open-architected homogeneous concept             |        6
      1 | Men's Wear  |      38 | Diverse reciprocal knowledge base                |        1
      5 | Sport       |      39 | Realigned homogeneous hub                        |        5
      4 | Outdoor     |      40 | Switchable tangible product                      |        4
      2 | Ladies Wear |      41 | Universal global hub                             |        2
      4 | Outdoor     |      42 | Enhanced discrete function                       |        4
      4 | Outdoor     |      43 | Horizontal asynchronous intranet                 |        4
      5 | Sport       |      44 | Quality-focused foreground analyzer              |        5
      3 | Kid's Wear  |      45 | Configurable analyzing solution                  |        3
      6 | Health      |      46 | Fully-configurable full-range interface          |        6
      3 | Kid's Wear  |      47 | Monitored non-volatile initiative                |        3
      3 | Kid's Wear  |      48 | Pre-emptive next generation infrastructure       |        3
      4 | Outdoor     |      49 | Switchable 5th generation parallelism            |        4
      2 | Ladies Wear |      50 | Adaptive modular approach                        |        2
      2 | Ladies Wear |      51 | Synergistic zero defect info-mediaries           |        2
      3 | Kid's Wear  |      52 | Persevering empowering customer loyalty          |        3
      1 | Men's Wear  |      53 | Robust foreground leverage                       |        1
      6 | Health      |      54 | Customizable cohesive capacity                   |        6
      3 | Kid's Wear  |      55 | Progressive modular archive                      |        3
      2 | Ladies Wear |      56 | Reduced fresh-thinking process improvement       |        2
      6 | Health      |      57 | Seamless optimal leverage                        |        6
      5 | Sport       |      58 | Universal exuding protocol                       |        5
      6 | Health      |      59 | Realigned client-driven database                 |        6
      5 | Sport       |      60 | Balanced hybrid portal                           |        5
      5 | Sport       |      61 | Customizable well-modulated encryption           |        5
      3 | Kid's Wear  |      62 | Cross-group reciprocal firmware                  |        3
      4 | Outdoor     |      63 | 4th generation Graphical User Interface          |        4
      5 | Sport       |      64 | Business-focused solution-oriented moratorium    |        5
      5 | Sport       |      65 | Synergistic scalable capability                  |        5
      5 | Sport       |      66 | Distributed uniform Graphic Interface            |        5
      2 | Ladies Wear |      67 | Stand-alone composite Graphical User Interface   |        2
      4 | Outdoor     |      68 | Future-proofed leading edge customer loyalty     |        4
      6 | Health      |      69 | Profound human-resource forecast                 |        6
      3 | Kid's Wear  |      70 | Advanced neutral portal                          |        3
      3 | Kid's Wear  |      71 | Customer-focused needs-based protocol            |        3
      6 | Health      |      72 | User-friendly encompassing array                 |        6
      2 | Ladies Wear |      73 | Decentralized human-resource infrastructure      |        2
      2 | Ladies Wear |      74 | Balanced modular website                         |        2
      2 | Ladies Wear |      75 | Horizontal explicit benchmark                    |        2
      1 | Men's Wear  |      76 | Re-engineered 24/7 knowledge base                |        1
      2 | Ladies Wear |      77 | Innovative web-enabled extranet                  |        2
      2 | Ladies Wear |      78 | Exclusive analyzing open architecture            |        2
      3 | Kid's Wear  |      79 | Fundamental global archive                       |        3
      5 | Sport       |      80 | Profound value-added intranet                    |        5
      6 | Health      |      81 | Networked global open system                     |        6
      5 | Sport       |      82 | Persistent demand-driven complexity              |        5
      5 | Sport       |      83 | Focused secondary initiative                     |        5
      3 | Kid's Wear  |      84 | Digitized tertiary groupware                     |        3
      4 | Outdoor     |      85 | Enhanced homogeneous paradigm                    |        4
      4 | Outdoor     |      86 | Inverse high-level attitude                      |        4
      4 | Outdoor     |      87 | Quality-focused upward-trending throughput       |        4
      6 | Health      |      88 | Team-oriented stable project                     |        6
      3 | Kid's Wear  |      89 | Total intangible artificial intelligence         |        3
      5 | Sport       |      90 | Streamlined asynchronous functionalities         |        5
      5 | Sport       |      91 | Vision-oriented attitude-oriented core           |        5
      2 | Ladies Wear |      92 | Integrated 24/7 interface                        |        2
      1 | Men's Wear  |      93 | Advanced didactic Graphic Interface              |        1
      6 | Health      |      94 | Exclusive multimedia middleware                  |        6
      6 | Health      |      95 | Ameliorated next generation orchestration        |        6
      5 | Sport       |      96 | Front-line demand-driven utilisation             |        5
      3 | Kid's Wear  |      97 | Organic clear-thinking system engine             |        3
      3 | Kid's Wear  |      98 | Persistent incremental model                     |        3
      2 | Ladies Wear |      99 | Ergonomic solution-oriented local area network   |        2
      5 | Sport       |     100 | Robust mission-critical complexity               |        5
```
18. This time it returns 100 rows
19. To return the information for only the product "Multi-layered multi-tasking initiative", use the following:
```sql
select * from category join product on category.cat_id = product.prod_cat where product.prod_name = 'Multi-layered multi-tasking initiative';
```
```
      2 | Ladies Wear |       1 | Multi-layered multi-tasking initiative |        2
```
21. Return customer's first name, last name and order numbers
```sql
select customer.cust_fname, customer.cust_lname, cust_order.cust_ord_id from customer join cust_order on customer.cust_id = cust_order.cust_id where customer.cust_id = 1;
```
```
 Jobey      | Boeter     |          26
 Jobey      | Boeter     |          34
 Jobey      | Boeter     |          39
 Jobey      | Boeter     |          57
 Jobey      | Boeter     |          68
 Jobey      | Boeter     |          71
 Jobey      | Boeter     |          77
 Jobey      | Boeter     |          91
 Jobey      | Boeter     |          98
 Jobey      | Boeter     |          99
 Jobey      | Boeter     |         131
 Jobey      | Boeter     |         143
 Jobey      | Boeter     |         146
```
22. Now add staff_fname and staff_lname
```sql
select customer.cust_fname, customer.cust_lname, cust_order.cust_ord_id, staff.staff_fname, staff.staff_lname from customer join cust_order on customer.cust_id = cust_order.cust_id join staff on cust_order.staff_id = staff.staff_id where customer.cust_id = 1;
```
```
 Jobey      | Boeter     |          26 | Montgomery  | Housegoe
 Jobey      | Boeter     |          34 | Hanan       | Gloster
 Jobey      | Boeter     |          39 | Hanan       | Gloster
 Jobey      | Boeter     |          57 | Nikoletta   | Shrimpton
 Jobey      | Boeter     |          68 | Montgomery  | Housegoe
 Jobey      | Boeter     |          71 | Nikoletta   | Shrimpton
 Jobey      | Boeter     |          77 | Hanan       | Gloster
 Jobey      | Boeter     |          91 | Niel        | Welsby
 Jobey      | Boeter     |          98 | Montgomery  | Housegoe
 Jobey      | Boeter     |          99 | Janeva      | Gillicuddy
 Jobey      | Boeter     |         131 | Aura        | Clewlowe
 Jobey      | Boeter     |         143 | Janeva      | Gillicuddy
 Jobey      | Boeter     |         146 | Montgomery  | Housegoe
```
23. Print out a join of role, staff, cust_order, and customer table. Get the roles of anyone who has helped the customer with cust_id of 4
```sql
select customer.cust_fname, customer.cust_lname, cust_order.cust_ord_id, staff.staff_fname, staff.staff_lname, role.role_id, role.role_name
from customer
join cust_order on customer.cust_id = cust_order.cust_id
join staff on cust_order.staff_id = staff.staff_id
join role on staff.role = role.role_id
where customer.cust_id = 4;
```
```
 Chadd      | Franz-Schoninger |           1 | Aura        | Clewlowe    |       3 | Post Sales
 Chadd      | Franz-Schoninger |           7 | Aura        | Clewlowe    |       3 | Post Sales
 Chadd      | Franz-Schoninger |          66 | Montgomery  | Housegoe    |       1 | Order Picker
 Chadd      | Franz-Schoninger |          81 | Janeva      | Gillicuddy  |       5 | Misc
 Chadd      | Franz-Schoninger |          93 | Niel        | Welsby      |       2 | Final Packer
 Chadd      | Franz-Schoninger |          97 | Aura        | Clewlowe    |       3 | Post Sales
 Chadd      | Franz-Schoninger |         107 | Hanan       | Gloster     |       4 | Customer Retain
 Chadd      | Franz-Schoninger |         109 | Nikoletta   | Shrimpton   |       4 | Customer Retain
 Chadd      | Franz-Schoninger |         124 | Aura        | Clewlowe    |       3 | Post Sales
 Chadd      | Franz-Schoninger |         129 | Nikoletta   | Shrimpton   |       4 | Customer Retain
```