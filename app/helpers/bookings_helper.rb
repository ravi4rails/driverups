module BookingsHelper


  def distance_between(point1, point2, options = {})
    # convert to coordinate arrays
    point1 = extract_coordinates(point1)
    point2 = extract_coordinates(point2)

    # convert degrees to radians
    point1 = to_radians(point1)
    point2 = to_radians(point2)

    # compute deltas
    dlat = point2[0] - point1[0]
    dlon = point2[1] - point1[1]

    a = (Math.sin(dlat / 2))**2 + Math.cos(point1[0]) *
        (Math.sin(dlon / 2))**2 * Math.cos(point2[0])
    c = 2 * Math.atan2( Math.sqrt(a), Math.sqrt(1-a))
    c * earth_radius(options[:units])
  end


  def to_radians(*args)
    args = args.first if args.first.is_a?(Array)
    if args.size == 1
      args.first * (Math::PI / 180)
    else
      args.map{ |i| to_radians(i) }
    end
  end

end
