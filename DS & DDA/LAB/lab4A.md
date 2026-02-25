**1)**

SET SERVEROUTPUT ON;



DECLARE

&nbsp;   var\_company  VARCHAR2(20) := 'IBM';

&nbsp;   var\_price    NUMBER;

BEGIN

&nbsp;   SELECT price INTO var\_price

&nbsp;   FROM stock

&nbsp;   WHERE company = var\_company;



&nbsp;   DBMS\_OUTPUT.PUT\_LINE('Company : ' || var\_company);

&nbsp;   DBMS\_OUTPUT.PUT\_LINE('Current Price : ' || var\_price);



EXCEPTION

&nbsp;   WHEN NO\_DATA\_FOUND THEN

&nbsp;       DBMS\_OUTPUT.PUT\_LINE('Company not found.');

END;

/



**2)**

SET SERVEROUTPUT ON;



DECLARE

&nbsp;   var\_company  VARCHAR2(20) := 'IBM';

&nbsp;   var\_price    NUMBER;

BEGIN

&nbsp;   SELECT price INTO var\_price

&nbsp;   FROM stock

&nbsp;   WHERE company = var\_company;



&nbsp;   IF var\_price < 45 THEN

&nbsp;       DBMS\_OUTPUT.PUT\_LINE('Current price is very low !');



&nbsp;   ELSIF var\_price >= 45 AND var\_price < 55 THEN

&nbsp;       DBMS\_OUTPUT.PUT\_LINE('Current price is low !');



&nbsp;   ELSIF var\_price >= 55 AND var\_price < 65 THEN

&nbsp;       DBMS\_OUTPUT.PUT\_LINE('Current price is medium !');



&nbsp;   ELSIF var\_price >= 65 AND var\_price < 75 THEN

&nbsp;       DBMS\_OUTPUT.PUT\_LINE('Current price is medium high !');



&nbsp;   ELSE

&nbsp;       DBMS\_OUTPUT.PUT\_LINE('Current price is high !');

&nbsp;   END IF;



EXCEPTION

&nbsp;   WHEN NO\_DATA\_FOUND THEN

&nbsp;       DBMS\_OUTPUT.PUT\_LINE('Company not found.');

END;

/



**3)**

SET SERVEROUTPUT ON;



BEGIN

&nbsp;   FOR i IN REVERSE 1..9 LOOP

&nbsp;       FOR j IN 1..i LOOP

&nbsp;           DBMS\_OUTPUT.PUT(i || ' ');

&nbsp;       END LOOP;

&nbsp;       DBMS\_OUTPUT.NEW\_LINE;

&nbsp;   END LOOP;

END;

/





SET SERVEROUTPUT ON;



DECLARE

&nbsp;   i NUMBER := 9;

&nbsp;   j NUMBER;

BEGIN

&nbsp;   WHILE i >= 1 LOOP

&nbsp;       j := 1;

&nbsp;       WHILE j <= i LOOP

&nbsp;           DBMS\_OUTPUT.PUT(i || ' ');

&nbsp;           j := j + 1;

&nbsp;       END LOOP;



&nbsp;       DBMS\_OUTPUT.NEW\_LINE;

&nbsp;       i := i - 1;

&nbsp;   END LOOP;

END;

/



SET SERVEROUTPUT ON;



DECLARE

&nbsp;   i NUMBER := 9;

&nbsp;   j NUMBER;

BEGIN

&nbsp;   LOOP

&nbsp;       EXIT WHEN i < 1;



&nbsp;       j := 1;

&nbsp;       LOOP

&nbsp;           EXIT WHEN j > i;

&nbsp;           DBMS\_OUTPUT.PUT(i || ' ');

&nbsp;           j := j + 1;

&nbsp;       END LOOP;



&nbsp;       DBMS\_OUTPUT.NEW\_LINE;

&nbsp;       i := i - 1;

&nbsp;   END LOOP;

END;

/



**4)**

SET SERVEROUTPUT ON;



BEGIN

&nbsp;   FOR rec IN (SELECT \* FROM purchase) LOOP



&nbsp;       IF rec.pur\_date < TO\_DATE('01-JAN-2000','DD-MON-YYYY') THEN

&nbsp;           UPDATE purchase

&nbsp;           SET qty = qty + 150

&nbsp;           WHERE purchase\_id = rec.purchase\_id;



&nbsp;       ELSIF rec.pur\_date < TO\_DATE('01-JAN-2001','DD-MON-YYYY') THEN

&nbsp;           UPDATE purchase

&nbsp;           SET qty = qty + 100

&nbsp;           WHERE purchase\_id = rec.purchase\_id;



&nbsp;       ELSIF rec.pur\_date < TO\_DATE('01-JAN-2002','DD-MON-YYYY') THEN

&nbsp;           UPDATE purchase

&nbsp;           SET qty = qty + 50

&nbsp;           WHERE purchase\_id = rec.purchase\_id;



&nbsp;       END IF;



&nbsp;   END LOOP;



&nbsp;   COMMIT;

END;

/



SET SERVEROUTPUT ON;



DECLARE

&nbsp;   CURSOR pur\_cur IS

&nbsp;       SELECT purchase\_id, pur\_date, qty

&nbsp;       FROM purchase

&nbsp;       FOR UPDATE;



&nbsp;   rec pur\_cur%ROWTYPE;



BEGIN

&nbsp;   OPEN pur\_cur;



&nbsp;   LOOP

&nbsp;       FETCH pur\_cur INTO rec;

&nbsp;       EXIT WHEN pur\_cur%NOTFOUND;



&nbsp;       IF rec.pur\_date < TO\_DATE('01-JAN-2000','DD-MON-YYYY') THEN

&nbsp;           UPDATE purchase

&nbsp;           SET qty = qty + 150

&nbsp;           WHERE CURRENT OF pur\_cur;



&nbsp;       ELSIF rec.pur\_date < TO\_DATE('01-JAN-2001','DD-MON-YYYY') THEN

&nbsp;           UPDATE purchase

&nbsp;           SET qty = qty + 100

&nbsp;           WHERE CURRENT OF pur\_cur;



&nbsp;       ELSIF rec.pur\_date < TO\_DATE('01-JAN-2002','DD-MON-YYYY') THEN

&nbsp;           UPDATE purchase

&nbsp;           SET qty = qty + 50

&nbsp;           WHERE CURRENT OF pur\_cur;



&nbsp;       END IF;



&nbsp;   END LOOP;



&nbsp;   CLOSE pur\_cur;

&nbsp;   COMMIT;

END;

/





