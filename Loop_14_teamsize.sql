-- Code so that print lines can be displayed on screen
SET SERVEROUTPUT ON 

-- PROCEDURE proc_teamsize
CREATE OR REPLACE PROCEDURE proc_teamsize IS
vn_size NUMBER(3, 3); 

CURSOR cur_size IS
SELECT team_id, number_of_team_members
FROM teams;


BEGIN
FOR rec_vn_size IN cur_size 
LOOP 
IF rec_vn_size.number_of_team_members < 50 THEN

	DBMS_OUTPUT.PUT_LINE('Team id '|| rec_vn_size.team_id || ' are less than 50. Need to hire more staff');
	ELSE DBMS_OUTPUT.PUT_LINE('Team id '|| rec_vn_size.team_id || ' are more than 50. No need to hire more staff');

END IF;
END LOOP;
END proc_teamsize;
/

EXEC proc_teamsize;

SHOW ERRORS