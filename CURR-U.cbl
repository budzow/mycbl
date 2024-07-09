            IDENTIFICATION DIVISION.              
            PROGRAM-ID. CURR-U.                  
            
            DATA DIVISION.                                
            WORKING-STORAGE SECTION.              
            01 WS-EMPL.                           
               05 WS-EMPL-ID       PIC X(05).     
               05 WS-EMPL-NAME     PIC X(15).     
               05 TORD-C-BQ        PIC X(15).                 

                EXEC SQL
                   INCLUDE SQLCA
                END-EXEC.
            

                EXEC SQL
                   INCLUDE DCLEMP
                END-EXEC.
            

                EXEC SQL  
                   DECLARE EMP-CUR CURSOR FOR  
                      SELECT EMP_ID, EMP_NAME
                        WHERE EMP_ID > :WS-EMPL-ID  
                END-EXEC.  

                EXEC SQL DECLARE CMAJ_0A CURSOR
                  FOR SELECT C_BQ
                    FROM       S1ORDCOU
                    WHERE C_BQ = :TORD-C-BQ
                END-EXEC
                

				
				
				
            PROCEDURE DIVISION.                   
                
                EXEC SQL
                   OPEN EMP-CUR
                END-EXEC.   
             
                EVALUATE SQLCODE
                    WHEN ZERO
                         CONTINUE
                    WHEN OTHER
                         DISPLAY 'ERROR OPENING CURSOR EMP-CUR'
                END-EVALUATE.            
            
                EXEC SQL
                   CLOSE EMP-CUR
                END-EXEC.   
             
                EVALUATE SQLCODE
                    WHEN ZERO
                         CONTINUE
                    WHEN OTHER
                         DISPLAY 'ERROR CLOSING CURSOR EMP-CUR'
                END-EVALUATE.
            
                STOP RUN.  