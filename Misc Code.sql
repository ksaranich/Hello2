CREATE TABLE QTEMP/KMS_TST_01 AS (    
   SELECT                                         
      T01.MBSHRT AS SHORTNAME,
      DATE(TIMESTAMP_FORMAT(                   
                        CHAR(YEAR(NOW()) * 10000 + QUARTER(NOW()) * 300 - 199), 
               'YYYYMMDD') - 1 day) AS kms1, 
      DATE(TIMESTAMP_FORMAT(                   
                        CHAR(YEAR(NOW()) * 10000 + QUARTER(NOW()) * 300 - 199), 
               'YYYYMMDD') - 3 months) AS kms2,                           
      DATE(TIMESTAMP_FORMAT(                   
                        CHAR(YEAR(NOW()) * 10000 + QUARTER(NOW()) * 300 - 199), 
               'YYYYMMDD') ) AS kms3 , 
               year(now()) as kms5,
               QUARTER(NOW()) as kms4             
                     
   FROM                                           
      BANK01/DMMLNBAL T01,                        
      (SELECT                                     
         DATE(TIMESTAMP_FORMAT(                   
                        CHAR(YEAR(NOW()) * 10000 + QUARTER(NOW()) * 300 - 199), 
               'YYYYMMDD')) AS QRTRSTRT                              
               FROM                                                    
                  PRDFF/BOSSDATES) QRT                                 
      WHERE                                                            
         T01.MBPTCD = 'N' AND                                        
         DATE(TIMESTAMP_FORMAT(CHAR(MBORDT), 'YYYYMMDD'))            
         BETWEEN                                                       
            QRT.QRTRSTRT - 3 MONTHS AND QRT.QRTRSTRT - 1 DAY           
      ) WITH DATA ;
      
SELECT * from qtemp/KMS_TST_01;
