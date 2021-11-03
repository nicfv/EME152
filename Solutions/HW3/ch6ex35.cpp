#include <stdio.h>
#include <math.h>
#include <chplot.h>

double overdamped(double t)
{
  return 4.2 * exp(-1.57 * t) - 0.2 * exp(-54.2 * t);
}

double criticaldamped(double t)
{
  return 4 * (1 - 3 * t) * exp(-3 * t);
}

double underdamped(double t)
{
  return 4 * exp(-0.5 * t) * sin(3 * t + 2);
}

int main()
{
  double t0, tf, t;
  int num = 100; // number of points for plotting
  CPlot plot;

  t = 2;
  printf("Distance x for the overdamped system = %f\n", overdamped(t));
  printf("Distance x for the critically damped system = %f\n", criticaldamped(t));
  printf("Distance x for the underdamped system = %f\n", underdamped(t));

  t0 = 0;
  tf = 10;
  plot.title("Damped free vibration");
  plot.label(PLOT_AXIS_X, "time (second)");
  plot.label(PLOT_AXIS_Y, "x");
  plot.func2D(t0, tf, num, overdamped);
  plot.legend("overdamped", 0);
  plot.func2D(t0, tf, num, criticaldamped);
  plot.legend("critically damped", 1);
  plot.func2D(t0, tf, num, underdamped);
  plot.legend("underdamped", 2);
  plot.plotting();

  /* Settling Time Calculation:
     * Initial Value: 4
     * Final Value: 0
     * Settled Response Range: 0 +- 4(.02) = -.08 < 0 < .08 */
  /* General Solution Method: Go backwards from a time which we know the 
     * system to be settled. As soon as we encounter a time which the system 
     * is not in the 2% settled bounds, that is the settling time of the
     * system. */
  /* Overdamped */
  for (t = 20; t > 0; t = t - 0.01)
  {
    if (fabs(overdamped(t)) > 0.08)
    {
      printf("2 percent Ts overdamped: %lf seconds\n", t);
      break;
    }
  }

  /* Critically Damped */
  for (t = 20; t > 0; t = t - 0.01)
  {
    if (fabs(criticaldamped(t)) > 0.08)
    {
      printf("2 percent Ts critically damped: %lf seconds\n", t);
      break;
    }
  }

  /* Under Damped */
  for (t = 20; t > 0; t = t - 0.01)
  {
    if (fabs(underdamped(t)) > 0.08)
    {
      printf("2 percent Ts underdamped: %lf seconds\n", t);
      break;
    }
  }
}

/* text output in a console:
Distance x for the overdamped system = 0.181788
Distance x for the critically damped system = -0.049575
Distance x for the underdamped system = 1.455858

2 percent Ts overdamped: 2.520000 seconds
2 percent Ts critically damped: 1.790000 seconds
2 percent Ts underdamped: 7.390000 seconds
*/
