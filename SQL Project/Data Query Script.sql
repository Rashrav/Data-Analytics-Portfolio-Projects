
use business_management;
-- Listing all staffs with their roles (Manager or not):
SELECT acq_staff_id, staff_family_name, staff_other_names, 
       CASE 
           WHEN m.acq_staff_id IS NOT NULL THEN 'Manager' 
           ELSE 'Staff' 
       END as Role
FROM staff s
LEFT JOIN manager m ON acq_staff_id = m.acq_staff_id;

-- Retrieve All Stores with Their Managers:
SELECT st.store_name, st.c_store_id, CONCAT(s.staff_family_name, ' ', s.staff_other_names) as ManagerName
FROM store st
LEFT JOIN manager m ON st.store_mgr_id = m.acq_staff_id
LEFT JOIN staff s ON m.acq_staff_id = s.acq_staff_id;

-- List Full-Time Contracts with Staff Details:
SELECT ft.contract_id, ft.ft_salary, ft.ft_super_amt, 
       CONCAT(s.staff_family_name, ' ', s.staff_other_names) as StaffName
FROM ft_contract ft
JOIN contract c ON ft.contract_id = c.contract_id
JOIN staff s ON c.staff_id = s.acq_staff_id;

-- List Part-Time Contracts with Hourly Rate and Hours Per Week:
SELECT pt.contract_id, pt.pt_hours_per_wk, pt.pt_hourly_rate, pt.pt_super_amt, 
       CONCAT(s.staff_family_name, ' ', s.staff_other_names) as StaffName
FROM pt_contract pt
JOIN contract c ON pt.contract_id = c.contract_id
JOIN staff s ON c.staff_id = s.acq_staff_id;

-- Find Stores with Seating Available:
SELECT st.store_name, l.loc_street_address, l.hasSeating
FROM store st
JOIN location l ON st.store_loc_id = l.loc_id
WHERE l.hasSeating = 1;

-- Staff contract information
SELECT acq_staff_id, CONCAT(staff_family_name, ' ', staff_other_names) AS Full_Name, staff_phone, email
FROM staff;

-- Retrieve Managers and Their Review Dates:
SELECT m.acq_staff_id, CONCAT(s.staff_family_name, ' ', s.staff_other_names) AS Manager_Name, m.mgr_review_date
FROM manager m
JOIN staff s ON m.acq_staff_id = s.acq_staff_id;

-- List of stores with their manager and location
SELECT st.store_name, st.c_store_id, CONCAT(s.staff_family_name, ' ', s.staff_other_names) AS Manager_Name, l.loc_street_address AS Location
FROM store st
LEFT JOIN manager m ON st.store_mgr_id = m.acq_staff_id
LEFT JOIN staff s ON m.acq_staff_id = s.acq_staff_id
JOIN location l ON st.store_loc_id = l.loc_id;

-- Summarize contract details for each staff member
SELECT c.staff_id, CONCAT(st.staff_family_name, ' ', st.staff_other_names) AS Staff_Name, c.contract_start_date, 
       COALESCE(ft.ft_salary, 0) AS Full_Time_Salary, COALESCE(pt.pt_hours_per_wk * pt.pt_hourly_rate, 0) AS Part_Time_Earnings
FROM contract c
LEFT JOIN staff st ON c.staff_id = st.acq_staff_id
LEFT JOIN ft_contract ft ON c.contract_id = ft.contract_id
LEFT JOIN pt_contract pt ON c.contract_id = pt.contract_id;

-- Locations with Seating Availability:
SELECT loc_id, loc_street_address, loc_suburb, loc_state, hasSeating 
FROM location
WHERE hasSeating = 1;

-- Total number of employees in each state
SELECT staff_state, COUNT(*) AS Number_of_Employees 
FROM staff 
GROUP BY staff_state;

-- Average salary of Full time and Part time








