SELECT 
      name,
      email,
      CONCAT('https://example.com/images/', profile_photo) AS photo_url,
      quotes
FROM 
      montrack."user" 
LIMIT 2;

/*
Name       | Email                  | Photo URL                                     | Quotes
-----------|------------------------|-----------------------------------------------|-----------------------
John Doe   | john.doe@example.com   | https://example.com/images/profile1.jpg       | Life is beautiful
Jane Smith | jane.smith@example.com | https://example.com/images/profile2.jpg       | Keep moving forward
*/

SELECT 
      name, 
      description, 
      current_amount, 
      target_amount
FROM 
      goals 
LIMIT 2;

/*
| name          | description                   | current_amount | target_amount |
|---------------|-------------------------------|----------------|---------------|
| Vacation Fund | Saving for a summer vacation. | 500.00         | 3000.00       |
| New Car Fund  | Saving to buy a new car.      | 1500.00        | 20000.00      |
*/

SELECT 
    g.name AS goal_name,
    CONCAT('https://example.com/images/', g.image_url) AS image_url,
    g.description,
    g.current_amount,
    g.target_amount,
    gh.name AS activity_name,
    gh.date AS activity_date,
    gh.amount AS activity_amount
FROM 
    montrack.goals g
JOIN 
    montrack.goals_history gh ON g.id = gh.goals_id
LIMIT 2;

/*
Goal Name     | Image URL                                  | Description                  | Current Amount | Target Amount | Activity Name   | Activity Date | Activity Amount
--------------|--------------------------------------------|------------------------------|----------------|---------------|-----------------|---------------|----------------
Vacation Fund | https://example.com/images/vacation.jpg    | Saving for a summer vacation | 500.00         | 3000.00       | Initial Deposit | 2023-10-01    | 500.00
New Car Fund  | https://example.com/images/car.jpg         | Saving to buy a new car      | 1500.00        | 20000.00      | Initial Deposit | 2023-10-01    | 1500.00d
*/

