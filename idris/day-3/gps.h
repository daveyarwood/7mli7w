#include <string>
#include <vector>

class Trip
{
  public:
    class Point
    {
      public:
        Point(double lat, double lon, double time);

        double lat()  const;
        double lon()  const;
        double time() const;

        // ...
    };

    void addPoint(double lat, double lon, double time);

    void setName(const std::string& name);
    std::string name() const;

    size_t count() const;
    const Point& getPoint(size_t index) const;

    // ...
};

