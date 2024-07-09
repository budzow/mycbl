            IDENTIFICATION DIVISION.
            PROGRAM-ID. VARS1.
            DATA DIVISION.
              WORKING-STORAGE SECTION.
              01 ALPHA   PIC X(4).
              01 BETA   PIC X(4) VALUE "Now is the time".
            PROCEDURE DIVISION.
              MOVE "Now is the time" TO ALPHA.
              DISPLAY ALPHA.
              DISPLAY BETA.
              STOP RUN.