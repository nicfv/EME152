#ifndef _QUICKRETURN_H_
#define _QUICKRETURN_H_

#include <linkage.h>
#include <stdio.h>
#include <stdbool.h>
#include <stdarg.h>
#include <float.h>
#include <complex.h>
#include <chplot.h>

enum 
{
   SI,             //  SI units, use with uscUnit()
   USC,            //  USC units,  "    "    "
   QR_LINK_2,      //  Link 2
   QR_LINK_4,      //  Link 4
   QR_LINK_5,      //  Link 5
   QR_POINT_A,     //  Point A: point of slider 3
   QR_POINT_B,     //  Point B: end of Link 4
   QR_LINK_2_CG,   //  Center of Mass of Link 2
   QR_LINK_4_CG,   //  Center of Mass of Link 4
   QR_LINK_5_CG    //  Center of Mass of Link 5
};

enum      //  Pick which plots to output for plotForce()
{
   F12X = 1,
   F12Y = 2,
   MAG_F12 = 4,
   ALL_F12 = 7,
   F23X = 8,
   F23Y = 16,
   MAG_F23 = 32,
   ALL_F23 = 56,
   F14X = 64,
   F14Y = 128,
   MAG_F14 = 256,
   ALL_F14 = 448,
   MAG_F34 = 512,
   F45X = 1024,
   F45Y = 2048,
   MAG_F45 = 4096,
   ALL_F45 = 7168,
   F56X = 8192,
   F56Y = 16384,
   MAG_F56 = 32768,
   ALL_F56 = 57344,
   F16Y = 65536,
   ALL_MAG_PLOTS = 103204,
   ALL_FORCE_PLOTS = 131071
};

/**********************************************
 * CQuickReturn class definition
 *********************************************/

class CQuickReturn
{
   private:
      // Private data members
      double m_delta[1:5];     // phase angle of CG of links
      double m_inertia[1:5];   // inertia of the links
      double m_mass[1:6];      // mass of the links
      double m_omega[1:5];     // angular velocity
      double m_alpha[1:5];     // angular acceleration
      double m_r[1:8];         // lengths of links
      double m_rg[1:5];        // distance to CG of links
      double m_theta[1:7];     // phase angles for the links
      double m_r3_dot;         // first derivative of r7
      double m_r6_dot;         // first derivative of r9
      double m_r3_double_dot;  // second derivative of r7
      double m_r6_double_dot;  // second derivative of r9
      double m_load;           // external force or return slider
      double complex m_v3;     // velocity of slider 3
      double complex m_a3;     // acceleration of slider 3
      double complex m_ag2;    // acceleration of mass center of link 2
      double complex m_ag4;    // acceleration of mass center of link 4
      double complex m_ag5;    // acceleration of mass center of link 5
      int m_numpoints;         // number of points to plot or for animation
      bool m_uscunit;          // unit choice

      // Private function members 
      void m_initialize(void);              // initialize private members
      void calcPosition(double theta2);     // calc. ang. pos. and m_r9
      void calcVelocity(double theta2);     // calc. ang. vel. and r9 dot
      void calcAcceleration(double theta2); // calc. ang. accel. and r9 ddot
      void calcForce(double theta2, array double x[13]); // calc. forces

   public:
      // Constructor and Destructor
      CQuickReturn();
      ~CQuickReturn();

      // Setting information functions
      void setLinks(double r1, r2, r4, r5, r7, theta1);
      void setAngVel(double initomega2);
      void setGravityCenter(double rg2, rg4, rg5, delta2, delta4, delta5);
      void setInertia(double ig2, ig4, ig5);
      void setMass(double m2, m3, m4, m5, m6);
      void setForce(double fl);
      void setNumPoints(int numpoints);
      void uscUnit(bool unit); 

      // Output information functions
      double sliderPos(double theta2);
      double sliderVel(double theta2);
      double sliderAccel(double theta2);
      double getRequiredTorque(double theta2);
      void sliderRange(double& max, double& min);

      // Output display functions
      void displayPosition(double theta2, ...);
      void animation(...);

      // Plot information functions
      void plotSliderPos(CPlot *plot);
      void plotSliderVel(CPlot *plot);
      void plotSliderAccel(CPlot *plot);
      void plotAngPos(CPlot *plot);
      void plotAngVel(CPlot *plot);
      void plotAngAccel(CPlot *plot);
      void plotCGaccel(CPlot *plot);
      void plotForce(int plot_output, CPlot *plot);
      void plotTorque(CPlot *plot);

      // Information for specified point or link
      double getAngPos(double theta2, int link);
      double getAngVel(double theta2, int link);
      double getAngAccel(double theta2, int link);
      double complex getPointPos(double theta2, int point);
      double complex getPointVel(double theta2, int point);
      double complex getPointAccel(double theta2, int point);
      void getForces(double theta2, array double y[12]);
};

#pragma importf <CQuickReturn.chf>

#endif
