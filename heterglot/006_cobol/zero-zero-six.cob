      * The sum of the squares of the first ten natural numbers is,
      *
      *   1^2 + 2^2 + ... + 10^2 = 385
      *
      * The square of the sum of the first ten natural numbers is,
      *
      *   (1 + 2 + ... + 10)^2 = 55^2 = 3025
      *
      * Hence the difference between the sum of the squares of the
      * first ten natural numbers and the square of the sum is
      *
      *   3025 − 385 = 2640.
      *
      * Find the difference between the sum of the squares of the first
      * one hundred natural numbers and the square of the sum.
      *
       IDENTIFICATION DIVISION.
       PROGRAM-ID. zero-zero-six.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 SumOfSq          PIC 9(10).
       01 SqOfSums         PIC 9(10).
       01 Result           PIC 9(10).
       01 Counter          PIC 999.
       01 MaxCounter       PIC 999 VALUE 100.
       01 Tmp              PIC 9(10).

       PROCEDURE DIVISION.
           DISPLAY "Start".
           PERFORM CALCULATE-SQUARE-OF-SUMS.
           DISPLAY "SqOfSums: " SqOfSums.
           PERFORM CALCULATE-SUM-OF-SQUARES.
           DISPLAY "SumOfSq:  " SumOfSq.
           SUBTRACT SumOfSq FROM SqOfSums GIVING Result.
           DISPLAY "Result:   " Result.
           STOP RUN.

       CALCULATE-SQUARE-OF-SUMS.
           SET Counter TO 1.
           PERFORM ADD-NEXT-NOT-SQUARE-NUMBER UNTIL Counter>MaxCounter.
           COMPUTE Tmp = SqOfSums * SqOfSums;
           SET SqOfSums TO Tmp.
           SET Counter TO 1.

       ADD-NEXT-NOT-SQUARE-NUMBER.
           ADD Counter TO SqOfSums.
           ADD 1 TO Counter.

       CALCULATE-SUM-OF-SQUARES.
           SET Counter TO 1.
           PERFORM ADD-NEXT-SQUARE-NUMBER UNTIL Counter > MaxCounter.
           SET Counter TO 1.

       ADD-NEXT-SQUARE-NUMBER.
           COMPUTE Tmp = Counter * Counter;
           ADD Tmp TO SumOfSq.
           ADD 1 TO Counter.
