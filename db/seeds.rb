# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#  cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#  Mayor.create(name: 'Emanuel', city: cities.first)

rates = [
{ min_age:  00  , max_age:  19  , percentage:   0.31  , person_type:  "Employee"  , smoking:  FALSE } ,
{ min_age:  20  , max_age:  24  , percentage:   0.31  , person_type:  "Employee"  , smoking:  FALSE } ,
{ min_age:  25  , max_age:  29  , percentage:   0.36  , person_type:  "Employee"  , smoking:  FALSE } ,
{ min_age:  30  , max_age:  34  , percentage:   0.45  , person_type:  "Employee"  , smoking:  FALSE } ,
{ min_age:  35  , max_age:  39  , percentage:   0.63  , person_type:  "Employee"  , smoking:  FALSE } ,
{ min_age:  40  , max_age:  44  , percentage:   0.87  , person_type:  "Employee"  , smoking:  FALSE } ,
{ min_age:  45  , max_age:  49  , percentage:   1.38  , person_type:  "Employee"  , smoking:  FALSE } ,
{ min_age:  50  , max_age:  54  , percentage:   2.11  , person_type:  "Employee"  , smoking:  FALSE } ,
{ min_age:  55  , max_age:  59  , percentage:   3.43  , person_type:  "Employee"  , smoking:  FALSE } ,
{ min_age:  60  , max_age:  64  , percentage:   5.46  , person_type:  "Employee"  , smoking:  FALSE } ,
{ min_age:  65  , max_age:  69  , percentage:   9.58  , person_type:  "Employee"  , smoking:  FALSE } ,
{ min_age:  70  , max_age:  74  , percentage:   21.50   , person_type:  "Employee"  , smoking:  FALSE } ,
{ min_age:  75  , max_age:  100  , percentage:   35.08   , person_type:  "Employee"  , smoking:  FALSE } ,
{ min_age:  00  , max_age:  19  , percentage:   0.47  , person_type:  "Employee"  , smoking:  TRUE  } ,
{ min_age:  20  , max_age:  24  , percentage:   0.47  , person_type:  "Employee"  , smoking:  TRUE  } ,
{ min_age:  25  , max_age:  29  , percentage:   0.53  , person_type:  "Employee"  , smoking:  TRUE  } ,
{ min_age:  30  , max_age:  34  , percentage:   0.67  , person_type:  "Employee"  , smoking:  TRUE  } ,
{ min_age:  35  , max_age:  39  , percentage:   1.01  , person_type:  "Employee"  , smoking:  TRUE  } ,
{ min_age:  40  , max_age:  44  , percentage:   1.52  , person_type:  "Employee"  , smoking:  TRUE  } ,
{ min_age:  45  , max_age:  49  , percentage:   2.41  , person_type:  "Employee"  , smoking:  TRUE  } ,
{ min_age:  50  , max_age:  54  , percentage:   4.06  , person_type:  "Employee"  , smoking:  TRUE  } ,
{ min_age:  55  , max_age:  59  , percentage:   5.71  , person_type:  "Employee"  , smoking:  TRUE  } ,
{ min_age:  60  , max_age:  64  , percentage:   8.51  , person_type:  "Employee"  , smoking:  TRUE  } ,
{ min_age:  65  , max_age:  69  , percentage:   14.20   , person_type:  "Employee"  , smoking:  TRUE  } ,
{ min_age:  70  , max_age:  74  , percentage:   24.96   , person_type:  "Employee"  , smoking:  TRUE  } ,
{ min_age:  75  , max_age:  100  , percentage:   45.26   , person_type:  "Employee"  , smoking:  TRUE  } ,
{ min_age:  00  , max_age:  19  , percentage:   0.33  , person_type:  "Spouse"  , smoking:  FALSE } ,
{ min_age:  20  , max_age:  24  , percentage:   0.39  , person_type:  "Spouse"  , smoking:  FALSE } ,
{ min_age:  25  , max_age:  29  , percentage:   0.45  , person_type:  "Spouse"  , smoking:  FALSE } ,
{ min_age:  30  , max_age:  34  , percentage:   0.53  , person_type:  "Spouse"  , smoking:  FALSE } ,
{ min_age:  35  , max_age:  39  , percentage:   0.62  , person_type:  "Spouse"  , smoking:  FALSE } ,
{ min_age:  40  , max_age:  44  , percentage:   0.93  , person_type:  "Spouse"  , smoking:  FALSE } ,
{ min_age:  45  , max_age:  49  , percentage:   1.50  , person_type:  "Spouse"  , smoking:  FALSE } ,
{ min_age:  50  , max_age:  54  , percentage:   2.50  , person_type:  "Spouse"  , smoking:  FALSE } ,
{ min_age:  55  , max_age:  59  , percentage:   4.08  , person_type:  "Spouse"  , smoking:  FALSE } ,
{ min_age:  60  , max_age:  64  , percentage:   5.72  , person_type:  "Spouse"  , smoking:  FALSE } ,
{ min_age:  65  , max_age:  69  , percentage:   8.82  , person_type:  "Spouse"  , smoking:  FALSE } ,
{ min_age:  70  , max_age:  74  , percentage:   19.35   , person_type:  "Spouse"  , smoking:  FALSE } ,
{ min_age:  75  , max_age:  100  , percentage:   19.35   , person_type:  "Spouse"  , smoking:  FALSE } ,
{ min_age:  00  , max_age:  19  , percentage:   0.56  , person_type:  "Spouse"  , smoking:  TRUE  } ,
{ min_age:  20  , max_age:  24  , percentage:   0.65  , person_type:  "Spouse"  , smoking:  TRUE  } ,
{ min_age:  25  , max_age:  29  , percentage:   0.76  , person_type:  "Spouse"  , smoking:  TRUE  } ,
{ min_age:  30  , max_age:  34  , percentage:   1.04  , person_type:  "Spouse"  , smoking:  TRUE  } ,
{ min_age:  35  , max_age:  39  , percentage:   1.31  , person_type:  "Spouse"  , smoking:  TRUE  } ,
{ min_age:  40  , max_age:  44  , percentage:   1.98  , person_type:  "Spouse"  , smoking:  TRUE  } ,
{ min_age:  45  , max_age:  49  , percentage:   3.26  , person_type:  "Spouse"  , smoking:  TRUE  } ,
{ min_age:  50  , max_age:  54  , percentage:   5.29  , person_type:  "Spouse"  , smoking:  TRUE  } ,
{ min_age:  55  , max_age:  59  , percentage:   7.66  , person_type:  "Spouse"  , smoking:  TRUE  } ,
{ min_age:  60  , max_age:  64  , percentage:   9.44  , person_type:  "Spouse"  , smoking:  TRUE  } ,
{ min_age:  65  , max_age:  69  , percentage:   13.08   , person_type:  "Spouse"  , smoking:  TRUE  } ,
{ min_age:  70  , max_age:  74  , percentage:   26.52   , person_type:  "Spouse"  , smoking:  TRUE  } ,
{ min_age:  75  , max_age:  100  , percentage:   26.52   , person_type:  "Spouse"  , smoking:  TRUE  }]

rates.each { |rate| Rate.create(rate) }


coverages = (1..30).map { |i| i * 10000 }

coverages.each { |coverage| Coverage.create(amount: coverage)}
