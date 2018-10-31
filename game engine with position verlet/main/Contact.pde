class Contact{
  // B to A
  PVector collisionVector;
  float p_depth;
  Composite A, B;
  int type;
  static final int Particle_Particle = 0;
  static final int Particle_Polygon = 1;
  static final int Polygon_Polygon = 2;
}
