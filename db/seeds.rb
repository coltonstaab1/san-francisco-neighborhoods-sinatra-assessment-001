Neighborhood.create(name:"Mission",number_inhabitants: 1000 ,year_founded:1650)
Neighborhood.create(name:"Cole Valley",number_inhabitants: 2500,year_founded:1925)
Neighborhood.create(name:"Castro",number_inhabitants: 7500 ,year_founded:1900)
User.create(first_name: "Colton", last_name: "Staab", email:"colton.staab@gmail.com",neighborhood_id: "2",password:"ilovecats")
User.create(first_name: "Ken", last_name: "Saathoff", email:"ken.saathoff@gmail.com",neighborhood_id: "1",password:"meow")
User.create(first_name: "Keith", last_name: "Washington", email:"washington.j.keith@gmail.com",neighborhood_id: "1",password:"bowwowwow")
User.create(first_name: "Tommy", last_name: "Tessier", email:"tntessier@gmail.com",neighborhood_id: "3",password:"gomules")
Landmark.create(name:"Coffee Bar",address:"1890 Bryant St, San Francisco, CA 94110",landmark_type:"Restaurant",neighborhood_id:"1")
Landmark.create(name:"Hi Tops",address:"2247 Market St, San Francisco, CA 94114",landmark_type:"Bar",neighborhood_id:"3")
Landmark.create(name:"Alamo Drafthouse",address:"Movie theater",landmark_type:"2550 Mission St, San Francisco, CA 94110",neighborhood_id:"1")
Landmark.create(name:"Zazie",address:"941 Cole St, San Francisco, CA 94117",landmark_type:"Restaurant",neighborhood_id:"2")
Landmark.create(name:"Ice Cream Bar",address:"815 Cole St, San Francisco, CA 94117",landmark_type:"Restaurant",neighborhood_id:"2")
Landmark.create(name:"Soulcycle",address:"400 Castro St, San Francisco, CA 94114",landmark_type:"Gym",neighborhood_id:"3")