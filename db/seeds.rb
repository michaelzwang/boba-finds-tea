require 'faker'


# Users
xin = User.create!(full_name:  "Xin Zhang",
            username: "ficxin",
             email: "xin@dbc.com",
             password: "nomnom")

michael = User.create!(full_name:  "Michael Wang",
            username: "mwang",
             email: "mw@dbc.com",
             password: "nomnom")

norberto = User.create!(full_name:  "Norberto Caceres",
            username: "norbe94",
             email: "norbe94@dbc.com",
             password: "nomnom")

post1= Post.create(
                image_url: 'https://41.media.tumblr.com/tumblr_ls5wvhqvT81qa81sno1_500.png',
                cafe_name: "Lollicup",
                street: '2700 Alton Pkwy',
                city: 'Irvine',
                state:'CA',
                yelp_url:'http://www.yelp.com/biz/lollicup-irvine',
                price: '3.25',
                quality: 'plush',
                description: "I admit I haven't tried many drinks because my favorite and usual drink is always so great.")
GeoCoder.update_post_with_coordinates(post1)
xin.posts << post1

post2 = Post.create(
                image_url: 'https://40.media.tumblr.com/tumblr_mbr3atwr7c1qgpopxo1_500.jpg',
                cafe_name: "Trinitea",
                street: "3865 Fifth Ave",
                city: "San Diego",
                state: "CA",
                yelp_url: "http://www.yelp.com/biz/trinitea-tea-san-diego-2",
                price: "3.45",
                quality: "chewy",
                description: "I always choose half sweet, because the honey boba adds enough sweetness that I don't need as much sweetness in the tea.")
GeoCoder.update_post_with_coordinates(post2)
xin.posts << post2

post3=Post.create(
                image_url: 'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcTsBpJ65yLObcry90nIQaMihGXNb17ks4HsX_KEcZKFUxRjUKKP',
                cafe_name: "Infini Tea",
                street: "4690 Convoy St",
                city: "San Diego",
                state: "CA",
                yelp_url: "http://www.yelp.com/biz/infini-tea-san-diego-2",
                price: "4.56",
                quality: "plush",
                description: "Infini-Tea is a typical Taiwan Tea place that has ok tea drinks and a really good milk slush with Coffee Jelly" )
GeoCoder.update_post_with_coordinates(post3)
michael.posts << post3


post4=Post.create(
                image_url: 'http://s3-media3.fl.yelpcdn.com/bphoto/Z1hBpIy2g-_nJwlWRfFNjg/o.jpg',
                cafe_name: "Boba Guys",
                street: "429 Stockton St",
                city: "San Francisco",
                state: "CA",
                yelp_url: "http://www.yelp.com/biz/boba-guys-san-francisco-6",
                price: "9.90",
                quality: "hard",
                description: "New hidden gem in ct. I wouldn't say I would come here often mainly cause I dont usually eat this food.")
GeoCoder.update_post_with_coordinates(post4)
michael.posts << post4

post5=Post.create(
                image_url: 'http://s3-media1.fl.yelpcdn.com/bphoto/HGtuZrC-Bsqh9WWkYDX9zA/o.jpg',
                cafe_name: "Boba Guys",
                street: "429 Stockton St",
                city: "San Francisco",
                state: "CA",
                yelp_url: "http://www.yelp.com/biz/boba-guys-san-francisco-6",
                price: "4.90",
                quality: "hard",
                description: "Such cute place , love their esthetic and friendly service ...the almond jelly in my drink was so cool!")
GeoCoder.update_post_with_coordinates(post5)
norberto.posts << post5


post6=Post.create(
                image_url: 'http://s3-media4.fl.yelpcdn.com/bphoto/ZJj7WZQzG198v-FNG48K6w/o.jpg',
                cafe_name: "Boba Guys",
                street: "429 Stockton St",
                city: "San Francisco",
                state: "CA",
                yelp_url: "http://www.yelp.com/biz/boba-guys-san-francisco-6",
                price: "4.90",
                quality: "aight",
                description: "New hidden gem in ct. I wouldn't say I would come here often mainly cause I dont usually eat this food.")
GeoCoder.update_post_with_coordinates(post6)
norberto.posts << post6




