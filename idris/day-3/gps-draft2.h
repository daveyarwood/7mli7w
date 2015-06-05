#include <string>
#include <vector>

template <typename Location>
class Trip
{
  public:
    Location operator()(double);

    // ...
};

typedef std::pair<double, double> BikeLocation;
typedef Trip<BikeLocation> BikeTrip;
