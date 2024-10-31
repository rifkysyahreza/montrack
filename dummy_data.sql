-- Insert data into 'user' table
INSERT INTO "user" (id, active_wallet_id, name, profile_photo, email, password, pin, quotes, oauth_provider, created_at, updated_at) VALUES
(1, 1, 'John Doe', 'profile1.jpg', 'john.doe@example.com', 'hashedpassword123', '1234', 'Life is beautiful', 'google', NOW(), NOW()),
(2, 2, 'Jane Smith', 'profile2.jpg', 'jane.smith@example.com', 'hashedpassword456', '5678', 'Keep moving forward', 'facebook', NOW(), NOW());

-- Insert data into 'wallet' table
INSERT INTO wallet (id, user_id, name, balance) VALUES
(1, 1, 'John’s Wallet', 1500.00),
(2, 2, 'Jane’s Wallet', 2450.50);

-- Insert data into 'active_wallet' table
INSERT INTO active_wallet (id, wallet_id) VALUES
(1, 1),
(2, 2);

-- Update 'user' table to set active_wallet_id (assuming active_wallet entries are created)
UPDATE "user" SET active_wallet_id = id;

-- Insert data into 'notification' table
INSERT INTO notification (id, user_id, title, description, is_read, created_at) VALUES
(1, 1, 'Transaction Alert', 'Your recent transaction was successful.', false, NOW()),
(2, 2, 'Welcome Message', 'Welcome to our service, Jane!', true, NOW());

-- Insert data into 'goals' table
INSERT INTO goals (id, wallet_id, name, target_amount, current_amount, description, image_url, created_at) VALUES
(1, 1, 'Vacation Fund', 3000.00, 500.00, 'Saving for a summer vacation.', 'vacation.jpg', NOW()),
(2, 2, 'New Car Fund', 20000.00, 1500.00, 'Saving to buy a new car.', 'car.jpg', NOW());

-- Insert data into 'goals_history' table
INSERT INTO goals_history (id, goals_id, name, amount, date) VALUES
(1, 1, 'Initial Deposit', 500.00, NOW()),
(2, 2, 'Initial Deposit', 1500.00, NOW());

-- Insert data into 'pocket' table
INSERT INTO pocket (id, wallet_id, emoji_unicode, name, amount, description) VALUES
(1, 1, 'U+1F4B0', 'Daily Expenses', 200.00, 'Pocket for daily expenses.'),
(2, 2, 'U+1F4B8', 'Entertainment', 300.00, 'Pocket for entertainment and leisure.');

-- Insert data into 'money_records' table
INSERT INTO money_records (id, pocket_id, name, type, date, amount, description, attachment) VALUES
(1, 1, 'Coffee', 'expense', NOW(), 5.00, 'Morning coffee', 'receipt.jpg'),
(2, 2, 'Movie Tickets', 'expense', NOW(), 25.00, 'Watching a movie', 'ticket.jpg');
