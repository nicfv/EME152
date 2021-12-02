
void position(double theta2, double x[1:6]) {
    complexsolve() // => theta3, theta4
    complexsolve() // => theta5, r6
    x[1] = theta3;
    x[2] = theta4;
    x[3] = theta5;
    x[4] = r6;
    x[5] = Px;
    x[6] = Py;
}

void velocity() {
    x[4] = v6x = v6;
}
