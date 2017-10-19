create or replace procedure       VALIDATE_OWM is
        cnt integer ;
      begin
        select count(*) into cnt from all_objects
        where status = 'VALID' and object_type = 'PACKAGE BODY' and owner = 'WMSYS' and object_name = 'LT' ;

        if (cnt = 0) then
          dbms_registry.invalid('OWM');
        else
          dbms_registry.valid('OWM');
        end if;
      end;
