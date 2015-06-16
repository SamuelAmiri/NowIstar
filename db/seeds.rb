# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

categories = Category.create
	([
	{name: 'Art & Creative'},
	{name: 'Automotive & Bike'},
	{name: 'Beauty'},
	{name: 'Business & Finance'},
	{name: 'Child & Elderly Care'},
	{name: 'Classes, Tutors & Teachers'},
	{name: 'Computers & Tech'},
	{name: 'Event'},
	{name: 'Health & Therapy'},
	{name: 'Household'},
	{name: 'Landscape & Garden'},
	{name: 'Legal'},
	{name: 'Maintenance'},
	{name: 'Music & Instruments'},
	{name: 'Pets & Animals'},
	{name: 'Real Estate'},
	{name: 'Travel & Vacation'},
	])

subcategories = Subcategory.create
	([
	{category_id: 1 , name: 'Dance' },
	{category_id: 1 , name: 'Paint' },
	{category_id: 1 , name: 'Performance' },
	{category_id: 1 , name: 'Photography' },
	{category_id: 1 , name: 'Modeling' },
	{category_id: 1 , name: 'Tattoo' },
	{category_id: 1 , name: 'Videography' },

	{category_id: 2 , name: 'Auto Repair' },
	{category_id: 2 , name: 'Body Work & Paint' },
	{category_id: 2 , name: 'Car Wash & Detailing' },
	{category_id: 2 , name: 'Stereos & Speakers' }
	{category_id: 2 , name: 'Tint & Window Repair' },
	{category_id: 2 , name: '' },

	{category_id: 3 , name: 'Make Up' },
	{category_id: 3 , name: 'Manicure & Pedicure' },
	{category_id: 3 , name: 'Hair Styling' },
	{category_id: 3 , name: 'Esthetician' },
	{category_id: 3 , name: 'Wardrobe Styling' },
	{category_id: 3 , name: 'Facials & Waxing' },

	{category_id: 4 , name: 'Accounting & Taxes' }
	{category_id: 4 , name: 'Business Advisory & Consulting' }
	{category_id: 4 , name: 'Recruiting' }
	{category_id: 4 , name: 'Financial Services & Planning' }
	{category_id: 4 , name: 'Insurance' }

	{category_id: 5 , name: 'Child Care' }
	{category_id: 5 , name: 'Eldery Care' }
	{category_id: 5 , name: 'Pet Care & Boarding' }
	{category_id: 5 , name: 'House Sitting' }

	{category_id: 6 , name: 'Private Tutoring' }
	{category_id: 6 , name: 'Music Lessons' }
	{category_id: 6 , name: 'Acting Instruction' }
	{category_id: 6 , name: 'Art Instruction' }
	{category_id: 6 , name: 'Language Instruction' }
	])


