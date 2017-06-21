/// Takes actual value in with bounds and returns decimal value
double inverseLerp(double min, double max, double value){
  return (value - min)/(max - min);
}