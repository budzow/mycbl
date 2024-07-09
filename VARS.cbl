            IDENTIFICATION DIVISION.
            PROGRAM-ID. VARS.

            DATA DIVISION.
              WORKING-STORAGE SECTION.
              01 FIRST-VAR PIC S9(3)V9(2).
              01 SECOND-VAR PIC S9(3)V9(2) VALUE -123.45.
              01 THIRD-VAR PIC A(6) VALUE 'ABCDEF'.
              01 FOURTH-VAR PIC X(5) VALUE 'A121$'.
              01 GROUP-VAR.
                05 SUBVAR-1 PIC 9(3) VALUE 3374.
                05 SUBVAR-2 PIC A(15) VALUE 'LA##LALALA'.
                05 SUBVAR-3 PIC X(15) VALUE 'LALALA'.
                05 SUBVAR-4 PIC X(15) VALUE 'LALALA'.
      

            PROCEDURE DIVISION.
              DISPLAY "1ST VAR :"FIRST-VAR.
              DISPLAY "2ND VAR :"SECOND-VAR.
              DISPLAY "3RD VAR :"THIRD-VAR.
              DISPLAY "4TH VAR :"FOURTH-VAR.
              DISPLAY "GROUP VAR :"GROUP-VAR.
              STOP RUN.