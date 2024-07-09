            IDENTIFICATION DIVISION.              
            PROGRAM-ID. SQLCURSR.                  
            
            DATA DIVISION.                                
            WORKING-STORAGE SECTION.              
            01 WS-EMPL.                           
               05 WS-EMPL-ID       PIC X(05).     
               05 WS-EMPL-NAME     PIC X(15).     
            

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
            PROCEDURE DIVISION.                   
            MAIN-PARA.  
                
                MOVE '20000' TO WS-EMPL-ID              
                
                EXEC SQL
                   OPEN EMP-CUR
                END-EXEC.   
             
                EVALUATE SQLCODE
                    WHEN ZERO
                         CONTINUE
                    WHEN OTHER
                         DISPLAY 'ERROR OPENING CURSOR EMP-CUR'
                END-EVALUATE.
            
                PERFORM UNTIL SQLCODE = 100
                   EXEC SQL
                      FETCH EMP-CUR
                         INTO :WS-EMPL-ID, :WS-EMPL-NAME
                   END-EXEC   
                   EVALUATE SQLCODE
                       WHEN ZERO
                            DISPLAY WS-EMPL
                       WHEN 100
                            DISPLAY 'NO MORE ROWS IN CURSOR RESULT SET'
                       WHEN OTHER
                            DISPLAY 'ERROR FETCHING CURSOR EMP-CUR'
                   END-EVALUATE
                END-PERFORM.
            
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