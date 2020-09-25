-- Function: dsa.f_edad(date)

-- DROP FUNCTION dsa.f_edad(date);

CREATE OR REPLACE FUNCTION dsa.f_edad(date)
  RETURNS integer AS
$BODY$
DECLARE edad Integer;

BEGIN
    edad := date_part('Y',now()) - date_part('Y',$1::date);
    RETURN edad;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION dsa.f_edad(date)
  OWNER TO postgres;
