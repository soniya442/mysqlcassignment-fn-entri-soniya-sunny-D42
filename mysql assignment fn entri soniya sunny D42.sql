alter table persons_1
add  DOB date ;

select * from persons_1 ;
select * from country_1 ;

DELIMITER $$

CREATE FUNCTION get_age(dob DATE)
 RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE age INT;
    
    SET age = YEAR(CURDATE()) - YEAR(dob);
    
    IF (MONTH(CURDATE()) < MONTH(dob)) OR 
       (MONTH(CURDATE()) = MONTH(dob) AND DAY(CURDATE()) < DAY(dob)) THEN
        SET age = age - 1;
    END IF;
    
    RETURN age;
END $$
delimiter ;

UPDATE Persons_1 SET DOB = '1980-01-15' WHERE Id = 1;
UPDATE Persons_1 SET DOB = '1992-05-22' WHERE Id = 2;
UPDATE Persons_1 SET DOB = '1985-11-30' WHERE Id = 3;
UPDATE Persons_1 SET DOB = '1978-07-18' WHERE Id = 4;
UPDATE Persons_1 SET DOB = '1990-03-10' WHERE Id = 5;
UPDATE Persons_1 SET DOB = '1983-09-25' WHERE Id = 6;
UPDATE Persons_1 SET DOB = '1975-12-05' WHERE Id = 7;
UPDATE Persons_1 SET DOB = '1995-06-08' WHERE Id = 8;
UPDATE Persons_1 SET DOB = '1988-08-14' WHERE Id = 9;
UPDATE Persons_1 SET DOB = '1993-10-02' WHERE Id = 10;

SELECT Id, Fname, Lname, DOB, get_age(DOB) AS Age FROM Persons_1;

select country_name,char_length(country_name) as length_country_name from country_1 ;

select country_name,left(country_name,3) as short_country_name from country_1 ;

select country_name ,
upper(country_name) as upper_country_name,
lower(country_name) as lower_country_name
from country_1 ;


















