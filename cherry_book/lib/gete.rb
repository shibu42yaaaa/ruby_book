class Gate
  SATATIONS = [:umeda, :juso, :mikuni]
  FARES = [150, 190] 
  def initialize(name)
    @name = name
  end

  def enter(ticket)
    ticket.stamp(@name)
  end

  def exit(ticket)
    fare = calc_fare(ticket)
    fare <= ticket.fare
  end

  def calc_fare(ticket)
    from = SATATIONS.index(ticket.stamped_at)
    to = SATATIONS.index(@name)
    distance = to - from
    FARES[distance - 1]
  end
end

