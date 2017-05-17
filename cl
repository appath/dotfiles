// Connect the required headers
#include <stdio.h>
#include <math.h>
// Connecting the MPI header file
#include "mpi.h"
 
// Function for intermediate calculations
Double f (double a)
{
    Return (4.0 / (1.0+ a * a));
}
 
// Main function of the program
Int main (int argc, char ** argv)
{
    // Declaration of variables
    Int done = 0, n, myid, numprocs, i;
    Double PI25DT = 3.141592653589793238462643;
    Double mypi, pi, h, sum, x;
    Double startwtime = 0.0, endwtime;
    Int namelen;
    Char processor_name [MPI_MAX_PROCESSOR_NAME];
 
    // Initialize the MPI subsystem
    MPI_Init (& argc, & argv);
    / / Get the size of the communicator MPI_COMM_WORLD
    // (the total number of processes within the task)
    MPI_Comm_size (MPI_COMM_WORLD, & numprocs);
    // Get the number of the current process within the
    // communicator MPI_COMM_WORLD
    MPI_Comm_rank (MPI_COMM_WORLD, & myid);
    MPI_Get_processor_name (processor_name, & namelen);
 
    // Output the thread number in the shared pool
    Fprintf (stdout, "Process% d of% d is on% s \ n", myid, numprocs, processor_name);
    Fflush (stdout);
 
    While (! Done)
    {
        // number of intervals
        If (myid == 0)
        {
            Fprintf (stdout, "Enter the number of intervals: (0 quits)");
            Fflush (stdout);
            If (scanf ("% d", & n)! = 1)
            {
                Fprintf (stdout, "No number entered; quitting \ n");
                N = 0;
            }
            Startwtime = MPI_Wtime ();
        }
        // Send out the number of intervals to all processes (including yourself)
        MPI_Bcast (& n, 1, MPI_INT, 0, MPI_COMM_WORLD);
        If (n == 0)
            Done = 1;
        Else
        {
            H = 1.0 / (double) n;
            Sum = 0.0;
            // Calculate the point assigned to the process
            For (i = myid + 1; (i <= n); i + = numprocs)
            {
                X = h * ((double) i - 0.5);
                Sum + = f (x);
            }
            Mypi = h * sum;
 
            // Reset results from all processes and addition
            MPI_Reduce (& mypi, & pi, 1, MPI_DOUBLE, MPI_SUM, 0, MPI_COMM_WORLD);
 
            // If this is the main process, the output of the result
            If (myid == 0)
            {
                Printf ("PI is approximately% .16f, Error is% .16f \ n", pi, fabs (pi - PI25DT));
                Endwtime = MPI_Wtime ();
                Printf ("wall clock time =% f \ n", endwtime-startwtime);
                Fflush (stdout);
            }
        }
    }
 
    // Release the MPI subsystem
    MPI_Finalize ();
    Return 0;
}
