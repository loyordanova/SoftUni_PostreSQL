CREATE TABLE deleted_employees(
  employee_id SERIAL PRIMARY KEY, 
  first_name VARCHAR(20), 
  last_name VARCHAR(20), 
  middle_name VARCHAR(20), 
  job_title VARCHAR(50), 
  department_id INT, 
  salary NUMERIC(19,4));

-- Basic syntax of a TRIGGER. First we create a function. It's a common practice in PostgreSQL to create trigger functions(instead of procedures) that perform actions like inserting data without returning a result
CREATE OR REPLACE FUNCTION delete_employees()
-- The delete_employees function is defined with the RETURNS TRIGGER clause, indicating that it's a trigger function that will be executed after the delete operation on the employees table.
RETURNS TRIGGER AS
  $$
  BEGIN
    INSERT INTO deleted_employees (first_name, last_name, middle_name, job_title, department_id, salary)
    VALUES (OLD.first_name, OLD.last_name, OLD.middle_name, OLD.job_title, OLD.department_id, OLD.salary);
-- The RETURN NEW statement in the trigger function would mean that the trigger will return the NEW row.  
-- It's more common to use RETURN OLD, but in this context will return the deleted row.
-- When we define a trigger function using PL/pgSQL, we are required to have a RETURN statement at the end of the function, 
-- even if the function doesn't return any actual data. To address this requirement, we can use RETURN NULL to indicate that the function doesn't return any meaningful data. 
    RETURN NULL;
-- This is the same end syntax as any ordinary function:
  END; 
  $$
  LANGUAGE plpgsql;


-- Creating a trigger is like creating any other odject in sql, no brackets, no parameters, no colons
CREATE OR REPLACE TRIGGER backup_employees
  -- The backup_employees trigger is created with the AFTER DELETE condition, meaning it will execute after a row is deleted from the employees table. We use command + table_name. 
  AFTER DELETE ON employees
  -- This clause specifies that the trigger will be invoked for each deleted row.
  FOR EACH ROW 
  -- This statement specifies that the delete_employees function should be executed when this trigger is triggered.
  EXECUTE PROCEDURE delete_employees();