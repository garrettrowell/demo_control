Facter.add('evil') do
  setcode do
    result = Hash.new
    time = Time.new
    result['microseconds'] = time.usec
    result['microseconds_mod4'] = result['microseconds'] % 4
    result
  end
end
