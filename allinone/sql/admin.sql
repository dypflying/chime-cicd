
-- Create User

CREATE USER 'chime'@'%' IDENTIFIED BY 'chime';
GRANT ALL PRIVILEGES ON *.* TO 'chime'@'%';
flush privileges;