-- 4.1
UPDATE USER
SET Email = 'maria@dcc.fc.up.pt'
WHERE Login = 'maria';

-- 4.2
UPDATE USER
SET Name = 'Secret Identity', Email = 'batman@gotham.com'
WHERE Name = 'Bruce Wayne';

-- 4.3
UPDATE USER
SET Phone = NULL
WHERE Num < 5;